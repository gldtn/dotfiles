local p = require("rose-pine.palette")

local background = p.base
local theme = {
	fg = p.base,
	bg = background,
	fg_alt = p.subtle,
	bg_alt = p.surface,
	component_fg = p.muted,
	component_bg = background,
}

-- components color
local color = {
	-- mode
	mode_bg = theme.bg,
	-- branch
	branch_bg = theme.bg,
	branch_icon = p.foam,
	branch_text = p.foam,
	-- fileinfo
	fileinfo_bg = theme.bg,
	fileinfo_text = p.subtle,
	-- position
	position_bg = theme.bg,
	position_icon = p.ose,
	position_text = p.rose,
	-- scrollbar
	scrollbar_bg = theme.bg,
	scrollbar_icon = p.love,
	scrollbar_text = p.love,
	-- git changes
	git_add = p.foam,
	git_delete = p.love,
	git_change = p.rose,
	-- diagnostics
	info = p.foam,
	errors = p.love,
	hints = p.rose,
	warnings = p.gold,
	-- lsp
	lsp_icon = p.muted,
	-- lazy
	lazy = p.foam,
}

-- [ modes ]
local mode_theme = {
	["OP"] = p.iris,
	["LINES"] = p.iris,
	["BLOCK"] = p.iris,
	["VISUAL"] = p.iris,
	["MORE"] = p.gold,
	["ENTER"] = p.gold,
	["NORMAL"] = p.gold,
	["SELECT"] = p.gold,
	["INSERT"] = p.love,
	["REPLACE"] = p.love,
	["COMMAND"] = p.love,
	["V-REPLACE"] = p.love,
	["NONE"] = p.subtle,
	["TERM"] = p.subtle,
	["SHELL"] = p.subtle,
}

return {
	theme = theme,
	color = color,
	mode_theme = mode_theme,
}
