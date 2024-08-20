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
						TelescopeBorder = { fg = colours.bgAlt },
						TelescopeMatching = { fg = colours.cyan },
						TelescopePromptPrefix = { fg = colours.blue },
						TelescopePromptCounter = { fg = colours.bg },
						TelescopeSelectionCaret = { fg = colours.pink },
						TelescopePreviewTitle = { fg = colours.bgAlt, bg = colours.green, bold = true },
						TelescopeResultsTitle = { fg = colours.blue, bg = colours.bgAlt, bold = true },
						TelescopePromptTitle = { fg = colours.bgAlt, bg = colours.blue, bold = true },
					}
				end,
			},
		})

		vim.cmd("colorscheme cyberdream")
	end,
}
