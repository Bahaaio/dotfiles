return {
  {
    "NickvanDyke/opencode.nvim",
    dependencies = { { "folke/snacks.nvim", opts = { input = { enabled = true } } } },
    config = function()
      ---@type opencode.Opts
      vim.g.opencode_opts = {
        auto_reload = true,
        ---@diagnostic disable-next-line: missing-fields
        terminal = {
          win = {
            enter = true,
          },
        },
      }

      -- Required for `opts.auto_reload`
      vim.opt.autoread = true
    end,
    -- stylua: ignore
    keys = {
      { "<M-;>", mode = { "n", "t" }, function() require("opencode").toggle() end, desc = "Toggle embedded opencode", },
      { "<M-i>", function() require("opencode").ask() end, desc = "Ask opencode" },
      { "<M-i>", function() require("opencode").ask("@selection: ") end, desc = "Ask opencode about selection", mode = "v", },
      { "<leader>ap", function() require("opencode").select() end, desc = "Select prompt", mode = { "n", "v" }, },
      { "<leader>ay", function() require("opencode").command("messages_copy") end, desc = "Copy last message", },
    },
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
