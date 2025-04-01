return {
  "williamboman/mason.nvim",
  opts = {
    ensure_installed = {
      "stylua",
      "basedpyright",
      "biome",
      "black",
      "clangd",
      "cpplint",
      "css-lsp",
      "gersemi",
      "html-lsp",
      "jdtls",
      "lua-language-server",
      "prettier",
      "pyright",
      "stylua",
      "typescript-language-server",
    },
  },

  vim.keymap.set("n", "<leader>M", "<cmd>Mason<cr>", { desc = "Mason" }),
}
