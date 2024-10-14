return {
	"folke/noice.nvim",
	event = "VeryLazy",
	enabled = true,
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
	},
}
