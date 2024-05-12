return {
  "nvim-lualine/lualine.nvim",
  enabled = false,
  event = "VeryLazy",
  opts = function()
    vim.o.laststatus = vim.g.lualine_laststatus
    local theme = require("themes.lualine.rose-pine")
    local p = require("rose-pine.palette")

    return {
      options = {
        theme = theme,
        globalstatus = true,
        component_separators = { "" },
        section_separators = { "" },
        disabled_filetypes = { statusline = { "dashboard", "alpha", "starter" } },
      },
      sections = {
        lualine_a = {
          {
            "mode",
            -- icon = { " ", color = { fg = p.base, bg = p.overlay } },
            separator = "",
            icons_enabled = true,
            color = { fg = p.love },
            padding = { left = 1, right = 1 },
          },
          { "", separator = { left = "", right = "" }, draw_empty = "true" },
          {
            "diagnostics",
            separator = "",
            symbols = {
              error = " ",
              warn = " ",
              info = " ",
              hint = "󰝶 ",
              -- error = " ",
              -- warn = " ",
              -- info = " ",
              -- hint = " "
            },
          },
          {
            "filename",
            path = 1,
            separator = "",
            file_status = true,
            padding = { left = 1, right = 0 },
          },
        },
        lualine_b = {
          -- { "", separator = "", draw_empty = "true" },
        },
        lualine_c = {
        },
        lualine_x = {
          {
            require("lazy.status").updates,
            cond = require("lazy.status").has_updates,
            padding = { left = 1, right = 1 },
            icon = { " ", color = { fg = p.gold } },
          },
          {
            "branch",
            separator = "",
            fmt = string.upper,
            icon = { "", color = { fg = p.gold } },
          },
          {
            -- Lsp server name .
            function()
              local buf_ft = vim.api.nvim_get_option_value("filetype", { buf = 0 })
              local clients = vim.lsp.get_clients({ bufnr = 0 }) -- Filter by the current buffer
              if next(clients) == nil then
                return ""
              end
              for _, client in ipairs(clients) do
                local filetypes = client.config.filetypes
                if filetypes and vim.fn.index(filetypes, buf_ft) ~= -1 then
                  return client.name
                end
              end
            end,
            icon = { " ", color = { fg = p.gold } },
            fmt = string.upper,
            color = { fg = p.muted, gui = "italic" },
            padding = { left = 1, right = 2 },
          },
        },
        lualine_y = {
          { "", draw_empty = true, separator = "", },
        },
        lualine_z = {
          {
            "location",
            separator = "",
            padding = { left = 1, right = 1 },
          },
          -- function()
          --   return " " .. os.date("%I:%M %p")
          -- end,
        },
      },
      extensions = { "neo-tree", "lazy", "toggleterm", "trouble" },
    }
  end,
}
