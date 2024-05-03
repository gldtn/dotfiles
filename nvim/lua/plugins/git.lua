return {
  {
    "tpope/vim-fugitive"
  },
  {
    "lewis6991/gitsigns.nvim",
    config = function()
      require("gitsigns").setup({})
      local map = require("core.util").map
      map("n", "<leader>Gp", "<cmd>Gitsigns preview_hunk<CR>", { desc = "Preview hunk" })
    end
  },
}
