return {
	"folke/noice.nvim",
	event = "VeryLazy",
	dependencies = {
		"MunifTanjim/nui.nvim",
		{
			"rcarriga/nvim-notify",
			opts = {
				timeout = 3000,
				stages = "slide",
				top_down = false,
			},
		},
	},
	opts = {
		cmdline = {
			view = "cmdline",
			format = {
				cmdline = {
					pattern = "^:",
					icon = "",
					icon_hl_group = "@comment.error",
					lang = "vim",
				},
			},
		},
		messages = {
			enabled = true, -- enables the Noice messages UI
			view = "notify", -- default view for messages
			view_error = "notify", -- view for errors
			view_warn = "notify", -- view for warnings
			view_history = "messages", -- view for :messages
			view_search = false, -- view for search count messages. Set to `false` to disable
		},
		routes = {
			{
				view = "split",
				filter = {
					cmdline = "G",
				},
				opts = {
					enter = true,
					render = "plain",
					format = { "{message}" },
					replace = true,
					close = {
						events = { "BufLeave" },
						keys = { "q" },
					},
				},
			},
			{
				view = "split",
				filter = {
					cmdline = "Notifications",
				},
				opts = {
					enter = true,
					render = "plain",
					format = { "{message}" },
					replace = true,
					close = {
						events = { "BufLeave" },
						keys = { "q" },
					},
				},
			},
			{
				view = "mini",
				filter = {
					cmdline = "w",
				},
			},
			{
				view = "mini",
				filter = {
					find = "Config Change Detected. Reloading...",
				},
			},
			{
				view = "mini",
				filter = {
					any = {
						{
							event = "msg_show",
							find = "lines yanked",
						},
						{
							event = "msg_show",
							find = "more lines",
						},
						{
							event = "msg_show",
							find = "direnv:",
						},
						{
							find = "laravel.sail.",
						},
						{
							find = "Pattern not found",
						},
						{
							event = "msg_show",
							kind = "",
							find = "change;",
						},
					},
				},
			},
		},
		presets = {
			bottom_search = true, -- use a classic bottom cmdline for search
			--   command_palette = true, -- position the cmdline and popupmenu together
			long_message_to_split = true, -- long messages will be sent to a split
			-- inc_rename = false, -- enables an input dialog for inc-rename.nvim
			lsp_doc_border = true, -- add a border to hover docs and signature help
		},
		lsp = {
			-- override markdown rendering so that **cmp** and other plugins use **Treesitter**
			override = {
				["vim.lsp.util.convert_input_to_markdown_lines"] = true,
				["vim.lsp.util.stylize_markdown"] = true,
				["cmp.entry.get_documentation"] = true,
			},
		},
	},
}
