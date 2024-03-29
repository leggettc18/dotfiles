return {
	"lukas-reineke/indent-blankline.nvim",
	main = "ibl",
	event = { "BufReadPre", "BufNewFile" },
	config = function()
		local ibl = require("ibl")
		local hooks = require("ibl.hooks")

		local highlight = {
			"RainbowRed",
			"RainbowYellow",
			"RainbowBlue",
			"RainbowOrange",
			"RainbowGreen",
			"RainbowViolet",
			"RainbowCyan",
		}

		hooks.register(hooks.type.HIGHLIGHT_SETUP, function()
			vim.api.nvim_set_hl(0, "RainbowBlue", { fg = "#89b4fa" })
			vim.api.nvim_set_hl(0, "RainbowRed", { fg = "#f38ba8" })
			vim.api.nvim_set_hl(0, "RainbowGreen", { fg = "#a6e3a1" })
			vim.api.nvim_set_hl(0, "RainbowYellow", { fg = "#f9e2af" })
			vim.api.nvim_set_hl(0, "RainbowViolet", { fg = "#cba9f7" })
			vim.api.nvim_set_hl(0, "RainbowOrange", { fg = "#fab387" })
			vim.api.nvim_set_hl(0, "RainbowCyan", { fg = "#89dceb" })
		end)

		ibl.setup({
			indent = {
				highlight = highlight,
				char = "│",
				tab_char = "│",
			},
		})
	end,
}
