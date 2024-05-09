local darken = "#26233a"
return {
  require("rose-pine").setup({
    variant = "auto",      -- auto, main, moon, or dawn
    dark_variant = "moon", -- main, moon, or dawn
    dim_inactive_windows = false,
    extend_background_behind_borders = true,

    enable = {
      terminal = true,
      legacy_highlights = false, -- Improve compatibility for previous versions of Neovim
      migrations = true,         -- Handle deprecated options automatically
    },

    styles = {
      bold = true,
      italic = true,
      transparency = false,
    },

    groups = {
      border = "muted",
      link = "iris",
      panel = "surface",

      error = "love",
      hint = "iris",
      info = "foam",
      note = "pine",
      todo = "rose",
      warn = "gold",

      git_add = "foam",
      git_change = "rose",
      git_delete = "love",
      git_dirty = "rose",
      git_ignore = "muted",
      git_merge = "iris",
      git_rename = "pine",
      git_stage = "iris",
      git_text = "rose",
      git_untracked = "subtle",

      h1 = "iris",
      h2 = "foam",
      h3 = "rose",
      h4 = "gold",
      h5 = "pine",
      h6 = "foam",
    },

    highlight_groups = {
      TelescopeBorder = { fg = "base", bg = "surface" },
      TelescopeNormal = { fg = "subtle", bg = "surface" },
      TelescopeSelection = { fg = "text", bg = "highlight_med" },
      TelescopeSelectionCaret = { fg = "love", bg = "highlight_med" },
      TelescopeMultiSelection = { fg = "text", bg = "highlight_high" },

      TelescopeTitle = { fg = "base", bg = "love" },
      TelescopePromptTitle = { fg = "base", bg = "gold" },
      TelescopePreviewTitle = { fg = "base", bg = "iris" },

      TelescopePromptNormal = { fg = "text", bg = "overlay" },
      TelescopePromptBorder = { fg = "overlay", bg = "overlay" },
    },

  }),
  vim.cmd("colorscheme rose-pine")
}