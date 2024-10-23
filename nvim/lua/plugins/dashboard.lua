return {
	"scottmckendry/dashboard-nvim",
	event = "VimEnter",
	dev = true,
	config = function()
		require("dashboard").setup({
			theme = "hyper",
			shortcut_type = "number",
			hide = {
				statusline = true,
			},
			config = {
				week_header = { enable = true },
				shortcut = {
					{
						icon = "󰒲  ",
						icon_hl = "Boolean",
						desc = "Update ",
						group = "Directory",
						action = "Lazy update",
						key = "u",
					},
					{
						icon = "   ",
						icon_hl = "Boolean",
						desc = "Files ",
						group = "markdownH5",
						action = "FzfLua files",
						key = "f",
					},
					{
						icon = "   ",
						icon_hl = "Boolean",
						desc = "Recent ",
						group = "markdownH6",
						action = "FzfLua oldfiles",
						key = "r",
					},
					{
						icon = "   ",
						icon_hl = "Boolean",
						desc = "Grep ",
						group = "markdownH4",
						action = "FzfLua live_grep",
						key = "g",
					},
					{
						icon = "   ",
						icon_hl = "Boolean",
						desc = "Notify ",
						group = "markdownH3",
						action = "Telescope notify",
						key = "n",
					},
					{
						icon = "   ",
						icon_hl = "Boolean",
						desc = "Quit ",
						group = "markdownH1",
						action = "qall!",
						key = "q",
					},
				},
				project = { enable = false },
				mru = { enable = false, limit = 5 },
				footer = {},
			},
		})
	end,
}
