local p = require("tokyonight.colors").setup()
local util = require("tokyonight.util")

local background = p.bg
local theme = {
	fg = p.bg,
	bg = background,
	fg_alt = p.fg_dark,
	bg_alt = p.bg_dark,
	component_fg = p.fg_dark,
	component_bg = background,
}

-- components color
local color = {
	-- mode
	mode_bg = theme.bg,
	-- branch
	branch_bg = theme.bg,
	branch_icon = p.cyan,
	branch_text = p.cyan,
	-- fileinfo
	fileinfo_bg = theme.bg,
	fileinfo_text = p.fg_dark,
	-- position
	position_bg = theme.bg,
	position_icon = p.purple,
	position_text = p.purple,
	-- scrollbar
	scrollbar_bg = theme.bg,
	scrollbar_icon = p.magenta,
	scrollbar_text = p.magenta,
	-- git changes
	git_add = p.green,
	git_delete = p.red,
	git_change = p.orange,
	-- diagnostics
	info = p.blue,
	errors = p.red,
	hints = p.green,
	warnings = p.orange,
	-- lsp
	lsp_icon = p.comment,
	-- lazy
	lazy = p.green,
}

-- mode-specific colors
local mode_theme = {
	["OP"] = p.purple,
	["LINES"] = p.purple,
	["BLOCK"] = p.purple,
	["VISUAL"] = p.purple,
	["MORE"] = p.orange,
	["ENTER"] = p.orange,
	["NORMAL"] = p.orange,
	["SELECT"] = p.orange,
	["INSERT"] = p.green,
	["REPLACE"] = p.red,
	["COMMAND"] = p.red,
	["V-REPLACE"] = p.red,
	["NONE"] = p.teal,
	["TERM"] = p.teal,
	["SHELL"] = p.teal,
}

return {
	theme = theme,
	color = color,
	mode_theme = mode_theme,
}
