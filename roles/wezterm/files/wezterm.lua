local wezterm = require 'wezterm'

local config = {}

if wezterm.config_builder then
  config = wezterm.config_builder()
end

-- This is where you actually apply your config choices
config.automatically_reload_config = true
config.front_end = "OpenGL"
config.disable_default_key_bindings = true
config.use_dead_keys = false
config.warn_about_missing_glyphs = false
config.enable_wayland = false
config.hide_tab_bar_if_only_one_tab = true -- since i use i3 i do not need tabs as much as i would i.e windows
config.bold_brightens_ansi_colors = true
config.window_close_confirmation = "NeverPrompt"
config.color_scheme = 'Catppuccin Mocha'

config.window_frame = {
	font_size  = 8.0,
}

config.keys = {
	{
	key = "v",
	mods = "CTRL|SHIFT",
	action = wezterm.action({ PasteFrom = "Clipboard"  })
	},
}

-- and finally, return the configuration to wezterm
return config

