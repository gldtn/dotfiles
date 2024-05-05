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
        local bg, keys, dark, red, green, magenta, highlight
        local soft_blue, high_blue, soft_white, light_grey, dark_grey
        bg                            = c.bg
        dark                          = c.bg_dark
        red                           = c.red
        green                         = c.green
        magenta                       = c.magenta
        highlight                     = c.bg_highlight
        dark_grey                     = "#292B41"
        light_grey                    = c.fg_dark
        soft_blue                     = c.comment
        high_blue                     = c.blue
        soft_white                    = c.fg
        keys                          = magenta
        -- telescope
        hl.TelescopeNormal            = { bg = dark, fg = soft_white, }
        hl.TelescopeBorder            = { bg = dark, fg = dark, }
        hl.TelescopePromptNormal      = { bg = dark_grey, }
        hl.TelescopePromptBorder      = { bg = dark_grey, fg = dark_grey, }
        hl.TelescopePromptTitle       = { bg = red, fg = dark_grey, }
        hl.TelescopePreviewTitle      = { bg = high_blue, fg = dark, }
        hl.TelescopeResultsTitle      = { bg = magenta, fg = dark, }
        hl.NoiceCmdlinePopupBorder    = { bg = bg, fg = bg, }
        hl.TelescopeSelection         = { bg = highlight, fg = soft_white, }
        -- whichkey
        hl.WhichKeyBorder             = { bg = dark, fg = dark, }
        -- toggleterm
        hl.ToggleTermNormal           = { bg = dark, fg = dark, }
        hl.ToggleTermNormalFloat      = { bg = dark, fg = dark, }
        hl.ToggleTermFloatBorder      = { bg = dark, fg = dark, }
        -- neogit
        hl.NeogitNormal               = { bg = bg }
        hl.NeogitPopupSwitchKey       = { fg = keys }
        hl.NeogitPopupOptionKey       = { fg = keys }
        hl.NeogitPopupActionKey       = { fg = keys }
        hl.NeogitWinSeparator         = { bg = bg, fg = high_blue }
        hl.NeogitSectionHeader        = { fg = magenta, style = "bold" }
        hl.NeogitFold                 = { fg = green }
        hl.NeogitChangeModified       = { fg = high_blue, style = "bold,italic" }
        hl.NeogitChangeDeleted        = { fg = red, style = "bold,italic" }
        hl.NeogitCommitViewHeader     = { bg = high_blue, fg = dark }
        hl.NeogitHunkHeader           = { bg = soft_blue, fg = dark, style = "bold" }
        hl.NeogitHunkHeaderHighlight  = { bg = c.orange, fg = dark, style = "bold" }
        hl.NeogitDiffHeader           = { bg = dark_grey, fg = soft_white }
        hl.NeogitDiffHeaderHighlight  = { bg = soft_white, fg = c.orange, style = "bold,italic" }
        hl.NeogitDiffContext          = { bg = bg }
        hl.NeogitDiffContextHighlight = { bg = dark_grey }
        -- hl.NeogitNotification           = { bg = c.bg0, }
        -- hl.NeogitCursorLine             = { bg = c.bg15, }
        -- hl.NeogitCursorLineNr           = { fg = c.yellow, bg = c.bg15 }
      end,
    })

    -- set colorscheme
    vim.cmd([[colorscheme tokyonight]])
  end,
}
