require "nvchad.mappings"

-- add yours here

local map = vim.keymap.set


map("i", "jk", "<ESC>")

map("n", "<C-u>", "<C-u>zz")
map("n", "<C-d>", "<C-d>zz")

map("n", ";", ":", { desc = "CMD enter command mode" })

map("n", "<leader>e", "<cmd>NvimTreeToggle<CR>", { desc = "nvimtree toggle window" })

map("v", "J", ":m '>+1<CR>gv", { desc = "Move lines down in visual mode" })

map("v", "K", ":m '<-2<CR>gv", { desc = "Move lines up in visual mode" })

-- map({ "n", "i", "v" }, "<C-s>", "<cmd> w <cr>")


local delete = vim.keymap.del
delete('n',';')
