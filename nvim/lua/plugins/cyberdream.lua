return {
	"scottmckendry/cyberdream.nvim",
	dev = true,
	lazy = false,
	priority = 1000,
	config = function()
		require("cyberdream").setup({
			transparent = true,
			italic_comments = true,
			borderless_telescope = { border = false, style = "flat" },
			theme = {
				variant = "auto",
				overrides = function(c)
					return {
						-- TreeSitter
						["@boolean"] = { fg = c.orange, italic = true }, -- true/false
						["@keyword"] = { fg = c.orange, italic = true }, -- import, export, return...
						["@Constant"] = { fg = c.pink, italic = true }, -- string, number, boolean, this, super
						["@StorageClass"] = { fg = c.purple, italic = true }, -- class keyword
						["@keyword.repeat"] = { fg = c.orange, italic = true }, --keep
						["@keyword.function"] = { fg = c.orange, italic = true }, -- function()
						["@keyword.conditional"] = { fg = c.orange, italic = true }, --keep
						["@variable"] = { fg = c.green, italic = false }, -- variables values

						-- LSP Semantic (0.9+)
						-- ["@lsp.type.modifier"] = { fg = c.orange, italic = true }, -- static keyword
						-- ["@lsp.type.parameter"] = { fg = c.cyan, italic = true }, --keep colors.
						-- ["@lsp.type.function"] = { fg = c.blue, italic = true }, --keep require()
						-- ["@lsp.type.namespace"] = { fg = c.blue, italic = true }, --keep = .setup({})

						-- Telescope misc
						TelescopeMatching = { fg = c.cyan },
						TelescopeSelectionCaret = { fg = c.pink },
						TelescopeBorder = { fg = c.bgAlt, bg = c.bgAlt },
						-- Telescope prompt
						TelescopePromptCounter = { fg = c.bg },
						TelescopePromptPrefix = { fg = c.blue },
						TelescopePromptNormal = { bg = c.bgAlt },
						-- Telecope titles
						TelescopePromptTitle = { fg = c.bgAlt, bg = c.blue, bold = true },
						TelescopeResultsTitle = { fg = c.blue, bg = c.bgAlt, bold = true },
						TelescopePreviewTitle = { fg = c.bgAlt, bg = c.green, bold = true },
					}
				end,
			},
		})
		vim.cmd("colorscheme cyberdream")
	end,
}
