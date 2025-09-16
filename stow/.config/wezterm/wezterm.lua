-- Pull in the wezterm API
local wezterm = require("wezterm")

-- This will hold the configuration.
local config = wezterm.config_builder()

-- font
config.font = wezterm.font_with_fallback({
	"JetBrainsMono Nerd Font Mono",
	"HYSunWanMinCaoShu",
})

config.font_rules = {
	{
		intensity = "Bold",
		italic = true,
		font = wezterm.font_with_fallback({ "JetBrainsMono Nerd Font Mono" }),
	},
}

config.font_size = 16
config.color_scheme = "AdventureTime"

-- graphics
config.max_fps = 120
config.webgpu_power_preference = "HighPerformance"
config.front_end = "OpenGL"

-- cursor
config.animation_fps = 120
config.cursor_blink_ease_in = "EaseOut"
config.cursor_blink_ease_out = "EaseOut"
config.default_cursor_style = "BlinkingBlock"
config.cursor_blink_rate = 650

-- scrollbar
config.enable_scroll_bar = false

-- tab bar
config.enable_tab_bar = false
config.use_fancy_tab_bar = true

-- Finally, return the configuration to wezterm:
return config
