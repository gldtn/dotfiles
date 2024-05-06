return {
  {
    "folke/tokyonight.nvim",
    lazy = false,
    enabled = false,
    priority = 1000,
    name = "tokyonight",
    config = function()
      require("lua/themes/tokyonight")
    end,
  },
  {
    "rose-pine/neovim",
    lazy = false,
    enabled = true,
    priority = 1000,
    name = "rose-pine",
    config = function()
      require("lua/themes/rose-pine")
    end,
  },
}
