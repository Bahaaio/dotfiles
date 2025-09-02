local config = require("wezterm").config_builder()

local keys = require("config.keys")
local appearance = require("config.appearance")

for _, module in ipairs({ keys, appearance }) do
	for k, v in pairs(module) do
		config[k] = v
	end
end

return config
