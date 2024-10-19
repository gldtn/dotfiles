return {
	"ibhagwan/fzf-lua",
	cmd = "FzfLua",
	dependencies = {
		{ "echasnovski/mini.icons", version = false },
		{ "junegunn/fzf", build = "./install --bin" },
	},
    -- stylua: ignore
    keys = {
        { "<C-f><C-f>", "<cmd>FzfLua files<CR>", desc = "Files" },
        { "<C-f><C-w>", "<cmd>FzfLua grep_cword<CR>", desc = "Grep Word" },
        { "<C-f><C-h>", "<cmd>FzfLua helptags<CR>", desc = "Helptags" },
        { "<C-f><C-g>", "<cmd>FzfLua live_grep<CR>", desc = "Live Grep" },
        { "<C-h><C-h>", "<cmd>FzfLua highlights<CR>", desc = "Highlights" },
        { "<C-f><C-c>", "<cmd>FzfLua colorschemes<CR>", desc = "Colorscheme" },
        { "<C-f><C-d>", function() require("fzf-lua").files({ cwd = "~/.config" }) end, desc = "Dotfiles", },
    },
	opts = {
		"default-title",
		fzf_colors = true,
		keymap = {
			builtin = {
				["<C-/>"] = "toggle-help",
				["<C-f>"] = "toggle-fullscreen",
			},
		},
		winopts = {
			border = { "▍", " ", " ", " ", " ", " ", "▍", "▍" },
			preview = { horizontal = "right:70%" },
		},
		files = {
			prompt = "   ",
			cwd_prompt = false,
			formatter = "path.filename_first",
		},
		grep = { prompt = "   " },
		helptags = { prompt = "   " },
		manpages = { prompt = "   " },
	},
	config = function(_, opts)
		require("fzf-lua").setup(opts)

		-- Use cyberdream colors for highlights
		local c = require("cyberdream.colors").default

		-- keybinds
		vim.api.nvim_set_hl(0, "FzfLuaFzfHeader", { fg = c.grey })
		vim.api.nvim_set_hl(0, "FzfLuaHeaderText", { fg = c.grey })
		vim.api.nvim_set_hl(0, "FzfLuaHeaderBind", { fg = c.orange })
		-- prompt
		vim.api.nvim_set_hl(0, "FzfLuaFzfQuery", { fg = c.fg })
		vim.api.nvim_set_hl(0, "FzfLuaFzfInfo", { fg = c.cyan })
		vim.api.nvim_set_hl(0, "FzfLuaFzfMatch", { fg = c.blue })
		vim.api.nvim_set_hl(0, "FzfLuaFzfPrompt", { fg = c.blue })
		vim.api.nvim_set_hl(0, "FzfLuaFzfMarker", { fg = c.pink })
		vim.api.nvim_set_hl(0, "FzfLuaFzfPointer", { fg = c.bgAlt })
		vim.api.nvim_set_hl(0, "FzfLuaTitle", { fg = c.bgAlt, bg = c.blue })
		vim.api.nvim_set_hl(0, "FzfLuaFzfSeparator", { fg = c.bgHighlight })
		-- preview
		vim.api.nvim_set_hl(0, "FzfLuaPreviewTitle", { fg = c.bgAlt, bg = c.green })
		vim.api.nvim_set_hl(0, "FzfLuaPreviewBorder", { fg = c.bgHighlight, bg = c.bgAlt })
	end,
}
