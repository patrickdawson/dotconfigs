local wezterm = require("wezterm")

local module = {}

function module.apply_to_config(config)
	-- override font for scaling
	config.font = wezterm.font_with_fallback({
		{ family = "CaskaydiaCove Nerd Font", scale = 1.4 },
		{ family = "JetBrains Mono", scale = 1.2 },
	})

	-- Open wezterm config file quickly
	table.insert(config.keys, {
		key = ",",
		mods = "CMD",
		action = wezterm.action.SpawnCommandInNewTab({
			cwd = os.getenv("WEZTERM_CONFIG_DIR"),
			set_environment_variables = {
				TERM = "screen-256color",
				NVIM_APPNAME = "lazyvim",
				PATH = "/opt/homebrew/bin:" .. os.getenv("PATH"),
			},
			args = {
				"nvim",
				os.getenv("WEZTERM_CONFIG_FILE"),
			},
		}),
	})
end

-- return our module table

return module
