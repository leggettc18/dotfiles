local setup, harpoon = pcall(require, "harpoon")
if not setup then
	return
end

harpoon.setup({
	save_on_toggle = true,
})

local mark_setup, harpoon_mark = pcall(require, "harpoon.mark")
if not mark_setup then
	return
end

vim.keymap.set("n", "<leader>ha", harpoon_mark.add_file)

local ui_setup, harpoon_ui = pcall(require, "harpoon.ui")
if not ui_setup then
	return
end

vim.keymap.set("n", "<leader>hh", harpoon_ui.toggle_quick_menu)
vim.keymap.set("n", "<leader>hn", harpoon_ui.nav_next)
vim.keymap.set("n", "<leader>hp", harpoon_ui.nav_prev)
