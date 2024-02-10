return {
	"ThePrimeagen/harpoon",
	opts = {
		save_on_toggle = true,
	},
	config = function()
		vim.keymap.set("n", "<leader>ha", require("harpoon.mark").add_file, { desc = "Mark file with harpoon" })
		local harpoon_ui = require("harpoon.ui")
		vim.keymap.set("n", "<leader>hh", harpoon_ui.toggle_quick_menu, { desc = "Toggle harpoon quick menu" })
		vim.keymap.set("n", "<leader>hn", harpoon_ui.nav_next, { desc = "Harpoon nav next" })
		vim.keymap.set("n", "<leader>hp", harpoon_ui.nav_prev, { desc = "Harpoon nav previous" })
	end,
}
