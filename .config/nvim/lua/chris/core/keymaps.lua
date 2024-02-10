vim.g.mapleader = " "

local keymap = vim.keymap

-- general keymaps
keymap.set("i", "jk", "<ESC>", { desc = "Exit insert mode with jk" }) -- get out of insert mode
keymap.set("n", "<leader>nh", ":nohl<CR>", { desc = "Clear search highlights" }) -- clear search highlights
keymap.set("n", "x", '"_x', { desc = "Don't copy deleted characters to a register" }) -- don't copy deleted characters to a register
keymap.set("n", "<leader>+", "<C-a>", { desc = "Increment number under the cursor" }) -- increment number
keymap.set("n", "<leader>-", "<C-x>", { desc = "Decrement number under the cursor" }) -- decrement number
keymap.set("n", "<leader>sv", "<C-w>v", { desc = "Split window vertically" }) -- split window vertically
keymap.set("n", "<leader>sh", "<C-w>s", { desc = "Split window horizontally" }) -- split window horizontally
keymap.set("n", "<leader>se", "<C-w>=", { desc = "Make split windows equal width" }) -- make split windows equal width
keymap.set("n", "<leader>sx", "<:close<CR>", { desc = "Close current split window" }) -- close current split window
keymap.set("n", "<leader>to", ":tabnew<CR>", { desc = "Open new tab" }) -- open new tab
keymap.set("n", "<leader>tx", ":tabclose<CR>", { desc = "Close current tab" }) -- close current tab
keymap.set("n", "<leader>tn", ":tabn<CR>", { desc = "Go to next tab" }) -- go to next tab
keymap.set("n", "<leader>tp", ":tabp<CR>", { desc = "Go to previous tab" }) -- go to previous tab
keymap.set("n", "<leader>tf", "<cmd>tabnew %", { desc = "Open current buffer in a new tab" })
keymap.set("n", "<leader>yy", "*yy", { desc = "Yank line to clipboard" }) -- yank line to clipboard
keymap.set("v", "<leader>y", "*y", { desc = "Yank selection to clipboard" }) -- yank selection to clipboard
keymap.set("n", "<leader>p", "*p", { desc = "Paste text from clipboard" }) -- put from clipboard
