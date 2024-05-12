return {
    {
        "rose-pine/neovim",
        name = "rose-pine",
        lazy = false,
        priority = 1000,
        opts = {
            -- tokyonight options
            variant = "moon",  -- auto, main, moon, or dawn
            dark_variant = "main", -- main, moon, or dawn
            dim_inactive_windows = false,
            extend_background_behind_borders = true,
            enable = {
                terminal = true,
                legacy_highlights = true,
                migrations = true,
            },
            styles = {
                bold = true,
                italic = true,
                transparency = false,
            },
            groups = {
                border = "muted",
                link = "iris",
                panel = "surface",

                error = "love",
                hint = "iris",
                info = "foam",
                note = "pine",
                todo = "rose",
                warn = "gold",

                git_add = "foam",
                git_change = "rose",
                git_delete = "love",
                git_dirty = "rose",
                git_ignore = "muted",
                git_merge = "iris",
                git_rename = "pine",
                git_stage = "iris",
                git_text = "rose",
                git_untracked = "subtle",

                h1 = "iris",
                h2 = "foam",
                h3 = "rose",
                h4 = "gold",
                h5 = "pine",
                h6 = "foam",
            },
        },
        config = function(_, opts)
            -- require theme
            require("rose-pine").setup(opts)
            -- set colorscheme
            vim.cmd([[colorscheme rose-pine]])
        end,
    },
    {
        "akinsho/toggleterm.nvim",
        event = "ColorScheme",
        config = function()
            local highlights = require("rose-pine.plugins.toggleterm")
            require("toggleterm").setup({ highlights = highlights })
        end
    },
    {
        "nvim-lualine/lualine.nvim",
        event = "ColorScheme",
        config = function()
            require("lualine").setup({
                options = {
                    --- @usage "rose-pine" | "rose-pine-alt"
                    theme = "rose-pine"
                }
            })
        end
    },
    {
        "akinsho/bufferline.nvim",
        event = "ColorScheme",
        config = function()
            local highlights = require("rose-pine.plugins.bufferline")
            require("bufferline").setup({ highlights = highlights })
        end
    },
}
