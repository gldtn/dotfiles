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
				overrides = function(colors)
					return {
						-- TreeSitter
						["@boolean"] = { fg = colors.cyan, italic = true }, --keep true/false
						["@keyword"] = { fg = colors.orange, italic = true }, -- import, export, return...
						["@Constant"] = { fg = colors.pink, italic = true }, -- string, number, boolean, this, super
						["@StorageClass"] = { fg = colors.purple, italic = true }, -- class keyword
						["@keyword.repeat"] = { fg = colors.orange, italic = true }, --keep
						["@keyword.function"] = { fg = colors.orange, italic = true }, --keep function()
						["@keyword.conditional"] = { fg = colors.orange, italic = true }, --keep

						-- LSP Semantic (0.9+)
						["@lsp.type.modifier"] = { fg = colors.orange, italic = true }, -- static keyword
						-- ["@lsp.type.parameter"] = { fg = colors.fg, italic = true }, --keep colors.
						-- ["@lsp.type.function"] = { fg = colors.blue, italic = true }, --keep require()
						-- ["@lsp.type.namespace"] = { fg = colors.blue, italic = true }, --keep = .setup({})

						-- Telescope misc
						TelescopeMatching = { fg = colors.cyan },
						TelescopeSelectionCaret = { fg = colors.pink },
						TelescopeBorder = { fg = colors.bgAlt, bg = colors.bgAlt },
						-- Telescope prompt
						TelescopePromptCounter = { fg = colors.bg },
						TelescopePromptPrefix = { fg = colors.blue },
						TelescopePromptNormal = { bg = colors.bgAlt },
						-- Telecope titles
						TelescopePromptTitle = { fg = colors.bgAlt, bg = colors.blue, bold = true },
						TelescopeResultsTitle = { fg = colors.blue, bg = colors.bgAlt, bold = true },
						TelescopePreviewTitle = { fg = colors.bgAlt, bg = colors.green, bold = true },
					}
				end,
			},
		})
		vim.cmd("colorscheme cyberdream")
		-- -- define italic groups
		-- local italic_groups = {
		-- 	-- TreeSitter
		-- 	"@boolean",
		-- 	"@keyword",
		-- 	"@keyword.repeat",
		-- 	"@keyword.function",
		-- 	"@keyword.conditional",
		-- 	-- LSP Semantic (0.9+)
		-- 	"@lsp.type.function",
		-- 	"@lsp.type.namespace",
		-- 	"@lsp.type.parameter",
		-- }
		--
		-- -- must appear AFTER the "colorscheme cyberdream" command
		-- for _, group in ipairs(italic_groups) do
		-- 	vim.cmd("hi " .. group .. " gui=italic cterm=italic")
		-- end
	end,
}
