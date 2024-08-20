-- require feline
local feline = require("feline")
-- get mode colors
local get_colors = require("feline.providers.vi_mode")

-- ------------------------------------
-- theme
-- ------------------------------------
local p = require("cyberdream.colors").default

local theme = {
	bg = p.bg,
	bgAlt = p.bgAlt,
	white = p.fg,
	fg = p.bgHighlight,
	grey = p.grey,
	blue = p.blue,
	green = p.green,
	cyan = p.cyan,
	red = p.red,
	yellow = p.yellow,
	magenta = p.magenta,
	pink = p.pink,
	orange = p.orange,
	purple = p.purple,
	component_fg = p.grey,
	component_bg = p.bg,
}

-- ------------------------------------
-- components color
-- ------------------------------------
local color = {
	-- components icon color
	modeBg = "bg",
	-- branch
	branchBg = "bg",
	branchIcon = "cyan",
	branchText = "cyan",
	-- fileinfo
	fileinfoBg = "bg",
	fileinfoText = "white",
	-- position
	positionBg = "bg",
	positionIcon = "magenta",
	positionText = "magenta",
	-- scrollbar
	scrollbarBg = "bg",
	scrollbarIcon = "red",
	scrollbarText = "red",
	-- git changes
	git_add = "green",
	git_delete = "red",
	git_change = "cyan",
	-- diagnostics
	errors = "red",
	warnings = "orange",
	hints = "yellow",
	info = "blue",
}

-- ------------------------------------
-- components icon
-- ------------------------------------
local icon = {
	branch = " ",
	position = " ",
	scrollbar = " ",
	lsp = " ",
}

-- ------------------------------------
-- default highlight
-- ------------------------------------
local default_hl = {
	fg = "component_fg",
	bg = "component_bg",
}

-- ------------------------------------
-- mode colors
-- ------------------------------------
local mode_theme = {
	["NORMAL"] = theme.orange,
	["OP"] = theme.blue,
	["INSERT"] = theme.green,
	["VISUAL"] = theme.magenta,
	["LINES"] = theme.purple,
	["BLOCK"] = theme.pink,
	["REPLACE"] = theme.red,
	["V-REPLACE"] = theme.red,
	["ENTER"] = theme.yellow,
	["MORE"] = theme.yellow,
	["SELECT"] = theme.yellow,
	["SHELL"] = theme.magenta,
	["TERM"] = theme.magenta,
	["NONE"] = theme.grey,
	["COMMAND"] = theme.red,
}

local modes = setmetatable({
	["n"] = "NORMAL",
	["no"] = "OP",
	["v"] = "VISUAL",
	["V"] = "V-LINE",
	[""] = "V-BLOCK",
	["s"] = "SELECT",
	["S"] = "S-LINE",
	[""] = "S-BLOCK",
	["i"] = "INSERT",
	["ic"] = "INSERT",
	["R"] = "REPLACE",
	["Rv"] = "V-REPLACE",
	["c"] = "COMMAND",
	["cv"] = "EX",
	["ce"] = "EX",
	["r"] = "PROMPT",
	["rm"] = "MORE",
	["r?"] = "CONFIRM",
	["!"] = "SHELL",
	["t"] = "TERM",
}, {
	__index = function()
		return "-"
	end,
}) -- }}}

-- mode icons
local unicodes = {
	n = "", --"",
	i = "", -- "",
	c = "",
	R = "",
	v = "",
	V = "",
	[""] = "󰫙",
}

-- Components
local component = {}

-- components separator
local left_separator = ""
local right_separator = ""

-- Spacer component
component.spacer = {
	provider = "  ",
	hl = {
		fg = "bg",
		bg = "bg",
	},
}

-- mode names
component.vim_mode = {
	provider = function()
		local mode = vim.fn.mode()
		local mode_name = modes[mode]
		return string.format(" %s", mode_name)
	end,
	hl = function()
		return {
			fg = get_colors.get_mode_color(),
			bg = "component_bg",
			style = "bold",
		}
	end,
	right_sep = right_separator,
}
-- mode icons
component.vim_mode_icon = {
	provider = function()
		local mode = vim.fn.mode()
		local mode_icon = unicodes[mode] or ""
		return string.format("%s ", mode_icon)
	end,
	hl = function()
		return {
			fg = get_colors.get_mode_color(),
			bg = color.modeBg,
			style = "bold",
		}
	end,
	left_sep = function()
		return {
			str = left_separator,
			hl = {
				fg = color.modeBg,
			},
		}
	end,
}

-- ------------------------------------
-- git branch
-- ------------------------------------

component.git_branch = {
	provider = function()
		local branch = vim.b.gitsigns_head or ""
		if branch ~= "" then
			return " " .. branch
		else
			return ""
		end
	end,
	icon = {
		str = icon.branch,
		hl = function()
			local branch = vim.b.gitsigns_head or ""
			if branch ~= "" then
				return {
					fg = color.branchIcon,
					bg = color.branchBg,
				}
			else
				return nil
			end
		end,
	},
	hl = {
		fg = color.branchText,
		bg = "component_bg",
		style = "bold",
	},
	left_sep = function()
		local branch = vim.b.gitsigns_head or ""
		if branch ~= "" then
			return {
				str = left_separator,
				hl = {
					fg = color.branchBg,
				},
			}
		else
			return ""
		end
	end,
	right_sep = function()
		local branch = vim.b.gitsigns_head or ""
		if branch ~= "" then
			return right_separator
		else
			return ""
		end
	end,
}

