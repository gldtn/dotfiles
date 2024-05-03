return {
  "nvim-telescope/telescope.nvim",
  branch = "0.1.x",
  lazy = true,
  cmd = "Telescope",
  dependencies = {
    "dharmx/track.nvim",
    "nvim-lua/plenary.nvim",
    "nvim-tree/nvim-web-devicons",
    "nvim-telescope/telescope-ui-select.nvim",
    "nvim-telescope/telescope-file-browser.nvim",
    {
      "nvim-telescope/telescope-fzf-native.nvim",
      build =
      "cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build",
      cond = vim.fn.executable("cmake") == 1,
    },
  },

  config = function()
    -- import telescope plugin
    local telescope = require("telescope")
    -- configure telescope
    telescope.setup({
      dynamic_preview_title = true,
      defaults = {
        layout_config = {
          width = 0.80,
          height = 0.80,
        },
        sorting_strategy = "ascending",
        prompt_prefix = "  ",
        selection_caret = "   ",
        entry_prefix = "    ",
        set_env = { ["COLORTERM"] = "truecolor" },
        mappings = {
          i = {
            ["<C-h>"] = "which_key",
            ["<C-q>"] = require("telescope.actions").close,
            ["<C-j>"] = require("telescope.actions").move_selection_next,
            ["<C-k>"] = require("telescope.actions").move_selection_previous,
          },
          n = { ["q"] = require("telescope.actions").close },
        },
        file_ignore_patterns = {
          "node_modules",
          "yarn.lock",
          ".git",
          "DS_Store",
        },
        hidden = true,
      },
      -- pickers
      pickers = {
        buffers = {
          prompt_prefix = "   ",
          previewer = false,
          sort_lastused = true,
          initial_mode = "normal",
          layout_config = {
            width = 0.3,
            height = 0.4,
          },
        },
        colorscheme = {
          prompt_prefix = "   ",
          previewer = false,
          sort_lastused = true,
          layout_config = {
            width = 0.3,
            height = 0.4,
          },
        },
        find_files = {
          prompt_prefix = "   ",
          -- `hidden = true` will still show the inside of `.git/` as it's not `.gitignore`d.
          find_command = { "rg", "--files", "--hidden", "--glob", "!**/.git/*" },
        },
        oldfiles = {
          prompt_prefix = "   ",
        },
        highlights = {
          prompt_prefix = "   ",
        },
        live_grep = {
          prompt_prefix = "   ",
        },
        help_tags = {
          prompt_prefix = "   ",
          mappings = {
            i = {
              ['<CR>'] = 'select_vertical',
            },
          },
        },
        marks = {
          prompt_prefix = "   ",
        },
        commands = {
          prompt_prefix = "   ",
        },
        registers = {
          prompt_prefix = "   ",
        },
        spell_suggests = {
          prompt_prefix = "   ",
        },
        keymaps = {
          prompt_prefix = "   ",
        },
        lsp_code_actions = {
          prompt_prefix = "  ",
          theme = "cursor",
        },
        lsp_references = {
          prompt_prefix = "   ",
        },
        lsp_implementations = {
          prompt_prefix = "   ",
        },
        lsp_document_diagnostics = {
          prompt_prefix = "   ",
        },
      },
      extensions = {
        fzf = {
          override_generic_sorter = false,
          override_file_sorter = true,
        },
        file_browser = {
          dir_icon = "󰉓 ",
          grouped = true,
          initial_mode = "normal",
          hidden = { file_browser = true, folder_browser = true },
        },
        persisted = {
          prompt_prefix = "   ",
          sort_lastused = true,
          layout_config = {
            width = 0.3,
            height = 0.4,
          },
        },
        ["ui-select"] = {
          require("telescope.themes").get_dropdown({
            layout_strategy = "cursor",
            borderchars = { " ", " ", " ", " ", " ", " ", " ", " " },
          }),
        }
      },
    })

    -- load telescope extensions
    telescope.load_extension("fzf")
    telescope.load_extension("track")
    telescope.load_extension("ui-select")
  end,

  keys = {
    { "<leader>ft",       "<cmd>Telescope colorscheme<cr>",                                                    desc = "Themes" },
    { "<leader>fg",       "<cmd>Telescope live_grep<cr>",                                                      desc = "Live Grep" },
    { "<leader>ff",       "<cmd>Telescope find_files<cr>",                                                     desc = "Find File" },
    { "<leader>fh",       "<cmd>Telescope help_tags<cr>",                                                      desc = "Help Tags" },
    { "<leader>fr",       "<cmd>Telescope oldfiles<cr>",                                                       desc = "Recent Files" },
    { "<leader>bf",       "<cmd>Telescope file_browser<CR>",                                                   desc = "Browse Files" },
    { "<leader><leader>", "<cmd>Telescope buffers<cr>",                                                        desc = "List Buffers" },
    { "<leader>fn",       function() require("telescope").extensions.notify.notify() end,                      desc = "Notifications", },
    { "<leader>bd",       "<cmd>Telescope file_browser path=%:p:h select_buffer=true initial_mode=normal<CR>", desc = "Browse Dir" },
  },
}
