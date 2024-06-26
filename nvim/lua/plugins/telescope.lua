-- thanks @CKolkey for this function
-- See: https://github.com/CKolkey/config/blob/master/nvim/lua/ckolkey/plugins/telescope.lua
local live_grep = function()
  local filetype = vim.fn.expand("%:e")
  if filetype == "" then
    filetype = "*"
  end

  require("telescope").extensions.live_grep_args.live_grep_args({ debounce = 100 })
  -- search only in files of the same type as the current buffer
  -- local keys = vim.api.nvim_replace_termcodes([[-g "*.]] .. filetype .. [[" <c-a><right>]], true, false, true)

  -- vim.api.nvim_feedkeys(keys, "c", false)
end

local grep_current_word = function()
  local word = vim.fn.expand("<cword>")
  local filetype = vim.fn.expand("%:e")

  require("telescope").extensions.live_grep_args.live_grep_args({ debounce = 100 })
  -- search only in files of the same type as the current buffer
  local keys = vim.api.nvim_replace_termcodes([[-g "*.]] .. filetype .. [[" <c-a><right>]] .. word, true, false, true)

  vim.api.nvim_feedkeys(keys, "n", false)
end

return {
  "nvim-telescope/telescope.nvim",
  branch = "0.1.x",
  Lazy = true,
  cmd = "Telescope",
  dependencies = {
    "dharmx/track.nvim",
    "nvim-lua/plenary.nvim",
    "nvim-tree/nvim-web-devicons",
    "natecraddock/telescope-zf-native.nvim",
    "nvim-telescope/telescope-ui-select.nvim",
    "nvim-telescope/telescope-live-grep-args.nvim",
    { "nvim-telescope/telescope-file-browser.nvim", dev = false },
    { "nvim-telescope/telescope-fzf-native.nvim",   build = "make" },
  },
  keys = {
    { "<c-k><c-t>",       "<cmd>Telescope colorscheme<cr>",                                                    desc = "Themes" },
    { "<c-k><c-g>",       live_grep,                                                                           desc = "Live Grep" },
    { "<c-k><c-f>",       "<cmd>Telescope find_files<cr>",                                                     desc = "Find File" },
    { "<c-k><c-h>",       "<cmd>Telescope help_tags<cr>",                                                      desc = "Help Tags" },
    { "<c-k><c-b>",       "<cmd>Telescope file_browser path=%:p:h select_buffer=true initial_mode=normal<CR>", desc = "File drawer" },
    { "<c-k><c-r>",       "<cmd>Telescope oldfiles<cr>",                                                       desc = "Recent Files" },
    { "<leader><leader>", "<cmd>Telescope buffers<cr>",                                                        desc = "List Buffers" },
    { "<c-k><c-n>",       function() require("telescope").extensions.notify.notify() end,                      desc = "Notifications" },
    { "<c-k><c-w>",       grep_current_word,                                                                   desc = "Grep current word" },
  },

  config = function()
    -- import telescope plugin
    local telescope = require("telescope")
    local actions = require("telescope.actions")
    -- configure telescope
    telescope.setup({
      defaults = {
        layout_config = {
          width = 0.80,
          height = 0.80,
          preview_width = 0.6,
        },
        prompt_prefix = "  ",
        selection_caret = "   ",
        entry_prefix = "    ",
        show_line = false,
        dynamic_preview_title = true,
        sorting_strategy = "ascending",
        set_env = { ["COLORTERM"] = "truecolor" },
        borderchars = {
          prompt = { " ", " ", " ", " ", " ", " ", " ", " " },
          results = { " ", " ", " ", " ", " ", " ", " ", " " },
          preview = { " ", "", "", "▌", "▌", "", "", "▌" },
        },
        mappings = {
          i = {
            ["<C-h>"] = "which_key",
            ["<esc>"] = actions.close,
            ["<tab>"] = actions.toggle_selection + actions.move_selection_next,
            ["<s-tab>"] = actions.toggle_selection + actions.move_selection_previous,
            ["<c-n>"] = actions.move_selection_next,
            ["<c-q>"] = actions.send_selected_to_qflist,
            ["<c-s>"] = actions.file_split,
            ["<cr>"] = function(prompt_bufnr)
              local picker = require("telescope.actions.state").get_current_picker(prompt_bufnr)
              if #picker:get_multi_selection() > 1 then
                actions.send_selected_to_qflist(prompt_bufnr)
                actions.open_qflist(prompt_bufnr)
              else
                actions.select_default(prompt_bufnr)
              end
            end,
          },
          n = { ["<esc>"] = actions.close },
        },
        file_ignore_patterns = {
          "^.git\\/.*",
          "^log\\/.*",
          "^%.DS_Store$",
        },
        -- hidden = true,
        vimgrep_arguments = {
          "rg",
          "--color=never",
          "--no-heading",
          "--with-filename",
          "--line-number",
          -- "--hidden",
          "--column",
          "--smart-case",
          -- "--trim",
        },
      },
      -- pickers
      pickers = {
        buffers = {
          prompt_prefix = "   ",
          results_title = false,
          previewer = false,
          sort_lastused = true,
          initial_mode = "normal",
          layout_config = {
            width = 0.3,
            height = 0.4,
            prompt_position = "top",
          },
          mappings = {
            i = {
              ["<c-d>"] = "delete_buffer",
            },
          },
        },
        colorscheme = {
          prompt_prefix = "   ",
          results_title = false,
          previewer = false,
          sort_lastused = true,
          layout_config = {
            width = 0.3,
            height = 0.4,
            prompt_position = "top",
          },
        },
        find_files = {
          prompt_prefix = "   ",
          cache_picker = false,
          find_command = {
            "fd",
            "--type",
            "f",
            "--strip-cwd-prefix",
            "--color=never",
            "--hidden",
          }
        },
        oldfiles = {
          prompt_prefix = "   ",
        },
        highlights = {
          prompt_prefix = "   ",
        },
        live_grep = {
          prompt_prefix = "   ",
          cache_picker = false,
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
        ["zf-native"] = {
          file = {
            enable = true,
            highlight_results = true,
            match_filename = true,
          },
          generic = {
            enable = true,
            highlight_results = true,
            match_filename = true,
          },
        },
        fzf = {
          fuzzy = true,
          override_generic_sorter = false,
          override_file_sorter = false,
          case_mode = "smart_case",
        },
        live_grep_args = {
          auto_quoting = false,
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
    telescope.load_extension("zf-native")
    telescope.load_extension("ui-select")
    telescope.load_extension("file_browser")
    telescope.load_extension("live_grep_args")
    -- add linenumbers to preview
    vim.cmd "autocmd User TelescopePreviewerLoaded setlocal number"
  end,
}
