local p = require("catppuccin.palettes").get_palette("mocha")

local background = p.base
local theme = {
	fg = p.base,
	bg = background,
	fg_alt = p.text,
	bg_alt = p.surface0,
	component_fg = p.rosewater,
	component_bg = background,
}

-- components color
local color = {
	-- mode
	mode_bg = theme.bg,
	-- branch
	branch_bg = theme.bg,
	branch_icon = p.sky,
	branch_text = p.sky,
	-- fileinfo
	fileinfo_bg = theme.bg,
	fileinfo_text = p.rosewater,
	-- position
	position_bg = theme.bg,
	position_icon = p.mauve,
	position_text = p.mauve,
	-- scrollbar
	scrollbar_bg = theme.bg,
	scrollbar_icon = p.pink,
	scrollbar_text = p.pink,
	-- git changes
	git_add = p.green,
	git_delete = p.red,
	git_change = p.peach,
	-- diagnostics
	info = p.blue,
	errors = p.red,
	hints = p.flamingo,
	warnings = p.peach,
	-- lsp
	lsp_icon = p.lavender,
	-- lazy
	lazy = p.green,
}

-- mode-specific colors
local mode_theme = {
	["OP"] = p.mauve,
	["LINES"] = p.mauve,
	["BLOCK"] = p.mauve,
	["VISUAL"] = p.mauve,
	["MORE"] = p.peach,
	["ENTER"] = p.peach,
	["NORMAL"] = p.peach,
	["SELECT"] = p.peach,
	["INSERT"] = p.green,
	["REPLACE"] = p.red,
	["COMMAND"] = p.red,
	["V-REPLACE"] = p.red,
	["NONE"] = p.lavender,
	["TERM"] = p.lavender,
	["SHELL"] = p.lavender,
}

return {
	theme = theme,
	color = color,
	mode_theme = mode_theme,
}
