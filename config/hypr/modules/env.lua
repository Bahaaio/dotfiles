-- https://wiki.hypr.land/Configuring/Advanced-and-Cool/Environment-variables/

local function env(envs)
	for k, v in pairs(envs) do
		hl.env(k, v)
	end
end

env({
	-- theme
	XCURSOR_THEME = "Bibata-Modern-Classic",
	XCURSOR_SIZE = "22",

	-- toolkit backends
	GDK_BACKEND = "wayland,x11,*",
	QT_QPA_PLATFORM = "wayland;xcb",
	SDL_VIDEODRIVER = "wayland,x11",
	MOZ_ENABLE_WAYLAND = "1",
	ELECTRON_OZONE_PLATFORM_HINT = "wayland",
	OZONE_PLATFORM = "wayland",

	-- XDG variables
	XDG_CURRENT_DESKTOP = "Hyprland",
	XDG_SESSION_DESKTOP = "Hyprland",
	XDG_SESSION_TYPE = "wayland",
})

hl.config({
	xwayland = {
		force_zero_scaling = true,
	},

	-- don't show update news and donation nag
	ecosystem = {
		no_update_news = true,
		no_donation_nag = true,
	},
})
