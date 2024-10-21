local M = {
	-- [[ Custom Button Highlights ]] --
	ButtonLove = { fg = "base", bg = "love" },
	ButtonGold = { fg = "base", bg = "gold" },
	ButtonRose = { fg = "base", bg = "rose" },
	ButtonPine = { fg = "base", bg = "pine" },
	ButtonFoam = { fg = "base", bg = "foam" },
	ButtonIris = { fg = "base", bg = "iris" },

	-- [[ dashboard ]] --
	DashboardKey = { fg = "love" },
	DashboardIcon = { fg = "rose" },
	DashboardHeader = { fg = "gold" },
	DashboardFooter = { fg = "muted" },

	-- [[ notify ]] --
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

	-- [[ Neo-tree ]] --
	NeoTreeNormal = { bg = "surface" },
	NeoTreeDirectoryIcon = { fg = "love" },
	NeotreeFloatTitle = { link = "ButtonGold" },
	NeoTreeFloatBorder = { fg = "surface", bg = "surface" },

	-- [[ Treesitter highlights ]] --
	["@boolean"] = { fg = "love", italic = true },
	["@string"] = { fg = "foam", italic = false },
	["@variable"] = { fg = "gold", italic = false },
	["@operator"] = { fg = "foam", italic = false },
	["@property"] = { fg = "text", italic = false },
	["@string.regexp"] = { fg = "text", italic = false },
	["@variable.member"] = { fg = "rose", italic = true },

	-- [[ telescope ]] --
	TelescopeTitle = { fg = "gold" },
	TelescopeMatching = { fg = "gold" },
	TelescopeNormal = { fg = "text", bg = "surface" },
	TelescopeBorder = { fg = "base", bg = "surface" },
	TelescopeSelection = { fg = "text", bg = "highlight_med" },
	TelescopeSelectionCaret = { fg = "love", bg = "highlight_med" },
	TelescopeMultiSelection = { fg = "text", bg = "highlight_high" },
	-- prompt
	TelescopePromptPrefix = { fg = "gold" },
	TelescopePromptCounter = { fg = "foam" },
	TelescopePromptTitle = { link = "ButtonGold" },
	TelescopePromptNormal = { fg = "text", bg = "overlay" },
	TelescopePromptBorder = { fg = "overlay", bg = "overlay" },
	-- preview
	TelescopePreviewTitle = { link = "ButtonFoam" },
	TelesscopePreviewBorder = { fg = "base", bg = "overlay" },

	-- [[ defaults ]]
	LazyBackdrop = { bg = "base" },
	FloatTitle = { link = "ButtonGold" },
	FloatBorder = { fg = "surface", bg = "surface" },

	-- [[ fzf-lua ]] --
	-- headers
	FzfLuaFzfHeader = { fg = "muted" },
	FzfLuaHeaderText = { fg = "muted" },
	FzfLuaHeaderBind = { fg = "rose" },
	-- general
	FzfLuaBackdrop = { bg = "base" },
	FzfLuaNormal = { fg = "text", bg = "surface" },
	-- title
	FzfLuaTitle = { link = "ButtonGold" },
	FzfLuaPreviewTitle = { link = "ButtonFoam" },
	-- prompt
	FzfLuaFzfMatching = { fg = "gold" },
	FzfLuaFzfPointer = { fg = "surface" },
	FzfLuaFzfPrompt = { fg = "gold", bg = "surface" },
	-- border
	FzfLuaBorder = { fg = "base", bg = "surface" },
	FzfLuaFzfBorder = { fg = "surface", bg = "surface" }, -- scroll borders, top sep
	FzfLuaPreviewBorder = { fg = "base", bg = "surface" },
}

return M
