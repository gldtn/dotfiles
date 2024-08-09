return {
  -- "scottmckendry/cyberdream.nvim",
  "scottmckendry/cyberdream.nvim",
  dev = true,
  lazy = false,
  -- enabled = false,
  priority = 1000,
  config = function()
    require("cyberdream").setup({
      transparent = true,
      italic_comments = true,
      borderless_telescope = { border = false, style = "flat" },
    })

    vim.cmd("colorscheme cyberdream")
  end,
}
