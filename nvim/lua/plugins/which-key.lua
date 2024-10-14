return {
	"folke/which-key.nvim",
	dependencies = { "echasnovski/mini.icons", version = false },
	event = "VeryLazy",
	opts = {
		preset = "modern",
		title = true,
		title_pos = "center",
		sort = "alphanum",
	},

	config = function()
		vim.o.timeout = true
		vim.o.timeoutlen = 500

		-- import which-key plugin
		local wk = require("which-key")

		-- define options
		local keyopts = {
			noremap = false,
			nowait = false,
		}

		local c = require("cyberdream.colors").default

		local mappings = {
			{ "<leader>a", group = "ai" },
			{ "<leader>b", group = "buffer/browser" },
			{ "<leader>c", group = "code" },
			{ "<leader>d", group = "dap", icon = { icon = "", color = "blue" } },
			{ "<leader>f", group = "find/files" },
			{ "<leader>g", group = "goto", icon = { icon = "󰆤", color = "yellow" } },
			{ "<leader>l", group = "lsp", icon = { icon = "󰒍", color = "orange" } },
			{ "<leader>m", group = "marks", icon = { icon = "󰙒", color = "purple" } },
			{ "<leader>s", group = "search" },
			{ "<leader>t", group = "toggles" },
			{ "<leader>x", group = "trouble", icon = { icon = "󱏚", color = "red" } },
			{ "<leader>T", group = "treesitter", icon = { icon = "", color = "green" } },
			{ "<leader>Ti", "<cmd>InspectTree<cr>", desc = "inspect tree" },
			{ "<leader>Tu", "<cmd>TSUpdate<cr>", desc = "update parsers" },
			{ "<leader>D", "<cmd>Dashboard<cr>", desc = "dashboard" },
			{ "<leader>L", "<cmd>Lazy<cr>", desc = "lazy" },
			{ "<leader>M", "<cmd>Mason<cr>", desc = "mason" },
		}

		wk.add({ mappings, keyopts })
	end,
}
