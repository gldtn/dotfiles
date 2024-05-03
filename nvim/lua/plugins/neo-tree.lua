---@type LazyPluginSpec
return {
  "nvim-neo-tree/neo-tree.nvim",
  branch = "main",
  dependencies = {
    "MunifTanjim/nui.nvim",
    "nvim-lua/plenary.nvim",
    "nvim-tree/nvim-web-devicons",
  },
  lazy = true,
  keys = {
    { "\\",         "<cmd>Neotree toggle float<cr>", desc = "Float file explorer" },
    { "<leader>\\", "<cmd>Neotree toggle right<cr>", desc = "Right file explorer" },
  },

  init = function()
    vim.api.nvim_create_autocmd("BufEnter", {
      group = vim.api.nvim_create_augroup("load_neo_tree", {}),
      desc = "Loads neo-tree when openning a directory",
      callback = function(args)
        local stats = vim.uv.fs_stat(args.file)
        if not stats or stats.type ~= "directory" then
          return
        end
        require("neo-tree")
        return true
      end,
    })
  end,

  -- Neotree setup
  config = function()
    require("neo-tree").setup({
      open_files_do_not_replace_types = { "terminal", "Trouble", "qf", "edgy" },
      window = {
        position = "float",
        width = 35,
      },
      popup_border_style = "rounded",
      filesystem = {
        filtered_items = {
          close_if_last_window = true,
          hide_dotfiles = false,
          hide_gitignored = true,
          hide_by_name = {
            ".github",
            ".gitignore",
          },
          never_show = {
            ".git",
            ".DS_Store",
            "thumbs.db",
          },
          hide_by_pattern = { "*-lock.json" },
        },
      },
      event_handlers = {
        -- Equalize Window Sizes on Neo-tree Open and Close
        {
          event = "neo_tree_window_after_open",
          handler = function(args)
            if args.position == "left" or args.position == "right" then
              vim.cmd("wincmd =")
            end
          end,
        },
        {
          event = "neo_tree_window_after_close",
          handler = function(args)
            if args.position == "left" or args.position == "right" then
              vim.cmd("wincmd =")
            end
          end,
        },
      },
      -- Loads neo-tree when openning a directory
      vim.api.nvim_create_augroup("load_neo_tree", {}),
      -- Match Telescope border
      vim.cmd([[highlight link NeoTreeFloatBorder TelescopeBorder]])
    })
  end,
}
