local status, indentblankline = pcall(require, "indent_blankline")
if not status then
    return
end

vim.opt.list = true
vim.opt.termguicolors = true
vim.cmd [[highlight IndentBlanklineIndent1 guifg=#89b4fa gui=nocombine]]
vim.cmd [[highlight IndentBlanklineIndent2 guifg=#f38ba8 gui=nocombine]]
vim.cmd [[highlight IndentBlanklineIndent3 guifg=#a6e3a1 gui=nocombine]]
vim.cmd [[highlight IndentBlanklineIndent4 guifg=#f9e2af gui=nocombine]]
vim.cmd [[highlight IndentBlanklineIndent5 guifg=#cba9f7 gui=nocombine]]
vim.cmd [[highlight IndentBlanklineIndent6 guifg=#eba0ac gui=nocombine]]

indentblankline.setup {
    enabled = true,
    use_treesitter = true,
    show_current_context = true,
    show_current_context_start = true,
    show_first_indent_level = true,
    space_char_blankline = " ",
    char_highlight = "LineNr",
    context_highlight_list = {
        "IndentBlanklineIndent1",
        "IndentBlanklineIndent2",
        "IndentBlanklineIndent3",
        "IndentBlanklineIndent4",
        "IndentBlanklineIndent5",
        "IndentBlanklineIndent6",
    },
}
