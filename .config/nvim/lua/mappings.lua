require "nvchad.mappings"

-- add yours here

local map = vim.keymap.set

map("n", ";", ":", { desc = "CMD enter command mode" })
map("i", "kj", "<ESC>")

-- map({ "n", "i", "v" }, "<C-s>", "<cmd> w <cr>")

map("n", "<leader><Tab><Tab>", "<cmd> set invlist <CR>")

vim.keymap.del("n", "<leader>gt")
map("n", "<leader>gs", "<cmd>Telescope git_status<CR>", { desc = "telescope git status" })
