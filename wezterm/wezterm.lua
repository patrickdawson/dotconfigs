local wezterm = require("wezterm")
local act = wezterm.action

local config = {}
-- use config builder object if possible
if wezterm.config_builder then
	config = wezterm.config_builder()
end

-- settings
config.color_scheme = "catppuccin-frappe"
config.font = wezterm.font_with_fallback({
	{ family = "CaskaydiaCove Nerd Font", scale = 1.4 },
	{ family = "JetBrains Mono", scale = 1.2 },
})
config.window_background_opacity = 0.9
config.window_decorations = "RESIZE"
config.window_close_confirmation = "AlwaysPrompt"
config.scrollback_lines = 3000
config.default_workspace = "home"

-- tab bar
config.use_fancy_tab_bar = false
-- config.hide_tab_bar_if_only_one_tab = true
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
		{ Text = wezterm.nerdfonts.md_folder .. " " .. file_name },
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

-- plafom specific
if wezterm.target_triple == "x86_64-pc-windows-msvc" then
	local win_helper = require("wez-windows")
	win_helper.apply_to_config(config)
else
	local mac_helper = require("wez-macos")
	mac_helper.apply_to_config(config)
end

return config
