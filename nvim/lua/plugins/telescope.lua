-- thanks @CKolkey for this function
-- See: https://github.com/CKolkey/config/blob/master/nvim/lua/ckolkey/plugins/telescope.lua
local live_grep = function()
	local filetype = vim.fn.expand("%:e")
	if filetype == "" then
		filetype = "*"
	end

	require("telescope").extensions.live_grep_args.live_grep_args({ debounce = 100 })
	-- search only in files of the same type as the current buffer
	-- local keys = vim.api.nvim_replace_termcodes([[-g "*.]] .. filetype .. [[" <c-a><right>]], true, false, true)

	-- vim.api.nvim_feedkeys(keys, "c", false)
end

local grep_current_word = function()
	local word = vim.fn.expand("<cword>")
	local filetype = vim.fn.expand("%:e")

	require("telescope").extensions.live_grep_args.live_grep_args({ debounce = 100 })
	-- search only in files of the same type as the current buffer
	local keys = vim.api.nvim_replace_termcodes([[-g "*.]] .. filetype .. [[" <c-a><right>]] .. word, true, false, true)

	vim.api.nvim_feedkeys(keys, "n", false)
end

return {
	"nvim-telescope/telescope.nvim",
	branch = "0.1.x",
	Lazy = true,
	cmd = "Telescope",
	dependencies = {
		-- "dharmx/track.nvim",
		"nvim-lua/plenary.nvim",
		-- "nvim-tree/nvim-web-devicons",
		{ "echasnovski/mini.icons", version = false },
		"natecraddock/telescope-zf-native.nvim",
		"nvim-telescope/telescope-ui-select.nvim",
		"nvim-telescope/telescope-live-grep-args.nvim",
		{ "nvim-telescope/telescope-file-browser.nvim", dev = false },
		{ "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
	},
	keys = {
		{ "<c-k><c-t>", "<cmd>Telescope colorscheme<cr>", desc = "Themes" },
		{ "<c-k><c-g>", live_grep, desc = "Live Grep" },
		{ "<c-k><c-f>", "<cmd>Telescope find_files<cr>", desc = "Find File" },
		{ "<c-k><c-h>", "<cmd>Telescope help_tags<cr>", desc = "Help Tags" },
		{ "<c-k><c-b>", "<cmd>Telescope file_browser path=%:p:h select_buffer=true initial_mode=normal<CR>", desc = "File drawer" },
		{ "<c-k><c-r>", "<cmd>Telescope oldfiles<cr>", desc = "Recent Files" },
		{ "<leader><leader>", "<cmd>Telescope buffers<cr>", desc = "List Buffers" },
		{
			"<c-k><c-n>",
			function()
				require("telescope").extensions.notify.notify()
			end,
			desc = "Notifications",
		},
		{ "<c-k><c-w>", grep_current_word, desc = "Grep current word" },
	},

	config = function()
		require("config.telescope")
	end,
}
