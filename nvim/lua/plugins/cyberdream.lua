return {
	"scottmckendry/cyberdream.nvim",
	dev = true,
	lazy = false,
	-- enabled = false,
	priority = 1000,
	config = function()
		require("cyberdream").setup({
			transparent = true,
			italic_comments = true,
			borderless_telescope = { style = "flat" },
		})

		vim.cmd("colorscheme cyberdream")
	end,
}
