local wezterm = require("wezterm")
local config = {}
if wezterm.config_builder then
	config = wezterm.config_builder()
end

config.enable_tab_bar = false
config.font = wezterm.font("JetBrainsMono Nerd Font")
config.font_size = 12.0
config.color_scheme = "Papercolor Dark (Gogh)"
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
