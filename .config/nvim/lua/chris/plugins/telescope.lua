
return {
    {
        "nvim-telescope/telescope-fzf-native.nvim",
        build = "cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build"
    },
    {
        "nvim-telescope/telescope.nvim",
        tag = "0.1.5",
        dependencies = { "nvim-lua/plenary.nvim" },
        opts = {
        },
        config = function()
            local telescope = require("telescope")
            local actions = require("telescope.actions")
            telescope.setup({
                defaults = {
                    mappings = {
                        i = {
                            ["<C-k>"] = actions.move_selection_previous,
                            ["<C-j>"] = actions.move_selection_next,
                            ["<C-q>"] = actions.send_selected_to_qflist + actions.open_qflist,
                        }
                    }
                }
            })
            require('telescope').load_extension('fzf')

            vim.keymap.set("n", "<leader>ff", "<cmd>Telescope find_files<cr>")
            vim.keymap.set("n", "<leader>fs", "<cmd>Telescope live_grep<cr>")
            vim.keymap.set("n", "<leader>fc", "<cmd>Telescope grep_string<cr>")
            vim.keymap.set("n", "<leader>fb", "<cmd>Telescope buffers<cr>")
            vim.keymap.set("n", "<leader>fh", "<cmd>Telescope help_tags<cr>")
        end
    }
}

