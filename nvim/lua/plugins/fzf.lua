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
        { "<D-k><D-f>", "<cmd>FzfLua files<CR>", desc = "Files" },
        { "<D-k><D-t>", "<cmd>FzfLua helptags<CR>", desc = "Helptags" },
        { "<D-k><D-g>", "<cmd>FzfLua live_grep<CR>", desc = "Live grep" },
        { "<D-k><D-h>", "<cmd>FzfLua highlights<CR>", desc = "Highlights" },
        { "<D-k><D-c>", "<cmd>FzfLua colorschemes<CR>", desc = "Colorscheme" },
        { "<D-k><D-d>", function() require("fzf-lua").files({ cwd = "~/.config"}) end, desc = "Dotfiles" },
	},
}
