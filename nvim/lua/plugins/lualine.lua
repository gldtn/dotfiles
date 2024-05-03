return {
  "nvim-lualine/lualine.nvim",
  event = "VeryLazy",
  opts = function()
    vim.o.laststatus = vim.g.lualine_laststatus

    return {
      options = {
        theme = "auto",
        globalstatus = true,
        disabled_filetypes = { statusline = { "dashboard", "alpha", "starter" } },
      },
      sections = {
        lualine_a = { "mode" },
        lualine_b = { "branch" },
        lualine_c = {
          {
            "diagnostics",
            symbols = {
              error = " ",
              warn = " ",
              hint = " ",
              info = " ",
            },
            { "filetype", icon_only = true, separator = "", padding = { left = 1, right = 0 } },
          },
          { "filename", file_status = true, path = 1 },
        },

        lualine_x = {
          { "encoding" },
          { "fileformat" },
          { "filetype" },
          { -- lazy status
            require("lazy.status").updates,
            cond = require("lazy.status").has_updates,
            color = { fg = "#ff9e64" },
          },
        },
        lualine_y = {
          { "progress", separator = " ",                  padding = { left = 1, right = 0 } },
          { "location", padding = { left = 0, right = 1 } },
        },
        lualine_z = {
          function()
            return " " .. os.date("%I:%M%p")
          end,
        },
      },
      extensions = { "neo-tree", "lazy", "toggleterm", "trouble" },
      -- inactive_winbar = {
      --   lualine_c = { "filename" },
      -- },
    }
  end,
}
