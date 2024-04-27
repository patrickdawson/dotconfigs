local wezterm = require("wezterm")

local module = {}

function module.apply_to_config(config)
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
