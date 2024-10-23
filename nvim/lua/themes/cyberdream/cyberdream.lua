-- colorschemes/cyberdream/cyberdream.lua
local M = {}

M.setup = function()
	-- Base setup for the cyberdream theme
	require("cyberdream").setup({
		transparent = false,
		italic_comments = true,
		borderless_telescope = { border = false, style = "flat" },
		theme = {
			variant = "auto",
			overrides = function(c)
				return {
					-- TreeSitter
					["@Constant"] = { fg = c.pink, italic = true }, -- string, number, boolean, this, super
					["@boolean"] = { fg = c.orange, italic = true }, -- boolean
					["@keyword"] = { fg = c.orange, italic = true }, -- import, export, return...
					["@property"] = { fg = c.fg, italic = false }, -- variables property
					["@variable"] = { fg = c.green, italic = false }, -- variables values
					["@StorageClass"] = { fg = c.purple, italic = true }, -- class keyword
					["@keyword.repeat"] = { fg = c.orange, italic = true }, --keep?
					["@keyword.function"] = { fg = c.orange, italic = true }, -- function()
					["@keyword.conditional"] = { fg = c.orange, italic = true }, --keep?

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

	-- load highlights
	local ok, highlights = pcall(require, "themes.cyberdream.cyberdream-highlights")
	if ok then
		highlights.setup()
	end
end

return M
