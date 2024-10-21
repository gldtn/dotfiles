-- catppuccin/catppuccin.lua
local M = {}
local hl_dir = "themes.catppuccin.catppuccin-highlights"

M.setup = function()
	require("catppuccin").setup({
		flavour = "auto", -- latte, frappe, macchiato, mocha
		background = { -- :h background
			light = "latte",
			dark = "mocha",
		},
		transparent_background = false,
		term_colors = false,
		dim_inactive = {
			enabled = false,
			shade = "dark",
			percentage = 0.15,
		},
		styles = { -- see `:h highlight-args`
			comments = { "italic" },
			conditionals = { "italic" },
			loops = {},
			functions = { "italic" },
			keywords = {},
			strings = {},
			variables = {},
			numbers = {},
			booleans = { "italic" },
			properties = {},
			types = {},
			operators = {},
		},
		color_overrides = {},
		custom_highlights = function(colors)
			local custom_hl = require(hl_dir)
			return custom_hl.setup(colors)
		end,
		default_integrations = true,
		integrations = {
			cmp = true,
			gitsigns = true,
			nvimtree = true,
			treesitter = true,
			notify = false,
			mini = {
				enabled = true,
				indentscope_color = "",
			},
		},
	})

	-- Load colorscheme
	vim.cmd("colorscheme catppuccin")
end

return M
