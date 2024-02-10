return {
    "ThePrimeagen/harpoon",
    opts = {
        save_on_toggle = true,
    },
    config = function()
        vim.keymap.set("n", "<leader>ha", require("harpoon.mark").add_file)
        local harpoon_ui = require("harpoon.ui")
        vim.keymap.set("n", "<leader>hh", harpoon_ui.toggle_quick_menu)
        vim.keymap.set("n", "<leader>hn", harpoon_ui.nav_next)
        vim.keymap.set("n", "<leader>hp", harpoon_ui.nav_prev)
    end
}
