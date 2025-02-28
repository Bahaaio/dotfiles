return {
  "stevearc/conform.nvim",
  opts = {
    formatters_by_ft = {
      lua = { "stylua" },
      css = { "prettier" },
      html = { "prettier" },
      javascript = { "prettier" },
      markdown = { "prettier" },
      cpp = { "clang_format" },
      c = { "clang_format" },
      cmake = { "gersemi" },
      python = { "black" },
    },

    -- format_on_save = {
    --   -- These options will be passed to conform.format()
    --   timeout_ms = 500,
    --   lsp_fallback = true,
    -- },
  },
}
