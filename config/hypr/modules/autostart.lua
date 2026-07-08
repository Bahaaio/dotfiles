-- https://wiki.hypr.land/Configuring/Basics/Autostart/

local function run(app, rules)
	hl.exec_cmd("uwsm-app -- " .. app, rules)
end

hl.on("hyprland.start", function()
	run("hyprpaper")
	run("waybar")
	run("hypridle")
	run("hyprsunset")
	run("dunst")
	run("swayosd-server")
	run("copyq --start-server")
	run("elephant")
	run("walker --gapplication-service")

	-- applications
	run("zen", { workspace = "1 silent" })
	run("wezterm start -e tmux new -A -s dev", { workspace = "2 silent" })
	run("ticktick", { workspace = "5 silent" })
	-- run("zapzap")

	-- special workspaces
	run("wezterm start --class scratch -e tmux new -A -s scratch")
	run("wezterm --config font_size=12 start --class btop -e btop")
end)
