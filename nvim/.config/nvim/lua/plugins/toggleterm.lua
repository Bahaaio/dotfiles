return {
  "akinsho/toggleterm.nvim",
  version = "*",
  opts = {
    --[[ things you want to change go here]]
  },
  config = function()
    require("toggleterm").setup {
      -- Other setup options
      float_opts = {
        border = "curved", -- Set the border to 'curved' for rounded corners
        -- Other float options
      },
    }
  end,
}
