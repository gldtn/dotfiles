local icons = require("ui.feline.icons")
local colors = require("themes." .. _G.active_theme .. "." .. _G.active_theme .. "-feline-theme")

local component = {}
local left_separator = ""
local right_separator = ""

-- Scroll bar component
local function get_scroll_position()
	local line_ratio = vim.api.nvim_win_get_cursor(0)[1] / vim.api.nvim_buf_line_count(0)
	return " " .. tostring(math.floor(line_ratio * 100)) .. "%%"
end

local function get_scrollbar_icon()
	return icons.icon.scrollbar
end

component.scroll_bar_icon = {
	provider = get_scrollbar_icon,
	hl = function()
		return {
			fg = colors.color.scrollbar_icon,
			bg = colors.color.scrollbar_bg,
		}
	end,
	left_sep = {
		str = left_separator,
		hl = function()
			return {
				fg = colors.color.scrollbar_bg,
			}
		end,
	},
}

component.scroll_bar_position = {
	provider = get_scroll_position,
	hl = function()
		return {
			style = "bold",
			fg = colors.color.scrollbar_text,
			bg = "component_bg",
		}
	end,
	right_sep = {
		str = left_separator,
		hl = {
			fg = colors.theme.bg,
			bg = colors.theme.fg,
		},
	},
}

return component
