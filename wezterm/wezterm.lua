local wezterm = require("wezterm")
local act = wezterm.action
local mux = wezterm.mux

local config = {}
-- use config builder object if possible
if wezterm.config_builder then
	config = wezterm.config_builder()
end

-- settings
config.color_scheme = "catppuccin-frappe"
config.window_background_opacity = 0.9
-- config.window_decorations = "RESIZE"
config.window_close_confirmation = "AlwaysPrompt"
config.scrollback_lines = 10000
config.default_workspace = "home"

-- tab bar
config.use_fancy_tab_bar = false
config.status_update_interval = 1000

wezterm.on("update-right-status", function(window, pane)
	-- workspace name
	local ws = window:active_workspace()
	if window:active_key_table() then
		ws = window:active_key_table()
	end
	if window:leader_is_active() then
		ws = "Leader"
	end

	-- current working directory
	local basename = function(s)
		return string.gsub(s, "(.*[/\\])(.*)", "%2")
	end
	local cwd = pane:get_current_working_dir()
	local file_name = basename(cwd.file_path)

	-- current command
	local cmd = basename(pane:get_foreground_process_name())

	-- time
	local time = wezterm.strftime("%H:%M")

	window:set_right_status(wezterm.format({
		{ Text = wezterm.nerdfonts.oct_table .. " " .. ws },
		{ Text = "|" },
		{ Text = wezterm.nerdfonts.fa_code .. " " .. cmd },
		{ Text = "|" },
		{ Foreground = { Color = "FFB86C" } },
		{ Text = wezterm.nerdfonts.md_folder .. " " .. cwd },
		"ResetAttributes",
		{ Text = "|" },
		{ Text = wezterm.nerdfonts.md_clock .. " " .. time },
		{ Text = "|" },
	}))
end)

-- Dim inactive panes
config.inactive_pane_hsb = {
	brightness = 0.24,
	saturation = 0.5,
}

config.leader = { key = "j", mods = "CTRL", timeout_milliseconds = 1000 }
config.keys = {
	-- Send C-a when pressing C-a twice (because leader is C-a)
	{ key = "a", mods = "LEADER", action = act.SendKey({ key = "a", mods = "CTRL" }) },
	{ key = "c", mods = "LEADER", action = act.ActivateCopyMode },

	-- launch_menu
	{ key = ";", mods = "LEADER", action = act.ShowLauncherArgs({ flags = "LAUNCH_MENU_ITEMS" }) },

	-- Pane keybindings
	{ key = "-", mods = "LEADER", action = act.SplitVertical({ domain = "CurrentPaneDomain" }) },
	{ key = "\\", mods = "LEADER", action = act.SplitHorizontal({ domain = "CurrentPaneDomain" }) },
	{ key = "h", mods = "LEADER", action = act.ActivatePaneDirection("Left") },
	{ key = "j", mods = "LEADER", action = act.ActivatePaneDirection("Down") },
	{ key = "k", mods = "LEADER", action = act.ActivatePaneDirection("Up") },
	{ key = "l", mods = "LEADER", action = act.ActivatePaneDirection("Right") },
	{ key = "x", mods = "LEADER", action = act.CloseCurrentPane({ confirm = true }) },
	{ key = "z", mods = "LEADER", action = "TogglePaneZoomState" },
	{ key = "s", mods = "LEADER", action = act.RotatePanes("Clockwise") },
	{ key = "r", mods = "LEADER", action = act.ActivateKeyTable({ name = "resize_pane", one_shot = false }) },

	-- tab keybindings
	{ key = "n", mods = "LEADER", action = act.SpawnTab("CurrentPaneDomain") },
	{ key = "[", mods = "LEADER", action = act.ActivateTabRelative(-1) },
	{ key = "]", mods = "LEADER", action = act.ActivateTabRelative(1) },
	{ key = "t", mods = "LEADER", action = act.ShowTabNavigator },
	-- rename tab
	{
		key = ".",
		mods = "LEADER",
		action = act.PromptInputLine({
			description = "Enter new name for tab",
			action = wezterm.action_callback(function(window, pane, line)
				-- line will be `nil` if they hit escape without entering anything
				-- An empty string if they just hit enter
				-- Or the actual line of text they wrote
				if line then
					window:active_tab():set_title(line)
				end
			end),
		}),
	},
	-- Moving tabs
	{ key = "m", mods = "LEADER", action = act.ActivateKeyTable({ name = "move_tab", one_shot = false }) },

	-- Workspaces
	{ key = "w", mods = "LEADER", action = act.ShowLauncherArgs({ flags = "FUZZY|WORKSPACES" }) },
}

for i = 1, 9 do
	table.insert(config.keys, {
		key = tostring(i),
		mods = "LEADER",
		action = act.ActivateTab(i - 1),
	})
end

config.key_tables = {
	resize_pane = {
		{ key = "h", action = act.AdjustPaneSize({ "Left", 1 }) },
		{ key = "j", action = act.AdjustPaneSize({ "Down", 1 }) },
		{ key = "k", action = act.AdjustPaneSize({ "Up", 1 }) },
		{ key = "l", action = act.AdjustPaneSize({ "Right", 1 }) },
		{ key = "Escape", action = "PopKeyTable" },
		{ key = "Enter", action = "PopKeyTable" },
	},
	move_tab = {
		{ key = "h", action = act.MoveTabRelative(-1) },
		{ key = "j", action = act.MoveTabRelative(-1) },
		{ key = "k", action = act.MoveTabRelative(1) },
		{ key = "l", action = act.MoveTabRelative(1) },
		{ key = "Escape", action = "PopKeyTable" },
		{ key = "Enter", action = "PopKeyTable" },
	},
}

-- startup
wezterm.on("gui-startup", function(cmd)
	-- allow `wezterm start -- something` to affect what we spawn
	-- in our initial window
	local args = {}
	if cmd then
		args = cmd.args
	end

	-- Set a workspace for coding on a current project
	local tab, build_pane, window = mux.spawn_window({
		workspace = "coding",
		cwd = "C:/dev",
	})
	tab:set_title("dev")

	local storagetab = window:spawn_tab({ cwd = "C:/dev/storage" })
	storagetab:set_title("storage")

	local zrsptab = window:spawn_tab({ cwd = "C:/dev/zwickroell-software-products" })
	zrsptab:set_title("zrsp")

	-- activate main tab
	tab:activate()
end)

-- plafom specific
if wezterm.target_triple == "x86_64-pc-windows-msvc" then
	local win_helper = require("wez-windows")
	win_helper.apply_to_config(config)
else
	local mac_helper = require("wez-macos")
	mac_helper.apply_to_config(config)
end

return config
