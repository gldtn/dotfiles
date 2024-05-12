return {
  "dharmx/track.nvim",
  lazy = true,
  -- enabled = false,
  cmd = { "Track", "Mark", "Unmark", "RMBranch", "SwapBranch" },
  opts = function()
    -- options
    require("track").setup({
      pickers = {
        branches = { initial_mode = "normal" },
        views = { initial_mode = "normal" },
      },
    })
  end,
}
