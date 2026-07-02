-- https://wiki.hypr.land/Configuring/Basics/Binds/

local function run(app, rules)
	return hl.dsp.exec_cmd("uwsm-app -- " .. app, rules)
end

local function binds(bindz)
	for _, bind in ipairs(bindz) do
		local key, command, rules = table.unpack(bind)
		hl.bind(key, command, rules)
	end
end

-- applications
local terminal = "wezterm -e tmux"
local file_manager = "nautilus"
local menu = "walker"
local clip_manager = "copyq show"
local osd = "swayosd-client "
local calculator = "gnome-calculator"
local logout = "wlogout"

-- scripts
local ocr = "~/.config/hypr/scripts/ocr.sh"
local toggle_mic = "~/.config/hypr/scripts/toggle-mic.sh"
local screenshot = "~/.config/hypr/scripts/screenshot.sh"
local toggle_touchpad = "~/.config/hypr/scripts/toggle-touchpad.sh"

local mod = "SUPER"
local resize_step = 30

binds({
	-- applications
	{ "ALT + SPACE", run(menu) },
	{ mod .. " + RETURN", run(terminal) },
	{ mod .. " + E", run(file_manager) },
	{ mod .. " + V", run(clip_manager) },
	{ mod .. " + C", run(calculator) },
	{ "XF86Calculator", run(calculator) },

	-- special workspaces
	{ mod .. " + O", hl.dsp.workspace.toggle_special("scratchpad") },
	{ mod .. " + B", hl.dsp.workspace.toggle_special("btop") },

	-- layout and window management
	{ mod .. " + Q", hl.dsp.window.close() },
	{ mod .. " + F", hl.dsp.window.fullscreen() },
	{ mod .. " + S", hl.dsp.layout("togglesplit") }, -- dwindle only
	{ mod .. " + T", hl.dsp.group.toggle() },
	{ mod .. " + G", hl.dsp.group.toggle() },
	{ mod .. " + N", hl.dsp.group.next() },
	{ mod .. " + P", hl.dsp.group.prev() },
	{ mod .. " + SPACE", hl.dsp.window.cycle_next() },
	{ mod .. " + SHIFT + SPACE", hl.dsp.window.float() },

	-- session management
	{ mod .. " + X", run(logout) },

	-- scroll through existing workspaces with mainMod + scroll
	{ mod .. " + mouse_down", hl.dsp.focus({ workspace = "e+1" }) },
	{ mod .. " + mouse_up", hl.dsp.focus({ workspace = "e-1" }) },

	-- move/resize windows with mainMod + LMB/RMB and dragging
	{ mod .. " + mouse:272", hl.dsp.window.drag(), { mouse = true } },
	{ mod .. " + mouse:273", hl.dsp.window.resize(), { mouse = true } },

	-- multimedia keys for volume and LCD brightness
	{ "XF86AudioRaiseVolume", run(osd .. "--output-volume raise"), { locked = true, repeating = true } },
	{ "XF86AudioLowerVolume", run(osd .. "--output-volume lower"), { locked = true, repeating = true } },
	{ "XF86MonBrightnessUp", run(osd .. "--brightness raise"), { locked = true, repeating = true } },
	{ "XF86MonBrightnessDown", run(osd .. "--brightness lower"), { locked = true, repeating = true } },
	{ "XF86AudioMute", run(osd .. "--output-volume mute-toggle"), { locked = true } },
	{ "XF86AudioMicMute", run(toggle_mic), { locked = true } },
	{ "XF86TouchpadToggle", run(toggle_touchpad), { locked = true } },
	-- shift + brightness down to turn off the screen
	{
		"SHIFT + XF86MonBrightnessDown",
		function()
			hl.timer(function()
				hl.dispatch(hl.dsp.dpms({ action = "disable" }))
			end, { timeout = 500, type = "oneshot" })
		end,
	},

	-- media keys
	{ "XF86AudioPause", run(osd .. "--playerctl play-pause"), { locked = true } },
	{ "XF86AudioPlay", run(osd .. "--playerctl play-pause"), { locked = true } },
	{ "XF86AudioNext", run(osd .. "--playerctl next"), { locked = true } },
	{ "XF86AudioPrev", run(osd .. "--playerctl previous"), { locked = true } },
	{ mod .. " + CTRL + XF86AudioPlay", run(osd .. "--playerctl play-pause"), { locked = true } },
	{ mod .. " + CTRL + XF86AudioNext", run(osd .. "--playerctl next"), { locked = true } },
	{ mod .. " + CTRL + XF86AudioPrev", run(osd .. "--playerctl previous"), { locked = true } },

	-- screenshots & ocr
	{ mod .. " + Print", run(ocr) },
	{ "Print", run(screenshot .. " full") },
	{ "SHIFT + Print", run(screenshot .. " smart") },

	-- cycle monitors
	{ mod .. " + bracketleft", hl.dsp.focus({ monitor = "l" }) },
	{ mod .. " + bracketright", hl.dsp.focus({ monitor = "r" }) },

	-- move to monitor
	{ mod .. " + SHIFT + bracketleft", hl.dsp.window.move({ monitor = "l" }) },
	{ mod .. " + SHIFT + bracketright", hl.dsp.window.move({ monitor = "r" }) },

	-- move focus with mod + hjkl
	{ mod .. " + H", hl.dsp.focus({ direction = "left" }) },
	{ mod .. " + J", hl.dsp.focus({ direction = "down" }) },
	{ mod .. " + K", hl.dsp.focus({ direction = "up" }) },
	{ mod .. " + L", hl.dsp.focus({ direction = "right" }) },

	-- swap active window with the one next to it with mod + HJKL
	{ mod .. " + SHIFT + H", hl.dsp.window.swap({ direction = "left" }) },
	{ mod .. " + SHIFT + J", hl.dsp.window.swap({ direction = "down" }) },
	{ mod .. " + SHIFT + K", hl.dsp.window.swap({ direction = "up" }) },
	{ mod .. " + SHIFT + L", hl.dsp.window.swap({ direction = "right" }) },

	-- resize windows with mod + r
	{ mod .. " + R", hl.dsp.submap("resize") },
})

hl.define_submap("resize", function()
	binds({
		{ "H", hl.dsp.window.resize({ x = -resize_step, y = 0, relative = true }), { repeating = true } },
		{ "J", hl.dsp.window.resize({ x = 0, y = resize_step, relative = true }), { repeating = true } },
		{ "K", hl.dsp.window.resize({ x = 0, y = -resize_step, relative = true }), { repeating = true } },
		{ "L", hl.dsp.window.resize({ x = resize_step, y = 0, relative = true }), { repeating = true } },

		-- escape to exit resize mode
		{ "escape", hl.dsp.submap("reset") },
	})
end)

-- switch workspaces with mod + [0-9]
-- move active window to a workspace with mod + SHIFT + [0-9]
for i = 1, 10 do
	local key = i % 10 -- 10 maps to key 0
	hl.bind(mod .. " + " .. key, hl.dsp.focus({ workspace = i }))
	hl.bind(mod .. " + SHIFT + " .. key, hl.dsp.window.move({ workspace = i }))
end
