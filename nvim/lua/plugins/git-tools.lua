return {
  {
    "NeogitOrg/neogit",
    branch = "nightly",
    event = "BufReadPre",
    dependencies = {
      "nvim-lua/plenary.nvim",         -- required
      "sindrets/diffview.nvim",        -- diff integration
      "nvim-telescope/telescope.nvim", -- telescope integration
    },
    cmd = "Neogit",
    keys = {
      { "<C-g>", "<cmd>Neogit<CR>", desc = "Neogit" },
    },
    -- See: https://github.com/TimUntersberger/neogit#configuration
    opts = {
      kind = "tab", -- tab/floating/split/vsplit
      signs = {
        -- { CLOSED, OPENED }
        hunk = { "", "" },
        item = { " ", " " }, -- 
        section = { " ", " " },
      },
      sections = {
        untracked = {
          folded = true,
          hidden = false,
        },
      },
      commit_editor = { kind = "auto", show_staged_diff = false },
      -- commit_view = { kind = "floating" },
      popup = { kind = "floating", },
      integrations = {
        -- telescope = true, -- use telescope instead of vim.ui.select
        diffview = true,
      },
    },
  },
  {
    "lewis6991/gitsigns.nvim",
    event = { 'BufReadPre', 'BufNewFile' },
    -- See: https://github.com/lewis6991/gitsigns.nvim#usage
    -- stylua: ignore
    opts = {
      signcolumn          = true,  -- Toggle with `:Gitsigns toggle_signs`
      numhl               = false, -- Toggle with `:Gitsigns toggle_numhl`
      linehl              = false, -- Toggle with `:Gitsigns toggle_linehl`
      word_diff           = false, -- Toggle with `:Gitsigns toggle_word_diff`
      current_line_blame  = false, -- Toggle with `:Gitsigns toggle_current_line_blame`
      attach_to_untracked = true,
      watch_gitdir        = {
        interval = 1000,
        follow_files = true,
      },

      on_attach           = function(bufnr)
        local gitsigns = require('gitsigns')

        local function map(mode, l, r, opts)
          opts = opts or {}
          opts.buffer = bufnr
          vim.keymap.set(mode, l, r, opts)
        end

        -- Navigation
        map('n', ']c', function()
          if vim.wo.diff then
            vim.cmd.normal({ ']c', bang = true })
          else
            gitsigns.nav_hunk('next')
          end
        end)

        map('n', '[c', function()
          if vim.wo.diff then
            vim.cmd.normal({ '[c', bang = true })
          else
            gitsigns.nav_hunk('prev')
          end
        end)

        -- Actions
        map('n', '<leader>hp', "<cmd>Gitsigns preview_hunk<CR>", { desc = "Preview hunk" })
        map('n', '<leader>tb', "<cmd>Gitsigns toggle_current_line_blame<CR>", { desc = "[GS] Toggle current line blame" })
        map('n', '<leader>hd', gitsigns.diffthis, { desc = "Diff this" })
        map('n', '<leader>hD', function() gitsigns.diffthis('~') end, { desc = "Diff since last commit" })
        map('n', '<leader>td', "<cmd>Gitsigns toggle_deleted<CR>", { desc = "[GS] Toggle deleted" })

        -- Text object
        map({ 'o', 'x' }, 'ih', ':<C-U>Gitsigns select_hunk<CR>')
      end
    },
  }
}
