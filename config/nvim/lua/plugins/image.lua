return {
  "3rd/image.nvim",
  build = false,
  opts = {
    -- backend = "ueberzug",
    processor = "magick_cli",
    integrations = {
      markdown = {
        only_render_image_at_cursor = true,
        only_render_image_at_cursor_mode = "popup",
      },
    },
  },
}
