local icons = require("ui.feline.icons")
local get_colors = require("feline.providers.vi_mode")

local colors = require("themes." .. _G.active_theme .. "." .. _G.active_theme .. "-feline-theme")
local component = {}

-- components separator
local left_separator = ""
local right_separator = ""
local prefix_separator = ""
local suffix_separator = ""

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

-- Spacer component
component.spacer = {
	provider = "  ",
	hl = {
		fg = colors.theme.bg,
		bg = colors.theme.bg,
	},
}

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
-- mode icons
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
		str = prefix_separator,
		hl = {
			fg = colors.theme.bg,
			bg = colors.theme.fg,
		},
	},
}

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
		str = left_separator,
		hl = {
			fg = colors.color.branch_bg,
		},
	},
	right_sep = { right_separator },
}

-- Git signs components
component.git_add = {
	provider = "git_diff_added",
	hl = {
		fg = colors.color.git_add,
	},
	left_sep = "",
	right_sep = "",
}
component.git_delete = {
	provider = "git_diff_removed",
	hl = {
		fg = colors.color.git_delete,
	},
	left_sep = "",
	right_sep = "",
}
component.git_change = {
	provider = "git_diff_changed",
	hl = {
		fg = colors.color.git_change,
	},
	left_sep = "",
	right_sep = "",
}

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

-- LSP client info component
local function lsp_icon_provider()
	local clients = vim.lsp.get_clients({ bufnr = 0 })
	if #clients == 0 then
		return ""
	end

	local lsp_icons = ""
	for _, client in pairs(clients) do
		local lsp_icon = icons.lsp_icons[client.name] or icons.lsp_icons["default"]
		lsp_icons = lsp_icons .. " " .. lsp_icon
	end

	return lsp_icons
end

component.lsp = {
	provider = lsp_icon_provider,
	icon = icons.icon.lsp,
	hl = { fg = colors.color.lsp_icon },
	left_sep = left_separator,
	right_sep = right_separator,
}

-- File info component
component.file_info = {
	provider = {
		name = "file_info",
		opts = { type = "relative" },
	},
	hl = { fg = colors.color.fileinfo_text, bg = colors.color.fileinfo_bg },
	left_sep = left_separator,
	right_sep = right_separator,
}

-- File type component
component.file_type = {
	provider = {
		name = "file_type",
		opts = {
			filetype_icon = true,
		},
	},
	hl = {
		fg = colors.theme.component_fg,
		bg = colors.theme.component_bg,
	},
	left_sep = left_separator,
	right_sep = right_separator,
}

-- Cursor position component
local function cursor_position()
	local line = vim.fn.line(".")
	local col = vim.fn.col(".")
	return string.format(" %d:%d", line, col)
end

component.cursor_position = {
	provider = cursor_position,
	icon = {
		str = icons.icon.position,
		hl = {
			fg = colors.color.position_icon,
			bg = colors.color.position_bg,
		},
	},
	hl = {
		fg = colors.color.position_text,
		bg = "component_bg",
	},
	left_sep = {
		str = left_separator,
		hl = {
			fg = colors.color.position_bg,
		},
	},
	right_sep = right_separator,
}

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
		str = suffix_separator,
		hl = {
			fg = colors.theme.bg,
			bg = colors.theme.fg,
		},
	},
}

-- Lazy updates component
local function has_lazy()
	local lazy_installed, _ = pcall(require, "lazy")
	return lazy_installed
end

local function get_lazy_status()
	if has_lazy() then
		local updates = require("lazy.status").updates()
		if updates then -- Check if `updates` is not nil or false
			return " " .. updates
		end
	end
	return ""
end

component.lazy = {
	provider = get_lazy_status,
	-- enabled = function()
	-- 	return has_lazy() and require("lazy.status").has_updates()
	-- end,
	hl = function()
		if has_lazy() and require("lazy.status").has_updates() then
			return { fg = colors.color.lazy }
		else
			return { fg = colors.theme.fg }
		end
	end,
}

-- Inactive component
local function get_inactive()
	return " " .. string.upper(vim.bo.ft) .. " "
end

component.inactive = {
	provider = get_inactive,
	hl = {
		fg = colors.theme.fg_alt,
		bg = colors.theme.bg,
	},
}

return {
	components = component,
	colors = colors,
}
