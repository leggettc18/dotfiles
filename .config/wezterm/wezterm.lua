local wezterm = require("wezterm")
local config = {}

config.enable_tab_bar = false
config.font = wezterm.font("Iosevka Nerd Font")
config.color_scheme = "Catppuccin Mocha"
config.window_padding = {
	left = 3,
	right = 3,
	top = 0,
	bottom = 0,
}
config.window_close_confirmation = "NeverPrompt"
config.animation_fps = 30
config.cursor_blink_rate = 500
config.cursor_blink_ease_in = "Linear"
config.cursor_blink_ease_out = "Linear"
config.default_cursor_style = "BlinkingBar"

return config
