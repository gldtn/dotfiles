return {
	"mfussenegger/nvim-dap",
	dependencies = {
		"antoinemadec/FixCursorHold.nvim",
		"nvim-neotest/nvim-nio",
		"rcarriga/nvim-dap-ui",
		"theHamsta/nvim-dap-virtual-text",
	},
    -- stylua: ignore
    keys = {
        { "<leader>db", function() require("dap").toggle_breakpoint() end, desc = "toggle dap breakpoint" },
        { "<leader>dc", function() require("dap").continue() end,          desc = "dap continue" },
        { "<leader>di", function() require("dap").step_into() end,         desc = "dap step into" },
        { "<leader>do", function() require("dap").step_over() end,         desc = "dap step over" },
        { "<leader>dO", function() require("dap").step_out() end,          desc = "dap step out" },
        { "<leader>dr", function() require("dap").repl.toggle() end,       desc = "dap repl toggle" },
        { "<leader>dl", function() require("dap").run_last() end,          desc = "dap run last" },
        { "<leader>dt", function() require("dap").terminate() end,         desc = "dap terminate" },
        { "<leader>du", function() require("dapui").toggle() end,          desc = "dap UI toggle" },
    },
	config = function()
		local dap = require("dap")
		require("dapui").setup()

		-- Set DAP breakpoint and UI icons
		vim.fn.sign_define("DapBreakpoint", { text = "", texthl = "Error" })
		vim.fn.sign_define("DapBreakpointCondition", { text = "󰯲", texthl = "Conditional" })
		vim.fn.sign_define("DapBreakpointRejected", { text = "", texthl = "Error" })
		vim.fn.sign_define("DapLogPoint", { text = "", texthl = "Keyword" })
		vim.fn.sign_define("DapStopped", { text = "󱆭", texthl = "String" })

		-- Configure the LLDB adapter for Zig
		dap.adapters.lldb = {
			type = "executable",
			command = "/usr/bin/lldb",
			name = "lldb",
		}

		-- DAP configuration for Zig
		dap.configurations.zig = {
			{
				name = "Launch Zig Program",
				type = "lldb",
				request = "launch",
				program = function()
					return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/zig-out/bin/", "file") -- Customize if needed
				end,
				cwd = "${workspaceFolder}",
				stopOnEntry = false,
				args = {},
				runInTerminal = true, -- Set to true if you prefer terminal-based launch
			},
		}
	end,
}
