return {
	{
		"neovim/nvim-lspconfig",
		event = { "BufReadPre", "BufNewFile" },
		dependencies = {
			{ "folke/neodev.nvim", event = "LspAttach", opts = {} },
			{ "williamboman/mason.nvim", config = true },
		},

		config = function()
			-- Global mappings.
			-- See `:help vim.diagnostic.*` for documentation on any of the below functions
			vim.keymap.set("n", "<leader>ld", vim.diagnostic.open_float, { desc = "Open diagnostic (LSP)" })
			vim.keymap.set("n", "<leader>lp", vim.diagnostic.goto_prev, { desc = "Goto previous diagnostic (LSP)" })
			vim.keymap.set("n", "<leader>ln", vim.diagnostic.goto_next, { desc = "Goto next diagnostic (LSP)" })
			vim.keymap.set("n", "<leader>lb", vim.diagnostic.setloclist, { desc = "Buffer diagnostics (LSP)" })

			-- Use LspAttach autocommand to only map the following keys
			-- after the language server attaches to the current buffer
			vim.api.nvim_create_autocmd("LspAttach", {
				group = vim.api.nvim_create_augroup("UserLspConfig", {}),
				callback = function(ev)
					-- Enable completion triggered by <c-x><c-o>
					vim.bo[ev.buf].omnifunc = "v:lua.vim.lsp.omnifunc"

					local map = function(keys, func, desc)
						vim.keymap.set("n", keys, func, { buffer = ev.buf, desc = "" .. desc })
					end

					local telescope = require("telescope.builtin")
					local buf = vim.lsp.buf
                    -- stylua: ignore
                    map("<leader>cr", buf.rename, "Rename")
					map("<leader>ca", buf.code_action, "Code Action")
					map("<leader>gD", buf.declaration, "Goto Declaration")
					map("<leader>gd", buf.definition, "Goto Definition")
					map("<leader>gt", telescope.lsp_type_definitions, "Type Definition")
					map("<leader>gi", telescope.lsp_implementations, "Goto Implementation")
					map("<leader>gr", telescope.lsp_references, "Goto References")
					map("<leader>gl", vim.diagnostic.open_float, "Open Diagnostic Float")

					map("K", buf.hover, "Hover")
					map("<leader>gv", "<cmd>vsplit | lua vim.lsp.buf.definition()<cr>", "Goto Definition in Vertical Split")
				end,
			})
		end,
	},
	{
		"williamboman/mason-lspconfig.nvim",
		dependencies = { "mason.nvim" },

		config = function()
			require("neodev").setup({})

			require("mason-lspconfig").setup({
				automatic_installation = true,
				ensure_installed = {
					"zls",
					"cssls",
					"lua_ls",
					"bashls",
					"phpactor",
					"tailwindcss",
				},
			})
			-- Automatically setup mason handlers for all lsp servers
			require("mason-lspconfig").setup_handlers({
				function(server_name)
					require("lspconfig")[server_name].setup({
						on_attach = function(client, bufnr)
							require("mason").setup({
								server_name = server_name,
								client = client,
								bufnr = bufnr,
							})
						end,
						capabilities = require("cmp_nvim_lsp").default_capabilities(),
					})
				end,
				-- Additional server configurations
				["lua_ls"] = function()
					require("lspconfig").lua_ls.setup({
						settings = {
							Lua = {
								format = {
									enable = true,
									align_array_table = false,
								},
								hint = {
									enable = false,
									-- await = true, -- If a function has been defined as @async, display an await hint when it is being called.
									-- setType = true, -- Show a hint to display the type being applied at assignment operations.
									-- paramType = true, -- Show a hint for parameter types at a function definition. Requires the parameters to be defined with @param
									-- paramName = "All", -- All, Literal, Disable
									-- semicolon = "SameLine", -- All, SameLine, Disable
									-- arrayIndex = "Disable", -- Enable, Auto, Disable
								},
							},
						},
					})
				end,
				["phpactor"] = function()
					require("lspconfig").phpactor.setup({
						init_options = {
							["language_server_worse_reflection.inlay_hints.enable"] = true,
							["language_server_worse_reflection.inlay_hints.types"] = true,
						},
					})
				end,
				["zls"] = function()
					require("lspconfig").zls.setup({
						cmd = { "/usr/local/bin/zls" },
						settings = {
							zls = {
								-- Enable the zls formatter
								format = {
									enable = true,
								},
							},
						},
					})
				end,
			})
		end,
	},
}
