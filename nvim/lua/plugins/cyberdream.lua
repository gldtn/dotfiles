return {
	"scottmckendry/cyberdream.nvim",
	dev = true,
	lazy = false,
	-- enabled = false,
	priority = 1000,
	config = function()
		require("cyberdream").setup({
			transparent = true,
			italic_comments = true,
			borderless_telescope = { border = false, style = "flat" },
			theme = {
				variant = "auto",
				overrides = function(colours)
					return {
						-- italics
						Keyword = { italic = true },
						-- Constant = { italic = true },
						Function = { italic = true },
						Identifier = { italic = true },
						-- non-italics
						Unit = { italic = false },
						Error = { italic = false },
						Number = { italic = false },
						-- Telescope colors
						TelescopeBorder = { fg = colours.bgAlt },
						TelescopeMatching = { fg = colours.cyan },
						TelescopePromptCounter = { fg = colours.bg },
						TelescopePromptPrefix = { fg = colours.blue },
						TelescopeSelectionCaret = { fg = colours.pink },
						TelescopePromptTitle = { fg = colours.bgAlt, bg = colours.blue, bold = true },
						TelescopeResultsTitle = { fg = colours.blue, bg = colours.bgAlt, bold = true },
						TelescopePreviewTitle = { fg = colours.bgAlt, bg = colours.green, bold = true },
					}
				end,
			},
		})
		vim.cmd("colorscheme cyberdream")
	end,
}
