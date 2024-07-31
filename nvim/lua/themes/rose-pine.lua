return {
    require("rose-pine").setup({
        variant = "auto",  -- auto, main, moon, or dawn
        dark_variant = "moon", -- main, moon, or dawn
        dim_inactive_windows = false,
        extend_background_behind_borders = true,

        enable = {
            terminal = true,
            legacy_highlights = false,
            migrations = true, -- Handle deprecated options automatically
        },

        styles = {
            bold = true,
            italic = true,
            transparency = false,
        },

        groups = {
            border = "overlay",
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

        highlight_groups = {
            -- dashboard
            DashboardKey = { fg = "love" },
            DashboardIcon = { fg = "rose" },
            DashboardHeader = { fg = "gold" },
            DashboardFooter = { fg = "muted" },
            -- Neo-tree
            NeoTreeNormal = { bg = "surface" },
            NeoTreeDirectoryIcon = { fg = "love" },
            NeotreeFloatTitle = { fg = "base", bg = "gold" },
            NeoTreeFloatBorder = { fg = "surface", bg = "surface" },
            DashboardIcon = { fg = "gold" },
            DashboardHeader = { fg = "iris" },
            DashboardFooter = { fg = "foam" },
            -- notify
            NotifyINFOBody = { bg = "base" },
            NotifyWARNBody = { bg = "base" },
            NotifyERRORBody = { bg = "base" },
            NotifyDEBUGBody = { bg = "base" },
            NotifyTRACEBody = { bg = "base" },
            NotifyINFOBorder = { bg = "base" },
            NotifyWARNBorder = { bg = "base" },
            NotifyERRORBorder = { bg = "base" },
            NotifyDEBUGBorder = { bg = "base" },
            NotifyTRACEBorder = { bg = "base" },
            -- telescope
            TelescopeTitle = { fg = "base", bg = "love" },
            TelescopeBorder = { fg = "base", bg = "surface" },
            TelescopeNormal = { fg = "subtle", bg = "surface" },
            TelescopePromptTitle = { fg = "base", bg = "gold" },
            TelescopePreviewTitle = { fg = "base", bg = "foam" },
            TelescopePromptNormal = { fg = "text", bg = "overlay" },
            TelescopeSelection = { fg = "text", bg = "highlight_med" },
            TelescopePromptBorder = { fg = "overlay", bg = "overlay" },
            TelescopeSelectionCaret = { fg = "love", bg = "highlight_med" },
            TelescopeMultiSelection = { fg = "text", bg = "highlight_high" },
        },
    }),
    vim.cmd("colorscheme rose-pine")
}
