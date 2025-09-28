return {
  "3rd/image.nvim",
  build = false,
  ft = { "markdown" },
  opts = {
    backend = "ueberzug",
    integrations = {
      markdown = {
        only_render_image_at_cursor = true,
        only_render_image_at_cursor_mode = "popup",
      },
    },
  },
}
