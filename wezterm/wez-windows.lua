local wezterm = require("wezterm")

local module = {}

function module.apply_to_config(config)
	-- override font for scaling
	config.font = wezterm.font_with_fallback({
		{ family = "JetBrains Mono", scale = 1.0 },
		{ family = "MesloLGS Nerd Font", scale = 1.0 },
	})

	-- launcher menu
	config.launch_menu = {
		{
			label = "yazi",
			args = { "yazi" },
		},
		{
			label = "Pwsh Dev",
			args = { "pwsh" },
			cwd = "C:/dev",
		},
		{
			label = "Pwsh Storage",
			args = { "pwsh" },
			cwd = "C:/dev/storage",
		},
		{
			label = "Pwsh zwickroell-software-products",
			args = { "pwsh" },
			cwd = "C:/dev/zwickroell-software-products",
		},
		{
			label = "Cmd.exe",
			args = { "cmd" },
		},
		{
			label = "btop",
			args = { "btop" },
		},
	}

	config.default_prog = { "pwsh", "-NoLogo" }
	config.default_cwd = "C:/dev"
	-- Open wezterm config file quickly
	table.insert(config.keys, {
		key = ",",
		mods = "CTRL",
		action = wezterm.action.SpawnCommandInNewTab({
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
	})
end

-- return our module table

return module
