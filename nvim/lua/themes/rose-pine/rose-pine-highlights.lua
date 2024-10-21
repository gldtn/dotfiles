local M = {}

M.setup = function()
	local c = require("rose-pine.palette") -- Pulls the color palette
	local highlights = {
		-- [[ Custom Button Highlights ]] --
		ButtonLove = { fg = c.base, bg = c.love },
		ButtonGold = { fg = c.base, bg = c.gold },
		ButtonRose = { fg = c.base, bg = c.rose },
		ButtonPine = { fg = c.base, bg = c.pine },
		ButtonFoam = { fg = c.base, bg = c.foam },
		ButtonIris = { fg = c.base, bg = c.iris },

		-- [[ dashboard ]] --
		DashboardKey = { fg = c.love },
		DashboardIcon = { fg = c.rose },
		DashboardHeader = { fg = c.gold },
		DashboardFooter = { fg = c.muted },

		-- [[ notify ]] --
		NotifyINFOBody = { bg = c.base },
		NotifyWARNBody = { bg = c.base },
		NotifyERRORBody = { bg = c.base },
		NotifyDEBUGBody = { bg = c.base },
		NotifyTRACEBody = { bg = c.base },
		NotifyINFOBorder = { bg = c.base },
		NotifyWARNBorder = { bg = c.base },
		NotifyERRORBorder = { bg = c.base },
		NotifyDEBUGBorder = { bg = c.base },
		NotifyTRACEBorder = { bg = c.base },

		-- [[ Neo-tree ]] --
		NeoTreeNormal = { bg = c.surface },
		NeoTreeDirectoryIcon = { fg = c.love },
		NeotreeFloatTitle = { link = "ButtonGold" },
		NeoTreeFloatBorder = { fg = c.surface, bg = c.surface },

		-- [[ Treesitter highlights ]] --
		["@boolean"] = { fg = c.love, italic = true }, -- booleans (true/false)
		["@string"] = { fg = c.foam, italic = false }, -- property of a variable
		["@variable"] = { fg = c.gold, italic = false }, -- variables, variable values
		["@operator"] = { fg = c.foam, italic = false }, -- operators (^-+=)
		["@property"] = { fg = c.text, italic = false }, -- property of a variable
		["@string.regexp"] = { fg = c.text, italic = false }, -- property of a variable
		["@variable.member"] = { fg = c.rose, italic = true }, -- var.members

		-- [[ telescope ]] --
		TelescopeTitle = { fg = c.gold },
		TelescopeMatching = { fg = c.gold },
		TelescopeNormal = { fg = c.text, bg = c.surface },
		TelescopeBorder = { fg = c.base, bg = c.surface },
		TelescopeSelection = { fg = c.text, bg = c.highlight_med },
		TelescopeSelectionCaret = { fg = c.love, bg = c.highlight_med },
		TelescopeMultiSelection = { fg = c.text, bg = c.highlight_high },
		-- prompt
		TelescopePromptPrefix = { fg = c.gold },
		TelescopePromptCounter = { fg = c.foam },
		TelescopePromptTitle = { link = "ButtonGold" },
		TelescopePromptNormal = { fg = c.text, bg = c.overlay },
		TelescopePromptBorder = { fg = c.overlay, bg = c.overlay },
		-- preview
		TelescopePreviewTitle = { link = "ButtonFoam" },

		FloatTitle = { link = "ButtonGold" },
		FloatBorder = { fg = c.surface, bg = c.surface },

		-- [[ fzf-lua ]]--
		FzfLuaFzfHeader = { fg = c.muted },
		FzfLuaHeaderText = { fg = c.muted },
		FzfLuaHeaderBind = { fg = c.rose },

		FzfLuaTitle = { link = "ButtonGold" },
		FzfLuaPreviewTitle = { link = "ButtonFoam" },
		FzfLuaFzfBorder = { fg = c.overlay, bg = c.surface }, -- small inset borders
		FzfLuaPreviewBorder = { fg = c.base, bg = c.surface },
	}
	for group, hl in pairs(highlights) do
		vim.api.nvim_set_hl(0, group, hl)
	end
end

return M
