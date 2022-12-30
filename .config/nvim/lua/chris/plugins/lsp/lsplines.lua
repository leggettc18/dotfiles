local setup, lsplines = pcall(require, "lsp_lines")
if not setup then
    return
end

lsplines.setup()

-- Disable virtual text
vim.diagnostic.config({
    virtual_text = false,
})

vim.keymap.set(
    "",
    "<leader>l",
    lsplines.toggle,
    { desc = "Toggle lsp_lines" }
)
