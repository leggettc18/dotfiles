local mason_status, mason = pcall(require, "mason")
if not mason_status then
	return
end

local mason_lspconfig_status, mason_lspconfig = pcall(require, "mason-lspconfig")
if not mason_lspconfig_status then
	return
end

local mason_null_ls_status, mason_null_ls = pcall(require, "mason-null-ls")
if not mason_null_ls_status then
	return
end

mason.setup({
	pip = {
		upgrade_pip = true,
	},
})

mason_lspconfig.setup({
	ensure_installed = {
		"tsserver",
		"html",
		"cssls",
		"tailwindcss",
		"lua_ls",
		"clangd",
		"cmake",
		"eslint",
	},
	automatic_installation = true,
})

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
