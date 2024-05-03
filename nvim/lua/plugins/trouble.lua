return {
  "folke/trouble.nvim",
  event = "VeryLazy",
  cmd = { "TroubleToggle", "Trouble" },
  dependencies = { "nvim-tree/nvim-web-devicons" },
  opts = {
    opts = { use_diagnostic_signs = true },
  },
  keys = {
    { "<leader>xx", "<cmd>TroubleToggle<cr>",                           desc = "Trouble Toggle" },
    { "<leader>xq", "<cmd>TroubleToggle quickfix<cr>",                  desc = "Trouble Toggle Quickfix" },
    { "<leader>xl", "<cmd>TroubleToggle loclist<cr>",                   desc = "Trouble Toggle Location List" },
    { "gR",         "<cmd>TroubleToggle lsp_references<cr>",            desc = "Trouble Toggle LSP References" },
    { "<leader>xd", "<cmd>TroubleToggle lsp_document_diagnostics<cr>",  desc = "Trouble Toggle LSP Document Diagnostics" },
    { "<leader>xw", "<cmd>TroubleToggle lsp_workspace_diagnostics<cr>", desc = "Trouble Toggle LSP Workspace Diagnostics" },
  },
}
