local M = {}

math.randomseed(os.time())

M.cards = {
    { q = "I will speak to him", a = "Je lui parlerai" },
    { q = "They do not have", a = "Ils n'ont pas", meta = "masc" },
    { q = "You come", a = "Tu viens", meta = "informal" },
    { q = "I knew", a = "Je savais" },
    { q = "He will be able to", a = "Il pourra" },
    { q = "I see him", a = "Je le vois" },
    { q = "We can", a = "Nous pouvons", meta = "nous" },
    { q = "I do not take", a = "Je ne prends pas" },
    { q = "They do not go there", a = "Ils n'y vont pas", meta = "masc" },
    { q = "I do not do/make", a = "Je ne fais pas" },
    { q = "They will be", a = "Ils seront", meta = "masc" },
    { q = "I have", a = "J'ai" },
    { q = "I come", a = "Je viens" },
    { q = "We went", a = "Nous sommes allés", meta = "nous, masc" },
    { q = "I was doing", a = "Je faisais" },
    { q = "We are not going", a = "Nous n'allons pas", meta = "nous" },
    { q = "I do not know", a = "Je ne sais pas" },
    { q = "He comes", a = "Il vient" },
    { q = "You will have", a = "Tu auras", meta = "informal" },
    { q = "I want some", a = "J'en veux" },
    { q = "I know a fact", a = "Je sais" },
    { q = "He will go", a = "Il ira" },
    { q = "We are", a = "On est", meta = "on" },
    { q = "They will do/make", a = "Ils feront", meta = "masc" },
    { q = "I take", a = "Je prends" },
    { q = "I got up", a = "Je me suis levé", meta = "masc" },
    { q = "We just came", a = "Nous venons de venir", meta = "nous" },
    { q = "I wanted", a = "J'ai voulu" },
    { q = "They can", a = "Ils peuvent", meta = "masc" },
    { q = "You have", a = "Tu as", meta = "informal" },
    { q = "I spoke to him", a = "Je lui ai parlé" },
    { q = "I will be", a = "Je serai" },
    { q = "He comes from there", a = "Il en vient" },
    { q = "We have been", a = "Nous avons été", meta = "nous" },
    { q = "I have been", a = "J'ai été" },
    { q = "He gives it to me", a = "Il me le donne", meta = "le" },
    { q = "They will have", a = "Ils auront", meta = "masc" },
    { q = "I do not want", a = "Je ne veux pas" },
    { q = "I do/make", a = "Je fais" },
    { q = "You want", a = "Vous voulez", meta = "formal" },
    { q = "He has been", a = "Il a été" },
    { q = "We have", a = "Nous avons", meta = "nous" },
    { q = "He had", a = "Il avait" },
    { q = "I will want", a = "Je voudrai" },
    { q = "He does not know it", a = "Il ne le sait pas" },
    { q = "She got up", a = "Elle s'est levée" },
    { q = "We know", a = "Nous savons", meta = "nous" },
    { q = "We did/made", a = "Nous avons fait", meta = "nous" },
    { q = "She is", a = "Elle est" },
    { q = "He was doing", a = "Il faisait" },
    { q = "He does/makes", a = "Il fait" },
    { q = "I give them to her", a = "Je les lui donne" },
    { q = "I speak to him", a = "Je lui parle" },
    { q = "I talk about it", a = "J'en parle" },
    { q = "I am getting up", a = "Je suis en train de me lever" },
    { q = "I just came", a = "Je viens de venir" },
    { q = "He goes there", a = "Il y va" },
    { q = "I take some", a = "J'en prends" },
    { q = "I am doing it", a = "Je le fais", meta = "le" },
    { q = "He takes some", a = "Il en prend" },
    { q = "I am thinking about it", a = "J'y pense" },
    { q = "You take", a = "Tu prends", meta = "informal" },
    { q = "I was going", a = "J'allais" },
    { q = "He sees", a = "Il voit" },
    { q = "I saw", a = "J'ai vu" },
    { q = "I will come", a = "Je viendrai" },
    { q = "I would like", a = "Je voudrais" },
    { q = "We would be able to", a = "Nous pourrions", meta = "nous" },
    { q = "They were going", a = "Ils allaient", meta = "masc" },
    { q = "You take", a = "Vous prenez", meta = "formal" },
    { q = "I do not speak to him", a = "Je ne lui parle pas" },
    { q = "You do/make", a = "Vous faites", meta = "formal" },
    { q = "I will know", a = "Je saurai" },
    { q = "He was", a = "Il était" },
    { q = "I do not want it", a = "Je ne le veux pas", meta = "le" },
    { q = "Do not go there", a = "N'y va pas", meta = "informal" },
    { q = "I see her", a = "Je la vois" },
    { q = "I would be", a = "Je serais" },
    { q = "You know", a = "Tu sais", meta = "informal" },
    { q = "He wants", a = "Il veut" },
    { q = "They come", a = "Ils viennent", meta = "masc" },
    { q = "I will see", a = "Je verrai" },
    { q = "I do not take any", a = "Je n'en prends pas" },
    { q = "I give it to him", a = "Je le lui donne", meta = "le" },
    { q = "They have", a = "Ils ont", meta = "masc" },
    { q = "They were", a = "Ils étaient", meta = "masc" },
    { q = "He would like", a = "Il voudrait" },
    { q = "I speak to her", a = "Je lui parle" },
    { q = "He will be", a = "Il sera" },
    { q = "They want", a = "Ils veulent", meta = "masc" },
    { q = "I would be able to", a = "Je pourrais" },
    { q = "He has", a = "Il a" },
    { q = "You have", a = "Vous avez", meta = "formal/plural" },
    { q = "I speak to them", a = "Je leur parle" },
    { q = "I do not think about it", a = "Je n'y pense pas" },
    { q = "I am not", a = "Je ne suis pas" },
    { q = "We see", a = "Nous voyons", meta = "nous" },
    { q = "He knows", a = "Il sait" },
    { q = "I go there", a = "J'y vais" },
    { q = "You can", a = "Tu peux", meta = "informal" },
    { q = "I did not get up", a = "Je ne me suis pas levé", meta = "masc" },
    { q = "He is not", a = "Il n'est pas" },
    { q = "She came", a = "Elle est venue" },
    { q = "They give it to us", a = "Ils nous la donnent", meta = "masc, la" },
    { q = "I do not want any", a = "Je n'en veux pas" },
    { q = "They see", a = "Ils voient", meta = "masc" },
    { q = "I would have", a = "J'aurais" },
    { q = "I see", a = "Je vois" },
    { q = "We do/make", a = "Nous faisons", meta = "nous" },
    { q = "I go", a = "Je vais" },
    { q = "They get up", a = "Ils se lèvent", meta = "masc" },
    { q = "You see", a = "Tu vois", meta = "informal" },
    { q = "He goes", a = "Il va" },
    { q = "He is doing it", a = "Il la fait", meta = "la" },
    { q = "You would be", a = "Tu serais", meta = "informal" },
    { q = "We are", a = "Nous sommes", meta = "nous" },
    { q = "I come from there", a = "J'en viens" },
    { q = "We will go", a = "Nous irons", meta = "nous" },
    { q = "They are", a = "Elles sont", meta = "fem" },
    { q = "I want it", a = "Je le veux", meta = "le" },
    { q = "We take", a = "Nous prenons", meta = "nous" },
    { q = "I came", a = "Je suis venu", meta = "masc" },
    { q = "We go", a = "Nous allons", meta = "nous" },
    { q = "I did/made", a = "J'ai fait" },
    { q = "They cannot", a = "Ils ne peuvent pas", meta = "masc" },
    { q = "He gets up", a = "Il se lève" },
    { q = "I will have", a = "J'aurai" },
    { q = "I will do/make", a = "Je ferai" },
    { q = "They do/make", a = "Ils font", meta = "masc" },
    { q = "You do/make", a = "Tu fais", meta = "informal" },
    { q = "I am", a = "Je suis" },
    { q = "He takes", a = "Il prend" },
    { q = "They take", a = "Ils prennent", meta = "masc" },
    { q = "We will be", a = "Nous serons", meta = "nous" },
    { q = "I will go", a = "J'irai" },
    { q = "I had", a = "J'ai eu" },
    { q = "You come", a = "Vous venez", meta = "formal" },
    { q = "He would have", a = "Il aurait" },
    { q = "I had", a = "J'avais" },
    { q = "Go there", a = "Vas-y", meta = "informal" },
    { q = "I do not give it to him", a = "Je ne le lui donne pas", meta = "le" },
    { q = "I see them", a = "Je les vois" },
    { q = "He can", a = "Il peut" },
    { q = "I went", a = "Je suis allé", meta = "masc" },
    { q = "I send it to you", a = "Je vous l'envoie", meta = "le, formal" },
    { q = "You want", a = "Tu veux", meta = "informal" },
    { q = "We could", a = "Nous avons pu", meta = "nous" },
    { q = "We had", a = "Nous avions", meta = "nous" },
    { q = "You will be", a = "Tu seras", meta = "informal" },
    { q = "You see", a = "Vous voyez", meta = "formal" },
    { q = "I do not go there", a = "Je n'y vais pas" },
    { q = "You get up", a = "Vous vous levez", meta = "formal" },
    { q = "I do not see", a = "Je ne vois pas" },
    { q = "We come", a = "Nous venons", meta = "nous" },
    { q = "I do not see them", a = "Je ne les vois pas" },
    { q = "We go there", a = "Nous y allons", meta = "nous" },
    { q = "I was", a = "J'étais" },
    { q = "I know it", a = "Je le sais", meta = "le" },
    { q = "I took", a = "J'ai pris" },
    { q = "You are", a = "Vous êtes", meta = "formal/plural" },
    { q = "I gave it to him", a = "Je le lui ai donné", meta = "le" },
    { q = "You get up", a = "Tu te lèves", meta = "informal" },
    { q = "Eat some", a = "Manges-en", meta = "informal" },
    { q = "I get up", a = "Je me lève" },
    { q = "They go", a = "Ils vont", meta = "masc" },
    { q = "We get up", a = "Nous nous levons", meta = "nous" },
    { q = "You go", a = "Vous allez", meta = "formal/plural" },
    { q = "You were", a = "Tu étais", meta = "informal" },
    { q = "You can", a = "Vous pouvez", meta = "formal" },
    { q = "I could", a = "J'ai pu" },
    { q = "You are", a = "Tu es", meta = "informal" },
    { q = "We had", a = "Nous avons eu", meta = "nous" },
    { q = "I want", a = "Je veux" },
    { q = "You go", a = "Tu vas", meta = "informal" },
    { q = "He is", a = "Il est" },
    { q = "I will be able to", a = "Je pourrai" },
    { q = "We would like", a = "Nous voudrions", meta = "nous" },
    { q = "He will come", a = "Il viendra" },
    { q = "I am not going", a = "Je ne vais pas" },
    { q = "I do not have", a = "Je n'ai pas" },
    { q = "They know", a = "Ils savent", meta = "masc" },
    { q = "She went", a = "Elle est allée" },
    { q = "I cannot", a = "Je ne peux pas" },
    { q = "We were", a = "Nous étions", meta = "nous" },
    { q = "You know", a = "Vous savez", meta = "formal" },
    { q = "I can", a = "Je peux" },
    { q = "We want", a = "Nous voulons", meta = "nous" },
    { q = "They are", a = "Ils sont", meta = "masc" },
    { q = "I will take", a = "Je prendrai" },
    { q = "I wake up", a = "Je me réveille" },
    { q = "You woke up", a = "Tu t'es réveillé", meta = "informal, masc" },
    { q = "We will hurry", a = "Nous nous dépêcherons", meta = "nous" },
    { q = "They were remembering", a = "Ils se souvenaient", meta = "masc" },
    { q = "She would rest", a = "Elle se reposerait" },
    { q = "I am brushing my teeth", a = "Je me brosse les dents" },
    { q = "He fell asleep", a = "Il s'est endormi" },
    { q = "We used to take a walk", a = "Nous nous promenions", meta = "nous" },
    { q = "You will have fun", a = "Vous vous amuserez", meta = "formal" },
    { q = "They would dress themselves", a = "Elles s'habilleraient", meta = "fem" },
    { q = "I did not wake up", a = "Je ne me suis pas réveillé", meta = "masc" },
    { q = "He is not hurrying", a = "Il ne se dépêche pas" },
    { q = "She remembered", a = "Elle s'est souvenue" },
    { q = "We do not remember", a = "Nous ne nous souvenons pas", meta = "nous" },
    { q = "I will wash myself", a = "Je me laverai" },
    { q = "You were resting", a = "Tu te reposais", meta = "informal" },
    { q = "They had fun", a = "Ils se sont amusés", meta = "masc" },
    { q = "I would remember", a = "Je me souviendrais" },
    { q = "We wash ourselves", a = "Nous nous lavons", meta = "nous" },
    { q = "She is getting dressed", a = "Elle s'habille" },
    { q = "I hurried", a = "Je me suis dépêché", meta = "masc" },
    { q = "You do not fall asleep", a = "Tu ne t'endors pas", meta = "informal" },
    { q = "They will take a walk", a = "Elles se promèneront", meta = "fem" },
    { q = "He was dressing himself", a = "Il s'habillait" },
    { q = "We would wake up", a = "Nous nous réveillerions", meta = "nous" },
    { q = "I will remember", a = "Je me souviendrai" },
    { q = "She did not wash herself", a = "Elle ne s'est pas lavée" },
    { q = "I wonder", a = "Je me demande" },
    { q = "We made a mistake", a = "Nous nous sommes trompés", meta = "nous, masc" },
    { q = "He sits down", a = "Il s'assoit" },
    { q = "They get angry", a = "Ils se fâchent", meta = "masc" },
    { q = "I used to complain", a = "Je me plaignais" },
    { q = "You will get used to it", a = "Tu t'y habitueras", meta = "informal" },
    { q = "We are interested in it", a = "Nous nous y intéressons", meta = "nous" },
    { q = "They were suspicious", a = "Ils se méfiaient", meta = "masc" },
    { q = "Be quiet", a = "Tais-toi", meta = "informal, imperative" },
    { q = "I will manage", a = "Je me débrouillerai" },
    { q = "Do not worry", a = "Ne t'inquiète pas", meta = "informal" },
    { q = "She was getting ready", a = "Elle se préparait" },
    { q = "They got married", a = "Ils se sont mariés", meta = "masc" },
    { q = "We argue", a = "Nous nous disputons", meta = "nous" },
    { q = "I did not realize", a = "Je ne me suis pas rendu compte", meta = "masc" },
    { q = "You are not making a mistake", a = "Tu ne te trompes pas", meta = "informal" },
    { q = "He was sitting down", a = "Il s'asseyait" },
    { q = "I would complain", a = "Je me plaindrais" },
    { q = "We will not get angry", a = "Nous ne nous fâcherons pas", meta = "nous" },
    { q = "They do not care about it", a = "Ils s'en foutent", meta = "masc" },
    { q = "I realized it", a = "Je m'en suis rendu compte", meta = "masc" },
    { q = "She will sit down", a = "Elle s'assiéra" },
    { q = "You used to worry", a = "Vous vous inquiétiez", meta = "formal" },
    { q = "We would manage", a = "Nous nous débrouillerions", meta = "nous" },
    { q = "They are getting ready", a = "Elles se préparent", meta = "fem" },
    { q = "I am not interested in it", a = "Je ne m'y intéresse pas" },
    { q = "He got angry", a = "Il s'est fâché" },
    { q = "She did not complain", a = "Elle ne s'est pas plainte" },
    { q = "We were mistaken", a = "Nous nous trompions", meta = "nous" },
    { q = "You will remember", a = "Tu te souviendras", meta = "informal" },
}

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
    if buf and vim.api.nvim_buf_is_valid(buf) then
        vim.api.nvim_buf_delete(buf, { force = true })
    end

    M.current_card = M.pick_card()

    vim.cmd("enew")
    buf = vim.api.nvim_get_current_buf()

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
