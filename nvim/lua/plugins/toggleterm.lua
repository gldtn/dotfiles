return {
  "akinsho/toggleterm.nvim",
  event = "VeryLazy",
  opts = function()
    local colors = require("tokyonight.colors").setup()
    require("toggleterm").setup({
      size = 20,
      open_mapping = [[<C-/>]],
      hide_numbers = true,
      shade_filetypes = {},
      shade_terminals = true,
      -- shading_factor = "1",
      start_in_insert = true,
      insert_mappings = true,
      persist_size = true,
      direction = "float",
      close_on_exit = true,
      shell = vim.o.shell,
      float_opts = {
        border = "curved",
        winblend = 0,
        borderchars = { " ", " ", " ", " ", " ", " ", " ", " " },
        title_pos = "center",
      },
      highlights = {
        Normal = { link = "ToggleTermNormal" },
        NormalFloat = { link = "ToggleTermNormalFloat" },
        FloatBorder = { link = "ToggleTermFloatBorder" },
      },
    })
    vim.keymap.set("n", "<C-/>", "<cmd>ToggleTerm<CR>", { desc = "Toggle Terminal" })
  end
}
