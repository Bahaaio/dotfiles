require("git"):setup()

-- only load if not running inside neovim
if os.getenv("YAZI_NVIM_ID") == nil then
	require("full-border"):setup()
end