-- ------------------------------------
-- git signs
-- ------------------------------------

-- git add
component.git_add = {
	provider = "git_diff_added",
	hl = {
		fg = color.git_add,
	},
	left_sep = "",
	right_sep = "",
}
-- git delete
component.git_delete = {
	provider = "git_diff_removed",
	hl = {
		fg = color.git_delete,
	},
	left_sep = "",
	right_sep = "",
}
-- git change
component.git_change = {
	provider = "git_diff_changed",
	hl = {
		fg = color.git_change,
	},
	left_sep = "",
	right_sep = "",
}

-- ------------------------------------
-- diagnostics
-- ------------------------------------

component.diagnostic_errors = {
	provider = "diagnostic_errors",
	hl = {
		fg = color.errors,
	},
}
component.diagnostic_warnings = {
	provider = "diagnostic_warnings",
	hl = {
		fg = color.warnings,
	},
}
component.diagnostic_hints = {
	provider = "diagnostic_hints",
	hl = {
		fg = color.hints,
	},
}
component.diagnostic_info = {
	provider = "diagnostic_info",
	hl = {
		fg = color.info,
	},
}

-- ------------------------------------
-- lsp client info
-- ------------------------------------
local lsp_icons = {
	["html"] = "  ",
	["gopls"] = "  ",
	["cssls"] = "  ",
	["clangd"] = "פּ ",
	["lua_ls"] = "  ",
	["default"] = " ",
	["bashls"] = "  ",
	["pyright"] = "  ",
	["copilot"] = "  ",
	["phpactor"] = "  ",
	["tailwindcss"] = "󱏿  ",
	["intelephense"] = "  ",
	["rust_analyzer"] = "  ",
}
-- provider
local function lsp_icon_provider()
	local clients = vim.lsp.get_clients({ bufnr = 0 })
	if #clients == 0 then
		return ""
	end

	local icons = ""
	for _, client in pairs(clients) do
		local lsp_icon = lsp_icons[client.name] or lsp_icons["default"]
		icons = icons .. lsp_icon
	end

	return icons
end
-- component
component.lsp = {
	provider = lsp_icon_provider,
	icon = nil, -- Remove the static icon since the provider now handles it
	-- hl = { fg = color.lspIcon },
	left_sep = left_separator,
	right_sep = right_separator,
}

-- ------------------------------------
-- file info
-- ------------------------------------
component.file_info = {
	provider = {
		name = "file_info",
		opts = { type = "relative" },
	},
	hl = { fg = color.fileinfoText, bg = color.fileinfoBg },
	left_sep = left_separator,
	right_sep = right_separator,
}

-- ------------------------------------
-- file type
-- ------------------------------------
component.file_type = {
	provider = {
		name = "file_type",
		opts = {
			filetype_icon = true,
		},
	},
	hl = default_hl,
	left_sep = left_separator,
	right_sep = right_separator,
}

-- ------------------------------------
-- position component
-- ------------------------------------
component.cursor_position = {
	provider = function()
		local line = vim.fn.line(".")
		local col = vim.fn.col(".")
		return string.format(" %d:%d", line, col)
	end,
	icon = {
		str = icon.position,
		hl = {
			fg = color.positionIcon,
			bg = color.positionBg,
		},
	},
	hl = {
		fg = color.positionText,
		bg = "component_bg",
	},
	left_sep = {
		str = left_separator,
		hl = {
			fg = color.positionBg,
		},
	},
	right_sep = right_separator,
}

-- ------------------------------------
-- scroll bar component
-- ------------------------------------
local function get_scroll_position()
	local line_ratio = vim.api.nvim_win_get_cursor(0)[1] / vim.api.nvim_buf_line_count(0)
	return " " .. tostring(math.floor(line_ratio * 100)) .. "%%"
end
-- icon
component.scroll_bar_icon = {
	provider = function()
		return icon.scrollbar
	end,
	hl = function()
		return {
			fg = color.scrollbarIcon,
			bg = color.scrollbarBg,
		}
	end,
	left_sep = {
		str = left_separator,
		hl = function()
			return {
				fg = color.scrollbarBg,
			}
		end,
	},
}
-- percentage
component.scroll_bar_position = {
	provider = get_scroll_position,
	hl = function()
		return {
			style = "bold",
			fg = color.scrollbarText,
			bg = "component_bg",
		}
	end,
	right_sep = right_separator,
}
vim.api.nvim_set_hl(0, "StatusLine", { bg = theme.bg, fg = theme.fg })
feline.setup({
	components = {
		active = {
			-- left
			{
				component.vim_mode_icon,
				component.vim_mode,
				component.spacer,
				component.git_branch,
				component.spacer,
				component.file_info,
				component.spacer,
				component.git_add,
				component.git_delete,
				component.git_change,
				component.spacer,
				component.diagnostic_info,
				component.diagnostic_hints,
				component.diagnostic_errors,
				component.diagnostic_warnings,
			},
			-- middle
			{},
			-- right
			{
				-- component.file_type,
				-- component.copilot_status,
				component.lsp,
				component.spacer,
				component.cursor_position,
				component.spacer,
				component.scroll_bar_icon,
				component.scroll_bar_position,
			},
		},
	},
	theme = theme,
	vi_mode_colors = mode_theme,
})
