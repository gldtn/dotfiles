return {
	-- [ Auto pairs ]
	-- auto pairs for brackets, quotes, etc.
	{
		"windwp/nvim-autopairs",
		event = "InsertEnter",
		config = true,
		enabled = false,
		opts = {},
	},
	-- [ Ident Blankline ]
	-- Add a nice indent line to the left of the code
	{
		"lukas-reineke/indent-blankline.nvim",
		main = "ibl",
		event = { "BufReadPre", "BufNewFile" },
		opts = {
			indent = {
				char = "│",
				tab_char = "│",
			},
			scope = { enabled = false },
			exclude = {
				filetypes = {
					"dashboard",
				},
			},
		},
	},
	-- [ Mini Collection ]
	-- indent scope
	{
		"echasnovski/mini.indentscope",
		version = false,
		event = { "BufReadPre", "BufNewFile" },
		opts = {
			symbol = "│",
			options = { try_as_border = true },
		},
	},
	-- mini starter
	{ "echasnovski/mini.pairs", version = false, config = true },

	-- [ TS Comments ]
	-- Add comments based on the type of file
	{
		"folke/ts-comments.nvim",
		opts = {},
		event = "VeryLazy",
		enabled = vim.fn.has("nvim-0.10.0") == 1,
	},
	-- [ Todo Comments ]
	-- highlight TODO, FIXME, etc. in comments
	{
		"folke/todo-comments.nvim",
		cmd = { "TodoTrouble", "TodoFzfLua" },
		event = { "BufReadPre", "BufNewFile" },
		config = true,
        -- stylua: ignore
		keys = {
			{ "<leader>tt", "<cmd>TodoFzfLua<cr>", desc = "Todo" },
			{ "<leader>xt", "<cmd>TodoTrouble<cr>", desc = "Todo (Trouble)" },
			{ "<leader>tT", "<cmd>TodoFzfLua keywords=TODO,FIX,FIXME<cr>", desc = "Todo/Fix/Fixme" },
			{ "<leader>xT", "<cmd>TodoTrouble keywords=TODO,FIX,FIXME<cr>", desc = "Todo/Fix/Fixme (Trouble)" },
            { "]t", function() require("todo-comments").jump_next() end, desc = "Next Todo Comment" },
            { "[t", function() require("todo-comments").jump_prev() end, desc = "Previous Todo Comment" },
		},
	},
	-- [ Yanky ]
	-- Better yank management
	{
		"gbprod/yanky.nvim",
		opts = {},
		event = { "BufReadPre", "BufNewFile" },
        -- stylua: ignore
		keys = {
			{ "y", "<Plug>(YankyYank)", mode = { "n", "x" }, desc = "Yank text" },
			{ "p", "<Plug>(YankyPutAfter)", mode = { "n", "x" }, desc = "Put yanked text after cursor" },
			{ "P", "<Plug>(YankyPutBefore)", mode = { "n", "x" }, desc = "Put yanked text before cursor" },
			{ "gp", "<Plug>(YankyGPutAfter)", mode = { "n", "x" }, desc = "Put yanked text after selection" },
			{ "gP", "<Plug>(YankyGPutBefore)", mode = { "n", "x" }, desc = "Put yanked text before selection" },
            { "<leader>Y", function() require("telescope").extensions.yank_history.yank_history({}) end, desc = "yank history" },
		},
	},
}
