local icons = require("ui.feline.icons")
local get_colors = require("feline.providers.vi_mode")
local colors = require("themes." .. _G.active_theme .. "." .. _G.active_theme .. "-feline-theme")

local modes = setmetatable({
	["n"] = "NORMAL",
	["no"] = "OP",
	["v"] = "VISUAL",
	["V"] = "V-LINE",
	["␖"] = "V-BLOCK",
	["s"] = "SELECT",
	["S"] = "S-LINE",
	["i"] = "INSERT",
	["ic"] = "INSERT",
	["R"] = "REPLACE",
	["Rv"] = "V-REPLACE",
	["c"] = "COMMAND",
	["cv"] = "EX",
	["r"] = "PROMPT",
	["rm"] = "MORE",
	["r?"] = "CONFIRM",
	["!"] = "SHELL",
	["t"] = "TERM",
}, {
	__index = function()
		return "-"
	end,
})

local function vim_mode_provider()
	local mode = vim.fn.mode()
	local mode_name = modes[mode]
	return string.format("%s", mode_name)
end

local function vim_mode_icon_provider()
	local mode = vim.fn.mode()
	local mode_icon = icons.unicodes[mode] or " "
	return string.format("%s", mode_icon)
end

local component = {}
local left_separator = ""
local right_separator = ""

-- Vim mode names
component.vim_mode = {
	provider = vim_mode_provider,
	hl = function()
		return {
			fg = get_colors.get_mode_color(),
			bg = colors.theme.component_bg,
			style = "bold",
		}
	end,
	left_sep = left_separator,
	right_sep = right_separator,
}

-- Vim mode icons
component.vim_mode_icon = {
	provider = vim_mode_icon_provider,
	hl = function()
		return {
			fg = get_colors.get_mode_color(),
			bg = colors.color.mode_bg,
			style = "bold",
		}
	end,
	left_sep = {
		str = left_separator,
		hl = {
			fg = colors.theme.bg,
			bg = colors.theme.fg,
		},
	},
}

return component
