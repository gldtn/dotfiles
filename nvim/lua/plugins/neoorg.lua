return {
	"NeogitOrg/neogit",
	lazy = true,
	event = "BufReadPre",
	dependencies = {
		"nvim-lua/plenary.nvim", -- required
		"sindrets/diffview.nvim", -- diff integration
		"nvim-telescope/telescope.nvim", -- telescope integration
	},
	cmd = "Neogit",
	config = true,
}
