local setup, null_ls = pcall(require, "null_ls")
if not setup then
    return
end

local formatting = null_ls.builtins.formatting
local diagnostics = null_ls.builtins.diagnostics


null_ls.setup({
    sources = {
        formatting.prettier,
        formatting.stylua,
        diagnostics.eslint_d,
        formatting.clang_format,
        diagnostics.cpplint,
        formatting.cmake_format,
        formatting.uncrustify.with({
            filetypes = { "c", "cpp", "cs", "java", "vala" }
        }),
    },
})
