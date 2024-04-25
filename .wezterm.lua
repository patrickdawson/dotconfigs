local wezterm = require("wezterm")
local act = wezterm.action

local config = {}

config.default_prog = { "pwsh", "-NoLogo" }
config.default_cwd = "C:/dev"

-- display
config.color_scheme = "catppuccin-frappe"
config.font = wezterm.font("CaskaydiaCove Nerd Font")
config.font_size = 14.0
config.use_fancy_tab_bar = false
config.hide_tab_bar_if_only_one_tab = true

-- Open wezterm config file quickly
config.keys = {
	{
		key = ",",
		mods = "CTRL",
		action = act.SpawnCommandInNewTab({
			cwd = os.getenv("WEZTERM_CONFIG_DIR"),
			set_environment_variables = {
				TERM = "screen-256color",
				NVIM_APPNAME = "lazyvim",
			},
			args = {
				"nvim",
				os.getenv("WEZTERM_CONFIG_FILE"),
			},
		}),
	},
}

return config
