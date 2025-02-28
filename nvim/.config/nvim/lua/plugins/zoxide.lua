return {
  "jvgrootveld/telescope-zoxide",
  config = function()
    require("telescope").setup {
      extensions = {
        zoxide = {
          prompt_title = "zoxide",
          mappings = {
            default = {
              after_action = function()
                vim.cmd "SessionRestore"
              end,
            },
          },
        },
      },
    }
  end,

  -- keymaps
  vim.keymap.set("n", "<leader>z", "<cmd>Telescope zoxide list<Cr>", { desc = "zoxide" }),
}
