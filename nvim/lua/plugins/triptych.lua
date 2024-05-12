return {
  "simonmclean/triptych.nvim",
  lazy = true,
  cmd = { "Triptych" },
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-tree/nvim-web-devicons",
  },
  config = function()
    require("triptych").setup({
      mappings = {
        -- nav_right = "l",
        open_vsplit = { "<C-v>" },
      },
      options = {
        show_hidden = true,
        backdrop = 100,
        width = .65,
        responsive_column_widths = {
          ['0'] = { 0, 0.5, 0.5 },
          ['120'] = { 0, 0.3, .7 },
          ['200'] = { 0, 0.3, .7 },
        },
        line_numbers = { enabled = true, relative = true },
        highlights = {
          directory_names = "warn",
          directory_icons = "error",
        },
        -- border = "none",
        border = { "", "", "", "▌", "", "", " ", " " },
      },
    })
  end,
}
