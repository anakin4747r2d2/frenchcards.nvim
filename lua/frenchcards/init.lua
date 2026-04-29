local M = {}

math.randomseed(os.time())

local cards_path = debug.getinfo(1, "S").source:sub(2):match("(.*/)") .. "../../cards.json"
local f = assert(io.open(cards_path, "r"), "frenchcards: cannot open " .. cards_path)
M.cards = vim.json.decode(f:read("*a"))
f:close()


--- Trim leading/trailing whitespace from a string.
---@param s string
---@return string
function M.trim(s)
    return (s:match("^%s*(.-)%s*$") or "")
end

--- Check whether a user's answer matches the expected answer (case-insensitive).
---@param user_answer string  raw text from the buffer
---@param expected string     the correct answer
---@return boolean
function M.is_correct(user_answer, expected)
    return M.trim(user_answer):lower() == M.trim(expected):lower()
end

--- Pick a random card, optionally flipping q/a.
--- Accepts an optional rng function for deterministic testing.
---@param rng_float? fun(): number  returns a value in [0,1)
---@param rng_int?   fun(n: integer): integer  returns a value in [1,n]
---@return { q: string, a: string, meta?: string }
function M.pick_card(rng_float, rng_int)
    rng_float = rng_float or math.random
    rng_int   = rng_int   or math.random
    local card = M.cards[rng_int(#M.cards)]
    if rng_float() > 0.5 then
        return { q = card.a, a = card.q, meta = card.meta }
    end
    return { q = card.q, a = card.a, meta = card.meta }
end

--- Build the buffer lines for a given card.
---@param card { q: string, a: string, meta?: string }
---@return string[]
function M.card_lines(card)
    local meta_line = card.meta and ("[" .. card.meta .. "]") or ""
    return {
        "",
        card.q,
        meta_line,
        "",
        "Type your answer below and press Enter:",
        "",
        "",
    }
end

-- ── Neovim UI (only wired up when running inside Neovim) ─────────────────────

local buf = nil
local win = nil
M.current_card = nil

local function check_answer()
    if not buf or not vim.api.nvim_buf_is_valid(buf) then return end
    local line_count = vim.api.nvim_buf_line_count(buf)
    local lines = vim.api.nvim_buf_get_lines(buf, line_count - 1, line_count, false)
    local user_answer = lines[1] or ""
    if M.is_correct(user_answer, M.current_card.a) then
        vim.api.nvim_echo({{ "Correct! The answer is: " .. M.current_card.a, "Title" }}, false, {})
    else
        vim.api.nvim_echo({{ "Incorrect.", "ErrorMsg" }}, false, {})
    end
end

local function show_answer()
    if not buf or not vim.api.nvim_buf_is_valid(buf) or not M.current_card then return end
    vim.api.nvim_echo({{ "The correct answer is: " .. M.current_card.a, "WarningMsg" }}, false, {})
end

function M.open_flashcard()
    M.current_card = M.pick_card()

    if win and vim.api.nvim_win_is_valid(win) then
        -- Reuse the existing window: create a fresh buffer and swap it in
        buf = vim.api.nvim_create_buf(false, true)
        vim.api.nvim_win_set_buf(win, buf)
    else
        -- No flashcard window yet — open a new buffer in the current window
        vim.cmd("enew")
        buf = vim.api.nvim_get_current_buf()
        win = vim.api.nvim_get_current_win()
    end

    vim.bo[buf].buftype  = "nofile"
    vim.bo[buf].bufhidden = "wipe"
    vim.bo[buf].swapfile  = false

    vim.api.nvim_buf_set_lines(buf, 0, -1, false, M.card_lines(M.current_card))

    local line_count = vim.api.nvim_buf_line_count(buf)
    vim.api.nvim_win_set_cursor(0, { line_count, 0 })

    vim.keymap.set({ 'n', 'i' }, '<CR>', function()
        vim.cmd("stopinsert")
        vim.schedule(check_answer)
    end, { buffer = buf })

    vim.keymap.set('n', '\\\\', function()
        show_answer()
    end, { buffer = buf })
end

return M
