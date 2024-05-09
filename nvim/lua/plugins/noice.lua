return {
  "folke/noice.nvim",
  event = "VeryLazy",
  enabled = true,
  opts = {},
  dependencies = {
    "MunifTanjim/nui.nvim",
    {
      "rcarriga/nvim-notify",
      opts = {
        timeout = 3000,
        stages = "slide",
        -- top_down = false,
      },
    },
  },
  config = function()
    require("noice").setup({
      cmdline = {
        view = "cmdline",
        long_message_to_split = true,
      },
    })
  end,
}
