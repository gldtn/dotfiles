return {
    "VonHeikemen/lsp-zero.nvim",
    branch = "v3.x",
    dependencies = {
        -- LSP support
        "neovim/nvim-lspconfig",
        "williamboman/mason.nvim",
        "williamboman/mason-lspconfig.nvim",

        -- Autocompletion
        "hrsh7th/nvim-cmp",
        "hrsh7th/cmp-path",
        "hrsh7th/cmp-buffer",
        "hrsh7th/cmp-nvim-lsp",
        "hrsh7th/cmp-nvim-lua",

        -- Snippets
        "L3MON4D3/LuaSnip",
        "rafamadriz/friendly-snippets",
    },

    config = function()
        local lsp_zero = require("lsp-zero")

        -- LSP Zero configuration
        lsp_zero.on_attach(function(client, bufnr)
            -- see :help lsp-zero-keybindings
            lsp_zero.default_keymaps({
                buffer = bufnr,
                preserve_mappings = false,
            })
            lsp_zero.buffer_autoformat()
        end)
        require("mason").setup({})
        require("mason-lspconfig").setup({
            ensure_installed = {
                "taplo",
                "cssls",
                "lua_ls",
                "yamlls",
                "bashls",
                "pyright",
                "phpactor",
                "tailwindcss",
                "rust_analyzer",
            },
            handlers = {
                lsp_zero.default_setup,
                phpactor = function()
                    require("lspconfig").phpactor.setup({
                        on_attach = function(client, bufnr)
                            print("PHP Actor attached")
                        end,
                    })
                end,
            },
        })
    end,
}
