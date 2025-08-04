------------------------------------------------------------------------------------------
-- Inspired by https://github.com/wez/wezterm/discussions/628#discussioncomment-1874614 --
------------------------------------------------------------------------------------------

local wezterm = require('wezterm')
local Cells = require('utils.cells')

-- ===================
-- Constants and icons
-- ===================

local nf = wezterm.nerdfonts

local M = {}

local GLYPH_SCIRCLE_LEFT = nf.ple_left_half_circle_thick --[[  ]]
local GLYPH_SCIRCLE_RIGHT = nf.ple_right_half_circle_thick --[[  ]]
local GLYPH_DEBUG = nf.fa_bug --[[  ]]
local GLYPH_SEARCH = '🔭'

local TITLE_INSET = {
   DEFAULT = 6,
}

local RENDER_VARIANTS = {
   { 'scircle_left', 'title', 'padding', 'scircle_right' },
}

---@type table<string, Cells.SegmentColors>
-- stylua: ignore
local colors = {
   text_default          = { bg = '#45475A', fg = '#1C1B19' },
   text_hover            = { bg = '#5D87A3', fg = '#1C1B19' },
   text_active           = { bg = '#74c7ec', fg = '#11111B' },

   scircle_default       = { bg = 'rgba(0, 0, 0, 0.4)', fg = '#45475A' },
   scircle_hover         = { bg = 'rgba(0, 0, 0, 0.4)', fg = '#5D87A3' },
   scircle_active        = { bg = 'rgba(0, 0, 0, 0.4)', fg = '#74C7EC' },
}

-- ================
-- Helper functions
-- ================

---@param proc string
local function clean_process_name(proc)
   local a = string.gsub(proc, '(.*[/\\])(.*)', '%2')
   return a
end

---@param process_name string
---@param base_title string
---@param max_width number
---@param inset number
local function create_title(process_name, base_title, max_width, inset)
   local title

   if process_name:len() > 0 then
      title = process_name .. ' ~ ' .. base_title
   else
      title = base_title
   end

   if base_title == 'Debug' then
      title = GLYPH_DEBUG .. ' DEBUG'
      inset = inset - 2
   end

   if base_title:match('^InputSelector:') ~= nil then
      title = base_title:gsub('InputSelector:', GLYPH_SEARCH)
      inset = inset - 2
   end

   if title:len() > max_width - inset then
      local diff = title:len() - max_width + inset
      title = title:sub(1, title:len() - diff)
   else
      local padding = max_width - title:len() - inset
      title = title .. string.rep(' ', padding)
   end

   return title
end

-- =================
-- Tab class and API
-- =================

---@class Tab
---@field title string
---@field cells Cells
---@field title_locked boolean
---@field locked_title string
---@field is_active boolean
local Tab = {}
Tab.__index = Tab

function Tab:new()
   local tab = {
      title = '',
      cells = Cells:new(),
      title_locked = false,
      locked_title = '',
   }
   return setmetatable(tab, self)
end

---@param tab any WezTerm https://wezfurlong.org/wezterm/config/lua/MuxTab/index.html
---@param max_width number
function Tab:set_info(tab, max_width)
   local process_name = clean_process_name(tab.active_pane.foreground_process_name)

   local inset = TITLE_INSET.DEFAULT

   if self.title_locked then
      self.title = create_title('', self.locked_title, max_width, inset)
      return
   end
   self.title = create_title(process_name, tab.active_pane.title, max_width, inset)
end

function Tab:create_cells()
   local attr = self.cells.attr
   self.cells
      :add_segment('scircle_left', GLYPH_SCIRCLE_LEFT)
      :add_segment('title', ' ', nil, attr(attr.intensity('Bold')))
      :add_segment('padding', ' ')
      :add_segment('scircle_right', GLYPH_SCIRCLE_RIGHT)
end

---@param title string
function Tab:update_and_lock_title(title)
   self.locked_title = title
   self.title_locked = true
end

---@param is_active boolean
---@param hover boolean
function Tab:update_cells(is_active, hover)
   local tab_state = 'default'
   if is_active then
      tab_state = 'active'
   elseif hover then
      tab_state = 'hover'
   end

   self.cells:update_segment_text('title', ' ' .. self.title)

   self.cells
      :update_segment_colors('scircle_left', colors['scircle_' .. tab_state])
      :update_segment_colors('title', colors['text_' .. tab_state])
      :update_segment_colors('padding', colors['text_' .. tab_state])
      :update_segment_colors('scircle_right', colors['scircle_' .. tab_state])
end

---@return FormatItem[] (ref: https://wezfurlong.org/wezterm/config/lua/wezterm/format.html)
function Tab:render()
   return self.cells:render(RENDER_VARIANTS[1])
end

---@type Tab[]
local tab_list = {}

M.setup = function()
   -- CUSTOM EVENT
   -- Event listener to manually update the tab name
   -- Tab name will remain locked until the `reset-tab-title` is triggered
   wezterm.on('tabs.manual-update-tab-title', function(window, pane)
      window:perform_action(
         wezterm.action.PromptInputLine({
            description = wezterm.format({
               { Foreground = { Color = '#FFFFFF' } },
               { Attribute = { Intensity = 'Bold' } },
               { Text = 'Enter new name for tab' },
            }),
            action = wezterm.action_callback(function(_window, _pane, line)
               if line ~= nil then
                  local tab = window:active_tab()
                  local id = tab:tab_id()
                  tab_list[id]:update_and_lock_title(line)
               end
            end),
         }),
         pane
      )
   end)

   -- CUSTOM EVENT
   -- Event listener to unlock manually set tab name
   wezterm.on('tabs.reset-tab-title', function(window, _pane)
      local tab = window:active_tab()
      local id = tab:tab_id()
      tab_list[id].title_locked = false
   end)

   -- CUSTOM EVENT
   -- Event listener to toggle tab bar visibility
   wezterm.on('tabs.toggle-tab-bar', function(window, _pane)
      local effective_config = window:effective_config()
      window:set_config_overrides({
         enable_tab_bar = not effective_config.enable_tab_bar,
         background = effective_config.background,
      })
   end)

   -- BUILTIN EVENT
   wezterm.on('format-tab-title', function(tab, _tabs, _panes, _config, hover, max_width)
      if not tab_list[tab.tab_id] then
         tab_list[tab.tab_id] = Tab:new()
         tab_list[tab.tab_id]:set_info(tab, max_width)
         tab_list[tab.tab_id]:create_cells()
         return tab_list[tab.tab_id]:render()
      end

      tab_list[tab.tab_id]:set_info(tab, max_width)
      tab_list[tab.tab_id]:update_cells(tab.is_active, hover)
      return tab_list[tab.tab_id]:render()
   end)
end

return M
