return {
	"freddiehaddad/feline.nvim",
	dependencies = { "kyazdani42/nvim-web-devicons" },
	config = function()
		local feline = require("feline")
		local ui = require("ui.feline.components")

		local c = ui.components
		local colors = ui.colors

		feline.setup({
			components = {
				active = {
					-- left
					{
						c.vim_mode_icon,
						c.vim_mode,
						c.spacer,
						c.git_branch,
						c.spacer,
						c.file_info,
						c.spacer,
						c.git_add,
						c.git_delete,
						c.git_change,
						c.spacer,
						c.diagnostic_info,
						c.diagnostic_hints,
						c.diagnostic_errors,
						c.diagnostic_warnings,
					},
					-- middle
					{},
					-- right
					{
						c.lsp,
						-- c.spacer,
						c.lazy,
						c.spacer,
						c.cursor_position,
						c.spacer,
						c.scroll_bar_icon,
						c.scroll_bar_position,
					},
				},
				inactive = {
					{
						c.inactive,
					},
				},
			},
			force_inactive = {
				filetypes = {
					"^qf$",
					"^git$",
					"^help$",
					"^lazy$",
					"^alpha$",
					"^mason$",
					"^packer$",
					"^Neogit*",
					"^trouble$",
					"^lspinfo$",
					"^Outline$",
					"^NvimTree$",
					"^neo%-tree$",
					"^dashboard$",
					"^mini-starter$",
					"^TelescopePrompt$",
				},
				buftypes = { "terminal" },
				bufnames = {},
			},
			theme = colors.theme,
			vi_mode_colors = colors.mode_theme,
		})
	end,
}
