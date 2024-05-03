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
        bg = c.bg
        fg = c.fg
        dark = c.bg_dark
        pro_bg = "#292B41"    -- prompt background
        pro_title = c.red     --  prompt title
        pre_title = c.blue    -- preview title
        res_title = c.magenta -- results title
        highlight = c.bg_highlight

        -- telescope
        hl.TelescopeNormal = { bg = dark, fg = fg, }
        hl.TelescopeBorder = { bg = dark, fg = dark, }
        hl.TelescopePromptNormal = { bg = pro_bg, }
        hl.TelescopePromptBorder = { bg = pro_bg, fg = pro_bg, }
        hl.TelescopePromptTitle = { bg = pro_title, fg = pro_bg, }
        hl.TelescopePreviewTitle = { bg = pre_title, fg = dark, }
        hl.TelescopeResultsTitle = { bg = res_title, fg = dark, }
        hl.NoiceCmdlinePopupBorder = { bg = bg, fg = bg, }
        hl.TelescopeSelection = { bg = highlight, fg = fg, }
        -- whichkey
        hl.WhichKeyBorder = { bg = dark, fg = dark, }
        -- toggleterm
        hl.ToggleTermNormal = { bg = dark, fg = dark, }
        hl.ToggleTermNormalFloat = { bg = dark, fg = dark, }
        hl.ToggleTermFloatBorder = { bg = dark, fg = dark, }
      end,
    })

    -- set colorscheme
    vim.cmd([[colorscheme tokyonight]])
  end,
}
