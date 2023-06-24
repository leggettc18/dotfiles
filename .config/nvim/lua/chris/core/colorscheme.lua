vim.o.termguicolors = true
local status, _ = pcall(vim.cmd, "colorscheme catppuccin-mocha")
if not status then
    print("Colorscheme not found!")
    return
end

vim.cmd("highlight Normal ctermbg=none guibg=none")
vim.cmd("highlight NonText ctermbg=none guibg=none")
vim.cmd("highlight EndOfBuffer ctermbg=none guibg=none")
vim.cmd("highlight LineNr ctermbg=none guibg=none")
vim.cmd("highlight Folded ctermbg=none guibg=none")
vim.cmd("highlight SpecialKey ctermbg=none guibg=none")
vim.cmd("highlight VertSplit ctermbg=none guibg=none")
vim.cmd("highlight SignColumn ctermbg=none guibg=none")
vim.cmd("highlight EndOfFile ctermbg=none guibg=none")
vim.cmd("highlight NormalNC ctermbg=none guibg=none")
