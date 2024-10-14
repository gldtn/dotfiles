-- [ require feline & mode colors ]
local feline = require("feline")
local get_colors = require("feline.providers.vi_mode")

-- [ theme ]
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

-- [ components color ]
local color = {
	-- mode
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

-- [ components icon ]
local icon = {
	branch = " ",
	position = "",
	scrollbar = "",
	lsp = " ",
}

-- [ default highlight ]
local default_hl = {
	fg = "component_fg",
	bg = "component_bg",
}

-- [ modes ]
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

-- components
local component = {}

-- components separator
local left_separator = ""
local right_separator = ""

-- spacer component
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

-- [ git branch ]
component.git_branch = {
	provider = "git_branch",
	icon = {
		str = icon.branch,
		hl = {
			fg = color.branchIcon,
			bg = color.branchBg,
		},
	},
	hl = {
		fg = color.branchText,
		bg = "component_bg",
		style = "bold",
	},
	left_sep = {
		str = left_separator,
		hl = {
			fg = color.branchBg,
		},
	},
	right_sep = { right_separator },
}

-- [ git signs ]
component.git_add = {
	provider = "git_diff_added",
	hl = {
		fg = color.git_add,
	},
	left_sep = "",
	right_sep = "",
}
component.git_delete = {
	provider = "git_diff_removed",
	hl = {
		fg = color.git_delete,
	},
	left_sep = "",
	right_sep = "",
}
component.git_change = {
	provider = "git_diff_changed",
	hl = {
		fg = color.git_change,
	},
	left_sep = "",
	right_sep = "",
}

-- [ diagnostics ]
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

-- [ lsp client info ]
local lsp_icons = {
	["zls"] = "",
	["html"] = "",
	["gopls"] = "",
	["cssls"] = "",
	["taplo"] = "",
	["jsonls"] = "",
	["clangd"] = "󰙱",
	["lua_ls"] = "",
	["bashls"] = "",
	["default"] = "",
	["pyright"] = "",
	["copilot"] = "",
	["phpactor"] = "",
	["tailwindcss"] = "󱏿",
	["rust_analyzer"] = "",
	-- ["intelephense"] = "",
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
		icons = icons .. " " .. lsp_icon .. " "
	end

	return icons
end
-- component
component.lsp = {
	provider = lsp_icon_provider,
	icon = nil, -- Remove the static icon
	-- hl = { fg = color.lspIcon },
	left_sep = left_separator,
	right_sep = right_separator,
}

-- [ file info ]
component.file_info = {
	provider = {
		name = "file_info",
		opts = { type = "relative" },
	},
	hl = { fg = color.fileinfoText, bg = color.fileinfoBg },
	left_sep = left_separator,
	right_sep = right_separator,
}

-- [ file type ]
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

-- [ position component ]
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

-- [ scroll bar component ]
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

local function get_current_time()
	local time_str = tostring(os.date("%I:%M %p"))
	return time_str:lower()
end

component.time_clock = {
	provider = function()
		local clock_icon = "  "
		local time = get_current_time()
		return clock_icon .. time
	end,
	hl = {
		fg = "fg",
		bg = "bg",
		style = "bold",
	},
	left_sep = left_separator,
	right_sep = right_separator,
}

-- [ lazy updates ]
local has_lazy = function()
	local lazy_installed, _ = pcall(require, "lazy")
	return lazy_installed
end

component.lazy = {
	provider = function()
		if has_lazy() then
			return require("lazy.status").updates()
		end
		return ""
	end,
	enabled = function()
		return has_lazy() and require("lazy.status").has_updates()
	end,
	hl = function()
		if has_lazy() and require("lazy.status").has_updates() then
			return { fg = "green" }
		else
			return { fg = "fg" }
		end
	end,
}

-- [ inactive component ]
component.inactive = {
	provider = function()
		return " " .. string.upper(vim.bo.ft) .. " "
	end,
	hl = {
		fg = "fg",
		bg = "bgAlt",
	},
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
				component.lazy,
				component.spacer,
				-- component.time_clock,
				-- component.spacer,
				component.cursor_position,
				component.spacer,
				component.scroll_bar_icon,
				component.scroll_bar_position,
			},
		},
		inactive = {
			{
				component.inactive,
			},
		},
	},
	force_inactive = {
		filetypes = {
			"^qf$",
			"^git$",
			"^help$",
			"^lazy$",
			"^alpha$",
			"^mason$",
			"^packer$",
			"^Neogit*",
			"^trouble$",
			"^lspinfo$",
			"^Outline$",
			"^NvimTree$",
			"^neo%-tree$",
			"^dashboard$",
			"^TelescopePrompt$",
		},
		buftypes = {
			"terminal",
		},
		bufnames = {},
	},

	theme = theme,
	vi_mode_colors = mode_theme,
})
