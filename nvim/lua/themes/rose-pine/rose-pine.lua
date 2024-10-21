local M = {}
local hl_dir = "themes.rose-pine.rose-pine-highlights"

-- Function to set up the rose-pine theme
M.setup = function()
	require("rose-pine").setup({
		variant = "auto", -- auto, main, moon, or dawn
		dark_variant = "moon", -- main, moon, or dawn
		dim_inactive_windows = false,
		extend_background_behind_borders = true,

		enable = {
			terminal = true,
			legacy_highlights = false,
			migrations = true, -- Handle deprecated options automatically
		},

		styles = {
			bold = true,
			italic = true,
			transparency = false,
		},

		groups = {
			border = "overlay",
			link = "iris",
			panel = "surface",

			error = "love",
			hint = "iris",
			info = "foam",
			note = "pine",
			todo = "rose",
			warn = "gold",

			git_add = "foam",
			git_change = "rose",
			git_delete = "love",
			git_dirty = "rose",
			git_ignore = "muted",
			git_merge = "iris",
			git_rename = "pine",
			git_stage = "iris",
			git_text = "rose",
			git_untracked = "subtle",

			h1 = "iris",
			h2 = "foam",
			h3 = "rose",
			h4 = "gold",
			h5 = "pine",
			h6 = "foam",
		},
	})

	-- Load highlights after setting up the colorscheme
	vim.cmd("colorscheme rose-pine")

	-- Apply the custom highlights
	local ok, highlights = pcall(require, hl_dir)
	if ok then
		highlights.setup()
	end
end

return M