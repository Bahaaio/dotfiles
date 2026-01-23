return {
  {
    "NickvanDyke/opencode.nvim",
    dependencies = { "folke/snacks.nvim" },
    config = function()
      ---@type opencode.Opts
      vim.g.opencode_opts = {
        auto_reload = true,
        enabled = "snacks",
        provider = {
          snacks = {
            win = {
              enter = true,
            },
          },
        },
      }

      -- Required for `opts.auto_reload`
      vim.opt.autoread = true
    end,
    -- stylua: ignore
    keys = {
      { "<M-;>", mode = { "n", "t" }, function() require("opencode").toggle() end, desc = "Toggle embedded opencode" },
      { "<M-i>", mode = {"n", "x"}, function() require("opencode").ask("@this: ", { submit = true }) end, desc = "Ask about this" },
      { "<leader>ap", mode = { "n", "x" }, function() require("opencode").select() end, desc = "Select prompt" },
    },
  },

  {
    "folke/which-key.nvim",
    opts = {
      spec = {
        { "<leader>a", group = "ai", icon = { icon = LazyVim.config.icons.kinds.Copilot, color = "green" } },
      },
    },
  },
}
