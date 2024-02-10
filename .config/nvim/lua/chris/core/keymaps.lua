vim.g.mapleader = " "

local keymap = vim.keymap

-- general keymaps
keymap.set("i", "jk", "<ESC>")                 -- get out of insert mode
keymap.set("n", "<leader>nh", ":nohl<CR>")     -- clear search highlights
keymap.set("n", "x", '"_x')                    -- don't copy deleted characters to a register
keymap.set("n", "<leader>+", "<C-a>")          -- increment number
keymap.set("n", "<leader>-", "<C-x>")          -- decrement number
keymap.set("n", "<leader>sv", "<C-w>v")        -- split window vertically
keymap.set("n", "<leader>sh", "<C-w>s")        -- split window horizontally
keymap.set("n", "<leader>se", "<C-w>=")        -- make split windows equal width
keymap.set("n", "<leader>sx", "<:close<CR>")   -- close current split window
keymap.set("n", "<leader>to", ":tabnew<CR>")   -- open new tab
keymap.set("n", "<leader>tx", ":tabclose<CR>") -- close current tab
keymap.set("n", "<leader>tn", ":tabn<CR>")     -- go to next tab
keymap.set("n", "<leader>tp", ":tabp<CR>")     -- go to previous tab
keymap.set("n", "<leader>yy", "*yy")           -- yank line to clipboard
keymap.set("v", "<leader>y", "*y")             -- yank selection to clipboard
keymap.set("n", "<leader>p", "*p")             -- put from clipboard

-- plugin keymaps
--
-- vim-maximizer
keymap.set("n", "<leader>sm", ":MaximizerToggle<CR>")

