return {
  "folke/which-key.nvim",
  event = "VeryLazy",

  config = function()
    vim.o.timeout = true
    vim.o.timeoutlen = 500

    -- import which-key plugin
    local wk = require("which-key")
    local colors = require("tokyonight.colors").setup()

    -- configure which-key
    wk.setup({
      window = {
        border = "double",        -- none, single, double, shadow
        position = "bottom",      -- bottom, top
        margin = { 1, 0, 1, 0 },  -- extra window margin [top, right, bottom, left]. When between 0 and 1, will be treated as a percentage of the screen size.
        padding = { 1, 2, 1, 2 }, -- extra window padding [top, right, bottom, left]
        winblend = 0,             -- value between 0-100 0 for fully opaque and 100 for fully transparent
        zindex = 1000,            -- positive value to position WhichKey above other floating windows.
      },
    })

    -- define options
    local opts = {
      mode = "n",
      prefix = "<leader>",
      buffer = nil,
      silent = true,
      noremap = true,
      nowait = false,
    }

    -- open neovim config w/ telescope
    local nvimConf = {
      cwd = vim.env.HOME .. "/.config/nvim",
      results_title = "Neovim Config",
    }
    vim.keymap.set("n", "<leader>fd", function()
      require("telescope.builtin").find_files(nvimConf)
    end, { desc = "Dotfiles" })

    -- define mappings
    local mappings = {
      a = { name = "ai" },
      b = { name = "buffer/browser" },
      c = { name = "code" },
      D = { "<cmd>Dashboard<cr>", "dashboard" },
      d = { name = "diagnostics" },
      f = { name = "find/files" },
      g = {
        name = "goto",
        -- stylua: ignore
        z = { function() print("Where you going foo?") end, "foo" },
      },
      L = { "<cmd>Lazy<cr>", "lazy" },
      l = { name = "list/load" },
      M = { "<cmd>Mason<cr>", "mason" },
      s = { name = "search" },
      T = { name = "treesitter", i = { "<cmd>InspectTree<cr>", "Inspect Tree" }, u = { "<cmd>TSUpdate<cr>", "Update Parsers" } },
      t = { name = "track files" },
      x = { name = "trouble" },
    }

    -- load config
    wk.register(mappings, opts)
  end,
}
