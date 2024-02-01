local status, indentblankline = pcall(require, "ibl")
if not status then
	return
end

vim.opt.list = true
vim.opt.termguicolors = true

local highlight = {
	"RainbowRed",
	"RainbowYellow",
	"RainbowBlue",
	"RainbowOrange",
	"RainbowGreen",
	"RainbowViolet",
	"RainbowCyan",
}

local hooks_status, hooks = pcall(require, "ibl.hooks")
if not hooks_status then
	return
end

hooks.register(hooks.type.HIGHLIGHT_SETUP, function()
	vim.api.nvim_set_hl(0, "RainbowBlue", { fg = "#89b4fa" })
	vim.api.nvim_set_hl(0, "RainbowRed", { fg = "#f38ba8" })
	vim.api.nvim_set_hl(0, "RainbowGreen", { fg = "#a6e3a1" })
	vim.api.nvim_set_hl(0, "RainbowYellow", { fg = "#f9e2af" })
	vim.api.nvim_set_hl(0, "RainbowViolet", { fg = "#cba9f7" })
	vim.api.nvim_set_hl(0, "RainbowOrange", { fg = "#fab387" })
	vim.api.nvim_set_hl(0, "RainbowCyan", { fg = "#89dceb" })
end)

indentblankline.setup({
	indent = { highlight = highlight },
})
