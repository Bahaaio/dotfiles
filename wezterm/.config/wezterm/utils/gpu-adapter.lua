local wezterm = require('wezterm')

local GpuAdapters = {}
GpuAdapters.__index = GpuAdapters

local ENUMERATED_GPUS = wezterm.gui.enumerate_gpus()
local BACKENDS = { 'Vulkan', 'Gl' }

function GpuAdapters:init()
   local adapters = {
      DiscreteGpu = {},
      IntegratedGpu = {},
      Cpu = {},
      Other = {},
      __preferred_backend = BACKENDS[1],
   }

   for _, gpu in ipairs(ENUMERATED_GPUS) do
      adapters[gpu.device_type][gpu.backend] = gpu
   end

   return setmetatable(adapters, self)
end

function GpuAdapters:pick_best()
   for _, type in ipairs({ 'DiscreteGpu', 'IntegratedGpu', 'Other', 'Cpu' }) do
      local devices = self[type]
      local backend = (type == 'Other') and 'Gl' or self.__preferred_backend
      if devices and devices[backend] then
         return devices[backend]
      end
   end

   wezterm.log_error('No suitable GPU adapter found. Using default.')
   return nil
end

function GpuAdapters:pick_manual(backend, device_type)
   local device = self[device_type] and self[device_type][backend]
   if not device then
      wezterm.log_error('Requested GPU adapter not found. Using default.')
   end
   return device
end

return GpuAdapters:init()
