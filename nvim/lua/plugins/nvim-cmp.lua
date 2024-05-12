return {
  "hrsh7th/nvim-cmp",
  lazy = true,
  event = { "BufReadPre", "BufNewFile", "BufWritePre" },
  -- priority = 100,
  dependencies = {
    -- Auto-completion sources
    "hrsh7th/cmp-nvim-lsp", -- LSP source for nvim-cmp
    "hrsh7th/cmp-buffer",   -- source for the text in buffer
    "hrsh7th/cmp-path",     -- source files system paths

    -- Extra sources
    "zbirenbaum/copilot-cmp", -- copilot source for nvim-cmp

    -- Snippets
    { "L3MON4D3/LuaSnip", build = "make install_jsregexp" }, -- snippets engine
    "saadparwaiz1/cmp_luasnip",                              -- auto-completion of snippets

    -- Icons
    "onsails/lspkind-nvim", -- icons for the popup menu
  },

  config = function()
    require "config.completion"
  end,
}
