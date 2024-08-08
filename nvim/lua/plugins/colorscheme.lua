return {
  {
    "folke/tokyonight.nvim",
    lazy = false,
    enabled = false,
    priority = 1000,
    name = "tokyonight",
    config = function()
      require("themes.tokyonight")
    end,
  },
  {
    "rose-pine/neovim",
    lazy = false,
    enabled = false,
    priority = 1000,
    name = "rose-pine",
    config = function()
      require("themes.rose-pine")
    end,
  },
  {
    "scottmckendry/cyberdream.nvim",
    lazy = false,
    enabled = true,
    config = function()
      require("themes.cyberdream")
    end,
  }
}
