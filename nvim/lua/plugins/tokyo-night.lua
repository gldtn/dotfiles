return {
  "folke/tokyonight.nvim",
  lazy = false,
  priority = 1000,
  config = function()
    require("tokyonight").setup({
      style = "moon",
      terminal_colors = true,
      styles = {
        sidebar = "dark",
        floats = "dark",
      },
      -- Highlights
      ---@param hl Highlights
      ---@param c ColorScheme
      on_highlights = function(hl, c)
        -- define colors
        local bg, fg, dark, pro_bg, pro_title, pre_title, res_title, highlight
        bg                         = c.bg
        fg                         = c.fg
        dark                       = c.bg_dark
        pro_bg                     = "#292B41" -- prompt background
        pro_title                  = c.red     --  prompt title
        pre_title                  = c.blue    -- preview title
        res_title                  = c.magenta -- results title
        highlight                  = c.bg_highlight

        -- telescope
        hl.TelescopeNormal         = { bg = dark, fg = fg, }
        hl.TelescopeBorder         = { bg = dark, fg = dark, }
        hl.TelescopePromptNormal   = { bg = pro_bg, }
        hl.TelescopePromptBorder   = { bg = pro_bg, fg = pro_bg, }
        hl.TelescopePromptTitle    = { bg = pro_title, fg = pro_bg, }
        hl.TelescopePreviewTitle   = { bg = pre_title, fg = dark, }
        hl.TelescopeResultsTitle   = { bg = res_title, fg = dark, }
        hl.NoiceCmdlinePopupBorder = { bg = bg, fg = bg, }
        hl.TelescopeSelection      = { bg = highlight, fg = fg, }
        -- whichkey
        hl.WhichKeyBorder          = { bg = dark, fg = dark, }
        -- toggleterm
        hl.ToggleTermNormal        = { bg = dark, fg = dark, }
        hl.ToggleTermNormalFloat   = { bg = dark, fg = dark, }
        hl.ToggleTermFloatBorder   = { bg = dark, fg = dark, }
        -- neogit
        hl.NeogitNormal            = { bg = bg }
        hl.NeogitPopup             = { bg = dark }
        hl.NeogitWinSeparator      = { bg = bg, fg = c.blue }
        hl.NeogitSectionHeader     = { fg = c.magenta, style = "bold" }
        hl.NeogitFold              = { fg = c.green }
        hl.NeogitChangeModified    = { fg = c.blue, style = "bold,italic" }
        hl.NeogitChangeDeleted     = { fg = c.red, style = "bold,italic" }
        -- hl.NeogitHunkHeader             = { bg = c.grey, fg = c.bg0, style = "bold" }
        -- hl.NeogitNotification           = { bg = c.bg0, }
        -- hl.NeogitCursorLine             = { bg = c.bg15, }
        -- hl.NeogitCursorLineNr           = { fg = c.yellow, bg = c.bg15 }
        -- hl.NeogitDiffHeader             = { bg = c.bg4, fg = c.blue, style = "underline" }
        -- hl.NeogitDiffHeaderHighlight    = { bg = c.bg4, fg = c.orange, style = "bold,underline" }
        -- hl.NeogitDiffContext            = { bg = c.bg15 }
        -- hl.NeogitDiffContextHighlight   = { bg = c.bg2 }
      end,
    })

    -- set colorscheme
    vim.cmd([[colorscheme tokyonight]])
  end,
}
