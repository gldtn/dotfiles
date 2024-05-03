return {
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    event = { "BufReadPre", "BufNewFile" },
    dependencies = {
      "nvim-treesitter/nvim-treesitter-textobjects",
    },
    opts = {
      -- enable syntax highlighting
      highlight = {
        enable = true,
        use_languagetree = true,
        additional_vim_regex_highlighting = true,
      },
      -- enable indentation
      indent = { enable = true },
      -- ensure these language parsers are installed
      ensure_installed = {
        "c",
        "lua",
        "vim",
        "vimdoc",
        "query",
        "json",
        "yaml",
        "toml",
        "bash",
        "html",
        "css",
        "scss",
        "php",
      },
      auto_install = true,
      incremental_selection = { enable = true },
      refactor = { highlight_definitions = { enable = true } },
    },
    config = function(_, opts)
      require("nvim-treesitter.configs").setup(opts)
      -- FIXME: this is a hack to add blade support
      local parser_config = require("nvim-treesitter.parsers").get_parser_configs()

      ---@class ParserConfig
      parser_config.blade = {
        install_info = {
          url = "https://github.com/EmranMR/tree-sitter-blade",
          files = { "src/parser.c" },
          branch = "main",
        },
        filetype = "blade",
      }

      vim.filetype.add({
        pattern = {
          [".*%.blade%.php"] = "blade",
        },
      })
    end,
  },
}
