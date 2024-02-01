local setup, null_ls = pcall(require, "null-ls")
if not setup then
	return
end

local formatting = null_ls.builtins.formatting
local diagnostics = null_ls.builtins.diagnostics

local vala_lint = require("chris.plugins.lsp.vala-lint")

null_ls.setup({
	sources = {
		formatting.prettier,
		formatting.stylua,
		diagnostics.eslint_d,
		formatting.clang_format,
		diagnostics.cpplint,
		formatting.cmake_format,
		formatting.uncrustify.with({
			filetypes = { "c", "cpp", "cs", "java", "vala" },
		}),
		vala_lint,
		formatting.xmlformat,
	},
})
