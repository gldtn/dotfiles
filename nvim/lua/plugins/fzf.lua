return {
	"ibhagwan/fzf-lua",
	cmd = "FzfLua",
	-- optional for icon support
	dependencies = {
		"echasnovski/mini.icons",
		{ "junegunn/fzf", build = "./install --bin" },
	},
	config = function()
		-- calling `setup` is optional for customization
		require("fzf-lua").setup({
			winopts = {
				preview = { default = "bat" },
			},
		})
	end,
    -- stylua: ignore
	keys = {
		{ "<leader>ff", "<cmd>FzfLua files<CR>", desc = "Files" },
        { "<leader>fh", "<cmd>FzfLua helptags<CR>", desc = "Helptags" },
        { "<leader>fg", "<cmd>FzfLua live_grep<CR>", desc = "Live grep" },
        { "<leader>fH", "<cmd>FzfLua highlights<CR>", desc = "Highlights" },
		{ "<leader>fc", "<cmd>FzfLua colorschemes<CR>", desc = "Colorscheme" },
        { "<leader>fd", function() require("fzf-lua").files({ cwd = "~/.config"}) end, desc = "Dotfiles" },
	},
}
