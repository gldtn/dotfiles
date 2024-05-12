return {
	"mfussenegger/nvim-dap",
	dependencies = {
		"rcarriga/nvim-dap-ui",
		"nvim-telescope/telescope-dap.nvim",
		dependencies = {
			"nvim-neotest/nvim-nio",
		},
	},
	config = function()
		local dap = require("dap")
		local dapui = require("dapui")

		dap.configurations.lua = {}
		dap.adapters["local-lua"] = {
			type = "executable",
			command = "node",
			args = {
				"~/.config/local-lua-debugger-vscode/extension/debugAdapter.js",
			},
			enrich_config = function(config, on_config)
				if not config["extensionPath"] then
					local c = vim.deepcopy(config)
					-- 💀 If this is missing or wrong you'll see
					-- "module 'lldebugger' not found" errors in the dap-repl when trying to launch a debug session
					c.extensionPath = "~/.config/local-lua-debugger-vscode/"
					on_config(c)
				else
					on_config(config)
				end
			end,
		}

    --[[ nvim-dap events ]]
    -- stylua: ignore start
		dap.listeners.before.attach.dapui_config = function() dapui.open() end
		dap.listeners.before.launch.dapui_config = function() dapui.open() end
		dap.listeners.before.event_terminated.dapui_config = function() dapui.close() end
		dap.listeners.before.event_exited.dapui_config = function() dapui.close() end
    -- stylua: ignore end

    --[[ keymaps ]]
    -- stylua: ignore start
    local set = vim.keymap.set
    set("n", "<Leader>Dc", function() dap.continue() end, { desc = "Continue" })
    set("n", "<Leader>Do", function() dap.step_over() end, { desc = "Step over" })
    set("n", "<Leader>Di", function() dap.step_into() end, { desc = "Step into" })
    set("n", "<Leader>DO", function() dap.step_out() end, { desc = "Step out " })
    set("n", "<Leader>Db", function() dap.toggle_breakpoint() end, { desc = "Toggle breakpoint" })
    set("n", "<Leader>DB", function() dap.set_breakpoint() end, { desc = "Set breakpoint" })
    set("n", "<Leader>Dp", function() dap.set_breakpoint(nil, nil, vim.fn.input("Log point message: ")) end, { desc = "Log point" })

		-- stylua: ignore end
	end,
}
