return {
  {
    "elmcgill/springboot-nvim",
    ft = "java",
    dependencies = {
      "neovim/nvim-lspconfig",
      "mfussenegger/nvim-jdtls",
    },
    config = function()
      local springboot_nvim = require("springboot-nvim")
      vim.keymap.set("n", "<leader>jr", springboot_nvim.boot_run, { desc = "Spring Boot Run Project" })
      vim.keymap.set("n", "<leader>jc", springboot_nvim.generate_class, { desc = "Java Create Class" })
      vim.keymap.set("n", "<leader>ji", springboot_nvim.generate_interface, { desc = "Java Create Interface" })
      vim.keymap.set("n", "<leader>je", springboot_nvim.generate_enum, { desc = "Java Create Enum" })
      springboot_nvim.setup()
    end,
  },

  {
    "rcasia/neotest-java",
    ft = "java",
    dependencies = {
      "mfussenegger/nvim-jdtls",
      "mfussenegger/nvim-dap",
      "rcarriga/nvim-dap-ui",
      "theHamsta/nvim-dap-virtual-text",
    },
  },
}
