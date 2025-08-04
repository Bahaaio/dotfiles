return {
  "nvim-telescope/telescope.nvim",
  opts = {
    defaults = {
      mappings = {
        i = {
          ["<C-u>"] = false, -- clear prompt
        },
      },
      vimgrep_arguments = {
        "rg",
        "--color=never",
        "--no-heading",
        "--with-filename",
        "--line-number",
        "--column",
        "--smart-case",
        "--hidden",
        "--glob",
        "!**/.git/**",
      },
      prompt_prefix = "   ",
      sorting_strategy = "ascending",
      layout_config = {
        horizontal = {
          prompt_position = "top",
          preview_width = 0.55,
        },
        width = 0.87,
        height = 0.80,
      },
    },
    pickers = {
      find_files = { previewer = false },
      git_files = { previewer = false },
    },
  },
  keys = {
    { "<leader>/", false }, -- disable the keymap to grep files
  },
}
