local icons = require("ui.feline.icons")
local colors = require("themes." .. _G.active_theme .. "." .. _G.active_theme .. "-feline-theme")

local component = {}
local left_separator = ""
local right_separator = ""

-- Git branch component
component.git_branch = {
	provider = "git_branch",
	icon = {
		str = icons.icon.branch,
		hl = {
			fg = colors.color.branch_icon,
			bg = colors.color.branch_bg,
		},
	},
	hl = {
		fg = colors.color.branch_text,
		bg = "component_bg",
		style = "bold",
	},
	left_sep = {
		str = "",
		hl = {
			fg = colors.color.branch_bg,
		},
	},
	right_sep = right_separator,
}

-- Git signs components
component.git_add = {
	provider = "git_diff_added",
	hl = {
		fg = colors.color.git_add,
	},
	left_sep = left_separator,
	right_sep = right_separator,
}

component.git_delete = {
	provider = "git_diff_removed",
	hl = {
		fg = colors.color.git_delete,
	},
	left_sep = left_separator,
	right_sep = right_separator,
}

component.git_change = {
	provider = "git_diff_changed",
	hl = {
		fg = colors.color.git_change,
	},
	left_sep = left_separator,
	right_sep = right_separator,
}

return component
