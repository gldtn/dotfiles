return {
  "stevearc/conform.nvim",
  lazy = true,
  event = { "BufReadPre", "BufNewFile", "BufWritePre" },
  cmd = { "ConformInfo" },
  dependencies = {
    "rcarriga/nvim-notify",
  },
  keys = {
    {
      "<leader>cf",
      function()
        require("conform").format({ async = true, lsp_fallback = true })
        vim.notify("Formatting complete!", "info", { title = "Buffer Format" })
      end,
      mode = "n",
      desc = "Format buffer",
    },
    {
      "<leader>cd",
      function()
        vim.g.disable_autoformat = true
        vim.notify("Autoformat disabled globaly!", "info", { title = "Auto-format" })
      end,
      mode = "n",
      desc = "Disable autoformat-on-save",
    },
    {
      "<leader>ce",
      function()
        vim.g.disable_autoformat = false
        vim.notify("Autoformat enabled globaly!", "info", { title = "Auto-format" })
      end,
      mode = "n",
      desc = "Enable autoformat-on-save",
    },
  },

  config = function()
    local conform = require("conform")

    conform.setup({
      formatters_by_ft = {
        php = { "pint" },
        lua = { "stylua" },
        css = { "prettierd" },
        html = { "prettierd" },
        yaml = { "prettierd" },
        markdown = { "prettierd" },
        javascript = { "prettierd" },
        python = { "isort", "black" },
        blade = { "blade-formatter" },
      },
      notify_on_error = true,
      format_on_save = function(bufnr)
        -- Disable with a global or buffer-local variable
        if vim.g.disable_autoformat or vim.b[bufnr].disable_autoformat then
          return
        end
        return { timeout_ms = 500, lsp_fallback = true }
      end,

      -- Enable/disable autoformat-on-save functions
      vim.api.nvim_create_user_command("FormatDisable", function(args)
        if args.bang then
          -- FormatDisable! will disable formatting just for this buffer
          vim.b.disable_autoformat = true
        else
          vim.g.disable_autoformat = true
        end
      end, {
        desc = "Disable autoformat-on-save",
        bang = true,
      }),

      vim.api.nvim_create_user_command("FormatEnable", function()
        vim.b.disable_autoformat = false
        vim.g.disable_autoformat = false
      end, {
        desc = "Re-enable autoformat-on-save",
      }),
    })
  end,
}
