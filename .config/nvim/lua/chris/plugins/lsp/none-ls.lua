return {
    "nvimtools/none-ls.nvim", -- configure formatters & linters
    event = { "BufReadPre", "BufNewFile" },
    dependencies = {
        "jay-babu/mason-null-ls.nvim",
    },
    config = function()
        local mason_null_ls = require("mason-null-ls")
        local null_ls = require("null-ls")
        local null_ls_utils = require("null-ls.utils")

        mason_null_ls.setup({
            ensure_installed = {
                "prettier",
                "stylua",
                "eslint_d",
                "cpplint",
                "clang_format",
                "cmake_format",
            },
            automatic_installation = true,
        })

        local formatting = null_ls.builtins.formatting -- to setup formatters
        local diagnostics = null_ls.builtins.diagnostics -- to setup linters

        -- vala-lint source setup
        local h = require("null-ls.helpers")
        local methods = require("null-ls.methods")

        local handle_vala_lint_output = function(params)
            if params.output and params.output.mistakes then
                local output = params.output.mistakes
                local parser = h.diagnostics.from_json({
                    severities = {
                        warn = h.diagnostics.severities["warning"],
                        error = h.diagnostics.severities["error"],
                    },
                })
                return parser({ output = output })
            end
        end

        local vala_lint_generator_json = h.generator_factory({
            args = { "$FILENAME", "-z", "-j", "-e" },
            command = "io.elementary.vala-lint",
            format = "json",
            on_output = handle_vala_lint_output,
            to_temp_file = true,
        })

        local vala_lint_source = {
            name = "vala-lint",
            method = { methods.internal.DIAGNOSTICS_ON_SAVE, methods.internal.DIAGNOSTICS },
            filetypes = { "vala" },
            generator = vala_lint_generator_json,
        }

        -- to setup format on save
        local augroup = vim.api.nvim_create_augroup("LspFormatting", {})

        -- configure null_ls
        null_ls.setup({
            -- add package.json as identifier for root (for typescript monorepos)
            root_dir = null_ls_utils.root_pattern(".null-ls-root", "Makefile", ".git", "package.json"),
            -- setup formatters & linters
            sources = {
                formatting.prettier,
                formatting.stylua,
                formatting.clang_format,
                formatting.cmake_format,
                formatting.xmlformat,
                diagnostics.eslint_d.with({
                    condition = function(utils)
                        return utils.root_has_file({ ".eslintrc.js", ".eslintrc.cjs" }) -- only enable if root has .eslintrc.js or .eslintrc.cjs
                    end
                }),
                diagnostics.cpplint,
                vala_lint_source
            },
            -- configure format on save
            on_attach = function(current_client, bufnr)
                if current_client.supports_method("textDocument/formatting") then
                    vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
                    vim.api.nvim_create_autocmd("BufWritePre", {
                        group = augroup,
                        buffer = bufnr,
                        callback = function()
                            vim.lsp.buf.format({
                                filter = function(client)
                                    -- only use null-ls for formatting instead of lsp server
                                    return client.name == "null-ls"
                                end,
                                bufnr = bufnr,
                            })
                        end,
                    })
                end
            end,
        })
    end,
}

