return {
  {
    "supermaven-inc/supermaven-nvim",
    -- enabled = false,
    lazy = false,
    config = function()
      require("supermaven-nvim").setup({})
    end,
    keys = {
      -- Keymaps for Supermaven
      { "<leader>ae", "<cmd>SupermavenStart<cr>", desc = "Enable Supermaven" },
      { "<leader>ar", "<cmd>SupermavenRestart<cr>", desc = "Restart Supermaven" },
      { "<leader>ad", "<cmd>SupermavenStop<cr>", desc = "Disable Supermaven" },
    },
  },

  {
    "NickvanDyke/opencode.nvim",
    dependencies = { "folke/snacks.nvim" },
    ---@type opencode.Config
    opts = {
      terminal = {
        win = {
          enter = true,
        },
      },
    },
  -- stylua: ignore
    keys = {
        { '<M-;>', mode = {"n","t"},function() require('opencode').toggle() end, desc = 'Toggle embedded opencode', },
        { '<leader>ai', function() require('opencode').ask() end, desc = 'Ask opencode', mode = 'n', },
        { '<leader>ai', function() require('opencode').ask('@selection: ') end, desc = 'Ask opencode about selection', mode = 'v', },
        { '<leader>ap', function() require('opencode').select_prompt() end, desc = 'Select prompt', mode = { 'n', 'v', }, },
        { '<leader>an', function() require('opencode').command('session_new') end, desc = 'New session', },
        { '<leader>ay', function() require('opencode').command('messages_copy') end, desc = 'Copy last message', },
        { '<S-C-u>',    function() require('opencode').command('messages_half_page_up') end, desc = 'Scroll messages up', },
        { '<S-C-d>',    function() require('opencode').command('messages_half_page_down') end, desc = 'Scroll messages down', },
    },
  },

  {
    "nvim-lualine/lualine.nvim",
    optional = true,
    event = "VeryLazy",
    opts = function(_, opts)
      table.insert(
        opts.sections.lualine_x,
        2,
        LazyVim.lualine.status("", function()
          if package.loaded["supermaven-nvim"] then
            return require("supermaven-nvim.api"):is_running() and "ok" or "error"
          end
        end)
      )
    end,
  },

  {
    "folke/which-key.nvim",
    opts = {
      spec = {
        { "<leader>a", group = "ai", icon = { icon = " ", color = "green" } },
      },
    },
  },
}
