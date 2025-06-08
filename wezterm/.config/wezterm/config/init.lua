local wezterm = require('wezterm')

---@class Config
---@field options table
local Config = {}
Config.__index = Config

---Initialize Config
---@return Config
function Config:init()
   local instance = setmetatable({ options = {} }, self)
   return instance
end

---Append to `Config.options`
---@param new_options table new options to append
---@return Config
function Config:append(new_options)
   for k, v in pairs(new_options) do
      if self.options[k] ~= nil then
         wezterm.log_warn('Duplicate config option detected: ', { old = self.options[k], new = v })
      else
         self.options[k] = v
      end
   end
   return self
end

return Config
