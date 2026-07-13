local wezterm = require("wezterm")
local config = wezterm.config_builder()
local commands = require("commands")
-- Font settings
config.font_size = 19
config.line_height = 1.2
config.font = wezterm.font("JetBrainsMono Nerd Font")

-- Colors
config.colors = {
	cursor_bg = "white",
	cursor_border = "white",
}

-- Appearance
config.window_decorations = "RESIZE"
config.hide_tab_bar_if_only_one_tab = true
config.window_padding = {
	left = 0,
	right = 0,
	top = 0,
	bottom = 0,
}

wezterm.on("gui-startup", function(cmd)
	local _, _, window = wezterm.mux.spawn_window(cmd or {})
	window:gui_window():toggle_fullscreen()
end)

config.max_fps = 120
config.prefer_egl = true

-- Custom Commands
wezterm.on("augment-command-palette", function()
	return commands
end)
return config
