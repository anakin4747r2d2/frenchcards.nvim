-- tests/minimal_init.lua
-- Minimal Neovim init for running tests with plenary.nvim.
-- plenary is expected to be installed at one of:
--   ~/.local/share/nvim/site/pack/*/start/plenary.nvim   (lazy/packer)
--   /usr/local/share/nvim/site/pack/*/start/plenary.nvim (system)
-- or pointed to via the PLENARY_PATH env var.

local plenary_path = os.getenv("PLENARY_PATH")
    or vim.fn.expand("~/.local/share/nvim/site/pack/vendor/start/plenary.nvim")

vim.opt.rtp:prepend(plenary_path)

-- Add the plugin root so `require("frenchcards")` resolves.
vim.opt.rtp:prepend(vim.fn.fnamemodify(debug.getinfo(1, "S").source:sub(2), ":h:h"))
