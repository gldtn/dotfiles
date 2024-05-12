---@type LazySpec
return
{
  "mikavilpas/yazi.nvim",
  dependencies = {
    "nvim-lua/plenary.nvim",
  },
  -- enabled = false,
  event = "VeryLazy",
  cmd = "Yazi",
  keys = {
    {
      "<leader>y",
      function()
        require("yazi").yazi()
      end,
      desc = "Yazy file manager",
    },
    {
      -- Open in the current working directory
      "<leader>cw",
      function()
        require("yazi").yazi(nil, vim.fn.getcwd())
      end,
      desc = "Current working directory",
    },
  },
  ---@type YaziConfig
  opts = {
    open_for_directories = true,
    floating_window_scaling_factor = 0.8,
    yazi_floating_window_border = "none",
  },
}
