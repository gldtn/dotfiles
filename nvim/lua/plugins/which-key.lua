return {
  "folke/which-key.nvim",
  event = "VeryLazy",
  opts = {
    preset = "modern",
  },

  config = function()
    vim.o.timeout = true
    vim.o.timeoutlen = 500

    -- import which-key plugin
    local wk = require("which-key")

    -- define options
    local keyopts = {
      noremap = false,
      nowait = false,
    }

    local mappings = {
      { "<leader>a",  group = "ai", },
      { "<leader>b",  group = "buffer/browser", },
      { "<leader>c",  group = "code", },
      { "<leader>d",  group = "diagnostics", },
      { "<leader>f",  group = "find/files", },
      { "<leader>g",  group = "goto", },
      { "<leader>l",  group = "list/load", },
      { "<leader>m",  group = "marks", },
      { "<leader>s",  group = "search", },
      { "<leader>t",  group = "toggles", },
      { "<leader>x",  group = "trouble", },
      { "<leader>T",  group = "treesitter", },
      { "<leader>Ti", "<cmd>InspectTree<cr>",   desc = "Inspect Tree", },
      { "<leader>Tu", "<cmd>TSUpdate<cr>",      desc = "Update Parsers", },
      { "<leader>D",  "<cmd>Dashboard<cr>",     desc = "dashboard", },
      { "<leader>L",  "<cmd>Lazy<cr>",          desc = "lazy", },
      { "<leader>M",  "<cmd>Mason<cr>",         desc = "mason", },
    }

    wk.add({ mappings, keyopts })
  end,
}
