return {
	"simonmclean/triptych.nvim",
	lazy = true,
	cmd = { "Triptych" },
	dependencies = {
		"nvim-lua/plenary.nvim",
		{ "echasnovski/mini.icons", version = false },
	},
	config = function()
		require("triptych").setup({
			mappings = {
				-- nav_right = "l",
				open_vsplit = { "<C-v>" },
			},
			options = {
				show_hidden = true,
				backdrop = 100,
				max_height = 45,
				max_width = 180,
				responsive_column_widths = {
					["0"] = { 0, 0.5, 0.5 },
					["120"] = { 0, 0.3, 0.7 },
					["200"] = { 0, 0.3, 0.7 },
				},
				line_numbers = { enabled = true, relative = true },
				highlights = {
					directory_names = "warn",
					directory_icons = "error",
				},
				syntax_highlighting = {
					enabled = true,
					debounce = 100,
				},
				-- border = "none",
				border = { "", "", "", "▌", "", "", " ", " " },
			},
		})
	end,
	vim.keymap.set("n", "<leader>-", ":Triptych<CR>", { silent = true }),
}
