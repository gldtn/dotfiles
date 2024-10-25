return {
	"freddiehaddad/feline.nvim",
	dependencies = { "kyazdani42/nvim-web-devicons" },
	config = function()
		local feline = require("feline")
		local colors = require("themes." .. _G.active_theme .. "." .. _G.active_theme .. "-feline-theme")

		-- Load components
		local c = {
			spacer = require("ui.feline.components.spacer").spacer,
			vim_mode = require("ui.feline.components.vim_mode"),
			git = require("ui.feline.components.git"),
			diagnostics = require("ui.feline.components.diagnostics"),
			lsp = require("ui.feline.components.lsp").lsp,
			lazy = require("ui.feline.components.lazy").lazy,
			fileinfo = require("ui.feline.components.fileinfo").file_info,
			filetype = require("ui.feline.components.filetype").filetype,
			cursor = require("ui.feline.components.cursor").cursor_position,
			scrollbar = require("ui.feline.components.scrollbar"),
			inactive = require("ui.feline.components.inactive").inactive,
		}

		-- Components structure
		feline.setup({
			components = {
				active = {
					-- left
					{
						c.vim_mode.vim_mode_icon,
						c.vim_mode.vim_mode,
						c.spacer,
						c.git.git_branch,
						c.spacer,
						c.fileinfo,
						c.spacer,
						c.git.git_add,
						c.git.git_delete,
						c.git.git_change,
						c.spacer,
						c.diagnostics.diagnostic_info,
						c.diagnostics.diagnostic_hints,
						c.diagnostics.diagnostic_errors,
						c.diagnostics.diagnostic_warnings,
					},
					-- middle
					{},
					-- right
					{
						c.lsp,
						c.lazy,
						c.spacer,
						c.cursor,
						c.spacer,
						c.scrollbar.scroll_bar_icon,
						c.scrollbar.scroll_bar_position,
					},
				},
				inactive = {
					{
						c.inactive.inactive,
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
