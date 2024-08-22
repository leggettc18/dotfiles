return {
    "nvim-lualine/lualine.nvim",
    dependencies = {'f-person/git-blame.nvim'},
    opts = {
        theme = "gruvbox_dark",
        sections = {
            lualine_c = {
                { require('gitblame').get_current_blame_text, cond = require('gitblame').is_blame_text_available }
            }
        }
    }
}
