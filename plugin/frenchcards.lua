local fc = require("frenchcards")
vim.api.nvim_create_user_command("French", fc.open_flashcard, {})
