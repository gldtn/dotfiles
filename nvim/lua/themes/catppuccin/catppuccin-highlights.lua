local M = {}

M.setup = function(c)
	return {
		-- [[ Custom Button Highlights ]] --
		ButtonRed = { fg = c.base, bg = c.red },
		ButtonBlue = { fg = c.base, bg = c.blue },
		ButtonPeach = { fg = c.base, bg = c.peach },
		ButtonGreen = { fg = c.base, bg = c.green },
		ButtonMauve = { fg = c.base, bg = c.mauve },
		ButtonSapphire = { fg = c.base, bg = c.sapphire },

		-- -- [[ dashboard ]] --
		DashboardHeader = { fg = c.overlay2 },
		-- DashboardKey = { fg = c.love },
		-- DashboardIcon = { fg = c.rose },
		-- DashboardHeader = { fg = c.peach },
		-- DashboardFooter = { fg = c.muted },
		--
		-- -- [[ notify ]] --
		-- NotifyINFOBody = { bg = c.base },
		-- NotifyWARNBody = { bg = c.base },
		-- NotifyERRORBody = { bg = c.base },
		-- NotifyDEBUGBody = { bg = c.base },
		-- NotifyTRACEBody = { bg = c.base },
		-- NotifyINFOBorder = { bg = c.base },
		-- NotifyWARNBorder = { bg = c.base },
		-- NotifyERRORBorder = { bg = c.base },
		-- NotifyDEBUGBorder = { bg = c.base },
		-- NotifyTRACEBorder = { bg = c.base },
		--
		-- -- [[ Neo-tree ]] --
		-- NeoTreeNormal = { bg = c.surface0 },
		-- NeoTreeDirectoryIcon = { fg = c.love },
		-- NeotreeFloatTitle = { link = "Buttonpeach" },
		-- NeoTreeFloatBorder = { fg = c.surface0, bg = c.surface },
		--
		-- -- [[ Treesitter highlights ]] --
		-- ["@boolean"] = { fg = c.love, italic = true }, -- booleans (true/false)
		-- ["@string"] = { fg = c.sky, italic = false }, -- property of a variable
		-- ["@variable"] = { fg = c.peach, italic = false }, -- variables, variable values
		-- ["@operator"] = { fg = c.sky, italic = false }, -- operators (^-+=)
		-- ["@property"] = { fg = c.text, italic = false }, -- property of a variable
		-- ["@string.regexp"] = { fg = c.text, italic = false }, -- property of a variable
		-- ["@variable.member"] = { fg = c.rose, italic = true }, -- var.members

		-- [[ telescope ]] --

		TelescopeTitle = { fg = c.blue },
		TelescopeMatching = { fg = c.yellow },
		TelescopeBorder = { fg = c.mantle, bg = c.mantle },
		TelescopeNormal = { fg = c.lavender, bg = c.mantle },
		TelescopeSelection = { fg = c.lavender, bg = c.surface0 },
		-- TelescopeSelectionCaret = { fg = c.red, bg = c.overlay0 },
		TelescopeMultiSelection = { fg = c.lavender, bg = c.surface0 },
		-- prompt
		TelescopePromptPrefix = { fg = c.blue },
		TelescopePromptCounter = { fg = c.mauve },
		TelescopePromptTitle = { link = "ButtonBlue" },
		TelescopePromptBorder = { fg = c.base, bg = c.surface0 },
		TelescopePromptNormal = { fg = c.lavender, bg = c.surface0 },
		-- preview
		TelescopePreviewTitle = { link = "ButtonGreen" },
		TelescopePreviewBorder = { fg = c.base, bg = c.mantle },

		-- [[ defaults ]]
		LazyBackdrop = { bg = c.base },
		MasonBackdrop = { bg = c.base },
		FloatTitle = { link = "ButtonGreen" },
		FloatBorder = { fg = c.mantle, bg = c.mantle },
		MiniIndentscopeSymbol = { fg = c.blue },

		-- [[ fzf-lua ]]--
		-- headers
		FzfLuaHeaderBind = { fg = c.lavender },
		FzfLuaFzfHeader = { fg = c.overlay0 },
		FzfLuaHeaderText = { fg = c.overlay0 },
		-- general
		FzfLuaBackdrop = { bg = c.base },
		FzfLuaNormal = { fg = c.text, bg = c.mantle },
		-- title
		FzfLuaTitle = { link = "ButtonBlue" },
		FzfLuaPreviewTitle = { link = "ButtonGreen" },
		-- prompt
		FzfLuaFzfMatch = { fg = c.sapphire },
		FzfLuaFzfPointer = { fg = c.mantle },
		FzfLuaFzfPrompt = { fg = c.blue, bg = c.mantle },
		-- borders
		FzfLuaBorder = { fg = c.base, bg = c.mantle },
		FzfLuaFzfBorder = { fg = c.surface0, bg = c.mantle }, -- scroll borders, top sep
		FzfLuaPreviewBorder = { fg = c.base, bg = c.mantle },
	}
end

return M
