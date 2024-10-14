return {
	"goolord/alpha-nvim",
	dependencies = {
		"juansalvatore/git-dashboard-nvim",
	},
	event = "VimEnter",
	config = function()
		local lazy = require("lazy")
		local alpha = require("alpha")
		local startify = require("alpha.themes.theta")
		local devicons = require("nvim-web-devicons")
		local c = require("cyberdream.colors").default

		-- Color palette
		local palette = {
			pink = { "#993259", "#b33f6f", "#cc4f82", "#e55f94", "#ff6ea6", c.pink },
			blue = { "#2b5080", "#3f70b3", "#4f82cc", "#5f94e5", "#6ea6ff", c.blue },
			green = { "#2c802b", "#369938", "#40b345", "#4acc52", "#54e65f", c.green },
			orange = { "#b3873f", "#cc974f", "#e5a75f", "#ffb76e", "#ffc77e", c.orange },
			magenta = { "#802879", "#993291", "#b33da9", "#cc48c1", "#e553d9", c.magenta },
		}

		-- Git dashboard setup
		local git_dashboard = require("git-dashboard-nvim").setup({
			author = "gldtn",
			branch = "main",
			centered = false,
			top_padding = 0,
			bottom_padding = 0,
			gap = " ",
			empty = " ",
			empty_square = "󱓼",
			filled_squares = { "󱓻", "󱓻", "󱓻", "󱓻", "󱓻", "󱓻" },
			is_horizontal = true,
			hide_cursor = true,
			title = "owner_with_repo_name",
			day_label_gap = " ",
			days = { "Sun", "Mon", "Tue", "Wed", "Thu", "Fri", "Sat" },
			months = { "Jan", "Feb", "Mar", "Apr", "May", "Jun", "Jul", "Aug", "Sep", "Oct", "Nov", "Dec" },
			show_contributions_count = true,
			show_only_weeks_with_commits = true,
			use_current_branch = true,
			show_current_branch = true,
			use_git_username_as_author = true,
			basepoints = { "master", "main" },
			fallback_header = "",
			colors = {
				branch_highlight = c.orange,
				dashboard_title = c.orange,
				days_and_months_labels = c.purple,
				empty_square_highlight = c.bgHighlight,
				filled_square_highlights = palette.blue,
			},
		})

		-- Helper functions
		local function surround(v)
			return " " .. v .. " "
		end

		local function info_value()
			local total_plugins = lazy.stats().count
			local loaded_plugins = lazy.stats().loaded
			local version = vim.version()
			local nvim_version_info = surround(devicons.get_icon_by_filetype("vim", {})) .. version.major .. "." .. version.minor .. "." .. version.patch

			return surround("") .. total_plugins .. "/" .. loaded_plugins .. " plugins loaded " .. nvim_version_info
		end

		local function button(lhs, txt, rhs, opts)
			lhs = lhs:gsub("%s", ""):gsub("SPC", "<leader>")

			local default_opts = {
				position = "center",
				shortcut = "[" .. lhs .. "] ",
				cursor = 1,
				width = 52,
				align_shortcut = "right",
				hl_shortcut = { { "Keyword", 0, 1 }, { "Function", 1, #lhs + 1 }, { "Keyword", #lhs + 1, #lhs + 2 } },
				shrink_margin = false,
				keymap = { "n", lhs, rhs, { noremap = true, silent = true, nowait = true } },
			}

			opts = vim.tbl_deep_extend("force", default_opts, opts or {})

			return {
				type = "button",
				val = string.format(" %-1s  %s", opts.icon or "", txt),
				on_press = function()
					local key = vim.api.nvim_replace_termcodes(rhs .. "<Ignore>", true, false, true)
					vim.api.nvim_feedkeys(key, "t", false)
				end,
				opts = opts,
			}
		end

		-- Alpha components
		local heatmap = {
			type = "text",
			val = git_dashboard,
			opts = {
				position = "center",
			},
		}

		local info = {
			type = "text",
			val = info_value(),
			opts = {
				hl = "Function",
				position = "center",
			},
		}

		local buttons = {
			type = "group",
            -- stylua: ignore
			val = {
				{
					type = "text",
					val = string.rep("─", 50),
					opts = {
						hl = "FloatBorder",
						position = "center",
					},
				},
				{ type = "padding", val = 1 },
				button("f", "Find File", ":Telescope find_files<CR>",
                    { icon = "󰱼", hl = { { "markdownH1", 1, 2 } } }),
				button("p", "Find Project", "<cmd>lua require('telescope').extensions.projects.projects{}<CR>",
                    { icon = "󰈗", hl = { { "markdownH2", 1, 2 } } }),
				button("s", "Sessions", "<cmd>Telescope persisted<CR>",
                    { icon = "󰤘", hl = { { "markdownH3", 1, 2 } } }),
				button("m", "PKG Manager", "<cmd>Lazy<CR>",
                    { icon = "󰥥", hl = { { "markdownH4", 1, 2 } } }),
				button("c", "Config", function() require("fzf-lua").files({ cwd = "~/.config/nvim" }) end,
                    { icon = "󱁻", hl = { { "markdownH5", 1, 2 } } }),
				button("d", "Dotfiles", function() require("fzf-lua").files({ cwd = "~/.config" }) end,
                    { icon = "󰈮", hl = { { "markdownH6", 1, 2 } } }),

				{ type = "padding", val = 1 },
				button("q", "Quit", ":qa<CR>", { icon = "", hl = { { "Keyword", 1, 2 } } }),
				{
					type = "text",
					val = string.rep("─", 50),
					opts = {
						hl = "FloatBorder",
						position = "center",
					},
				},
			},
		}
		local mru = {
			type = "group",
			val = {
				{
					type = "text",
					val = "[ Recent files ]",
					opts = {
						hl = "Function",
						position = "center",
					},
				},
				{ type = "padding", val = 1 },
				{
					type = "group",
					val = function()
						return { startify.mru(1, vim.fn.getcwd(), 7) }
					end,
				},
				{ type = "padding", val = 1 },
			},
		}

		-- Custom greeting with time
		local function time_value()
			local datetime = os.date(surround("") .. "%A, %b %Y")
			return "Hello Glaudston, Today is " .. datetime
		end

		local toast = {
			type = "text",
			val = time_value(),
			opts = {
				hl = "Function",
				position = "center",
			},
		}

		-- Configure Alpha
		local config = {
			layout = {
				heatmap,
				mru,
				buttons,
				toast,
				info,
			},
		}

		alpha.setup(config)
	end,
}
