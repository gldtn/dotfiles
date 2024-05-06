return {
  "nvim-lualine/lualine.nvim",
  event = "VeryLazy",
  opts = function()
    vim.o.laststatus = vim.g.lualine_laststatus
    local colors = require("tokyonight.colors").setup({ style = "moon" })
    return {
      options = {
        theme = "tokyonight",
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
              error = " ",
              warn = " ",
              info = " ",
              hint = "󰝶 ",
            },
            { "filetype", icon_only = true, separator = "", padding = { left = 1, right = 0 } },
          },
          { "filename", file_status = true, path = 1 },
        },

        lualine_x = {
          {
            require("lazy.status").updates,
            cond = require("lazy.status").has_updates,
            padding = { left = 1, right = 1 },
            color = { fg = colors.orange },
            separator = "  ",
          },
          -- { "encoding", separator = "  ", padding = { left = 1, right = 1 } },
          -- {
          --   "fileformat",
          --   symbols = {
          --     unix = "",
          --     dos = "",
          --     mac = "",
          --   },
          --   separator = "  ",
          --   padding = { left = 1, right = 1 },
          -- },
          {
            "filetype",
            icon_only = true,
            separator = " ",
            padding = { left = 1, right = 1 }
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
    }
  end,
}
