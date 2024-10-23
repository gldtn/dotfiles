local p = require("cyberdream.colors").default

local background = p.bg
local theme = {
	bg = background,
	fg = p.fg,
	fg_alt = p.fg,
	bg_alt = p.bgAlt,
	grey = p.grey,
	component_fg = p.grey,
	component_bg = background,
}

-- components color
local color = {
	-- mode
	modeBg = theme.bg,
	-- branch
	branch_bg = theme.bg,
	branch_icon = p.cyan,
	branch_text = p.cyan,
	-- fileinfo
	fileinfo_bg = theme.bg,
	fileinfo_text = p.fg,
	-- position
	position_bg = theme.bg,
	position_icon = p.magenta,
	position_text = p.magenta,
	-- scrollbar
	scrollbar_bg = theme.bg,
	scrollbar_icon = p.red,
	scrollbar_text = p.red,
	-- git changes
	git_add = p.green,
	git_delete = p.red,
	git_change = p.cyan,
	-- diagnostics
	info = p.blue,
	errors = p.red,
	hints = p.yellow,
	warnings = p.orange,
	-- lsp
	lsp_icon = p.bgHighlight,
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
	["NONE"] = p.yellow,
	["TERM"] = p.yellow,
	["SHELL"] = p.yellow,
}

return {
	theme = theme,
	color = color,
	mode_theme = mode_theme,
}
