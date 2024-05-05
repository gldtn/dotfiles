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
        local bg, fg, key, dark, grey, red, blue, green, purple, comment, magenta, highlight
        bg                           = c.bg
        fg                           = c.fg
        dark                         = c.bg_dark
        grey                         = "#292B41" -- prompt background
        red                          = c.red     --  prompt title
        blue                         = c.blue    -- preview title
        green                        = c.green
        purple                       = c.purple
        comment                      = c.comment
        magenta                      = c.magenta -- results title
        highlight                    = c.bg_highlight
        key                          = c.purple
        -- telescope
        hl.TelescopeNormal           = { bg = dark, fg = fg, }
        hl.TelescopeBorder           = { bg = dark, fg = dark, }
        hl.TelescopePromptNormal     = { bg = grey, }
        hl.TelescopePromptBorder     = { bg = grey, fg = grey, }
        hl.TelescopePromptTitle      = { bg = red, fg = grey, }
        hl.TelescopePreviewTitle     = { bg = blue, fg = dark, }
        hl.TelescopeResultsTitle     = { bg = magenta, fg = dark, }
        hl.NoiceCmdlinePopupBorder   = { bg = bg, fg = bg, }
        hl.TelescopeSelection        = { bg = highlight, fg = fg, }
        -- whichkey
        hl.WhichKeyBorder            = { bg = dark, fg = dark, }
        -- toggleterm
        hl.ToggleTermNormal          = { bg = dark, fg = dark, }
        hl.ToggleTermNormalFloat     = { bg = dark, fg = dark, }
        hl.ToggleTermFloatBorder     = { bg = dark, fg = dark, }
        -- neogit
        hl.NeogitNormal              = { bg = bg }
        hl.NeogitPopupSwitchKey      = { fg = key }
        hl.NeogitPopupOptionKey      = { fg = key }
        hl.NeogitPopupActionKey      = { fg = key }
        hl.NeogitWinSeparator        = { bg = bg, fg = blue }
        hl.NeogitSectionHeader       = { fg = magenta, style = "bold" }
        hl.NeogitFold                = { fg = green }
        hl.NeogitChangeModified      = { fg = blue, style = "bold,italic" }
        hl.NeogitChangeDeleted       = { fg = red, style = "bold,italic" }
        hl.NeogitHunkHeader          = { bg = comment, fg = dark, style = "bold" }
        hl.NeogitHunkHeaderHighlight = { bg = magenta, fg = dark, style = "bold" }
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
