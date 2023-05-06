local ensure_packer = function()
    local fn = vim.fn
    local install_path = fn.stdpath('data') .. '/site/pack/packer/start/packer.nvim'
    if fn.empty(fn.glob(install_path)) > 0 then
        fn.system({ 'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path })
        vim.cmd [[packadd packer.nvim]]
        return true
    end
    return false
end

local packer_bootstrap = ensure_packer()

vim.cmd([[
augroup packer_user_config
autocmd!
autocmd BufWritePost plugins-setup.lua source <afile> | PackerSync
augroup end
]])

local status, packer = pcall(require, "packer")
if not status then
    return
end

return packer.startup(function(use)
        use("wbthomason/packer.nvim")

        -- lua functions that many plugins use
        use("nvim-lua/plenary.nvim")

        use("bluz71/vim-nightfly-guicolors")
        use { "catppuccin/nvim", as = "catppuccin" }

        -- tmux & split window navigation
        use("christoomey/vim-tmux-navigator")

        -- maximizes and restores current window
        use("szw/vim-maximizer")

        -- essential plugins
        use("tpope/vim-surround")
        use("vim-scripts/ReplaceWithRegister")

        -- commenting with gc
        use("numToStr/Comment.nvim")

        -- file explorer
        vim.cmd([[ let g:neo_tree_remove_legacy_commands = 1]])

        use {
            "nvim-neo-tree/neo-tree.nvim",
            branch = "v2.x",
            requires = {
                "nvim-lua/plenary.nvim",
                "nvim-tree/nvim-web-devicons",
                "MunifTanjim/nui.nvim",
            }
        }

        -- icons
        use("kyazdani42/nvim-web-devicons")

        -- statusline
        use("nvim-lualine/lualine.nvim")

        -- fuzzy finding
        use({ "nvim-telescope/telescope-fzf-native.nvim", run = "make" })
        use({ "nvim-telescope/telescope.nvim", branch = "0.1.x" })

        -- autocompletion
        use("hrsh7th/nvim-cmp")
        use("hrsh7th/cmp-buffer")
        use("hrsh7th/cmp-path")

        -- snippets
        use("L3MON4D3/LuaSnip")
        use("saadparwaiz1/cmp_luasnip")
        use("rafamadriz/friendly-snippets")

        -- managing and installing lsp servers, linters, & formatters
        use("williamboman/mason.nvim")
        use("williamboman/mason-lspconfig.nvim")

        -- configuring the lsp servers
        use("neovim/nvim-lspconfig")
        use("hrsh7th/cmp-nvim-lsp")
        use({ "glepnir/lspsaga.nvim", branch = "main" })
        use("jose-elias-alvarez/typescript.nvim")
        use("onsails/lspkind.nvim")
        use({ "https://git.sr.ht/~whynothugo/lsp_lines.nvim" })
        use("simrat39/rust-tools.nvim")

        -- formatting & linting
        use("jose-elias-alvarez/null-ls.nvim")
        use("jayp0521/mason-null-ls.nvim")

        -- treesitter
        use({
            "nvim-treesitter/nvim-treesitter",
            run = function()
                require("nvim-treesitter.install").update({ with_sync = true })
            end,
        })

        -- auto closing
        use("windwp/nvim-autopairs")
        use({ "windwp/nvim-ts-autotag", after = "nvim-treesitter" })

        -- git signs plugin
        use("lewis6991/gitsigns.nvim")

        if packer_bootstrap then
            require("packer").sync()
        end

        -- debug
        use("mfussenegger/nvim-dap")

        -- cmake
        use("Shatur/neovim-tasks")
    end)
