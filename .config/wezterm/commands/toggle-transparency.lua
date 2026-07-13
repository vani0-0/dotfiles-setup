local wezterm = require("wezterm")

local command = {
	brief = "Toggle terminal transparency",
	icon = "md_circle_opacity",
	action = wezterm.action_callback(function(window)
		local overrides = window:get_config_overrides() or {}

		wezterm.log_info("Before:", overrides.window_background_opacity)

		if overrides.window_background_opacity == 0.8 then
			overrides.window_background_opacity = 1
		else
			overrides.window_background_opacity = 0.8
		end

		window:set_config_overrides(overrides)
		wezterm.log_info("After:", overrides.window_background_opacity)
	end),
}

return command
