local colors = require("themes." .. _G.active_theme .. "." .. _G.active_theme .. "-feline-theme")

local component = {}

-- Diagnostics components
component.diagnostic_errors = {
	provider = "diagnostic_errors",
	hl = {
		fg = colors.color.errors,
	},
}

component.diagnostic_warnings = {
	provider = "diagnostic_warnings",
	hl = {
		fg = colors.color.warnings,
	},
}

component.diagnostic_hints = {
	provider = "diagnostic_hints",
	hl = {
		fg = colors.color.hints,
	},
}

component.diagnostic_info = {
	provider = "diagnostic_info",
	hl = {
		fg = colors.color.info,
	},
}

return component
