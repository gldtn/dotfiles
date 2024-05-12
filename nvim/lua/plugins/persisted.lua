return {
  "olimorris/persisted.nvim",
  lazy = true,
  -- event = "VeryLazy",
  opts = function()
    require("persisted").setup({
      -- NOTE: enable if necessary, still testing defaults!
      -- allowed_dirs = {
      --   "~/.config",
      -- },
      -- autoload = true,
      -- on_autoload_no_session = function()
      --   vim.notify("No existing session to load.")
      -- end
    })
    -- mappings
    local map = require("core.util").map
    map("n", "<leader>ls", "<cmd>Telescope persisted<cr>", { desc = "List Sessions" })
  end,
}
