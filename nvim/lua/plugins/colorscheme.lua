-- Define themes and their repositories
local themes = {
	["rose-pine"] = "rose-pine/neovim",
	["catppuccin"] = "catppuccin/nvim",
	["dracula"] = "Mofiqul/dracula.nvim",
	["cyberdream"] = "scottmckendry/cyberdream.nvim",
}

-- Default active theme
local active_theme = "catppuccin"

-- Check if there's a saved theme from previous session
local function get_saved_theme()
	local path = vim.fn.stdpath("config") .. "/active_theme.txt"
	if vim.fn.filereadable(path) == 1 then
		local theme = vim.fn.readfile(path)[1]
		if themes[theme] then
			return theme
		end
	end
	return nil
end

local saved_theme = get_saved_theme()
if saved_theme then
	active_theme = saved_theme
end

-- Function to save the active theme for persistence
local function save_theme(theme)
	local path = vim.fn.stdpath("config") .. "/active_theme.txt"
	vim.fn.writefile({ theme }, path)
end

-- Switch themes using fzf-lua
local function switch_theme()
	local theme_list = {}
	for name, _ in pairs(themes) do
		table.insert(theme_list, name)
	end

	require("fzf-lua").fzf_exec(theme_list, {
		prompt = "Select a theme> ",
		actions = {
			["default"] = function(selected)
				local new_theme = selected[1]
				if themes[new_theme] then
					-- Set the new theme and save it
					active_theme = new_theme
					save_theme(new_theme)
					vim.cmd("colorscheme " .. new_theme)
					vim.notify("Theme switched to: " .. new_theme, vim.log.levels.INFO, { title = "Theme Switcher" })
				end
			end,
		},
		winopts = {
			height = 0.4,
			width = 0.4,
		},
	})
end

-- Lazy.nvim plugin specifications
local specs = {}

-- Loop through the themes and configure them for Lazy.nvim
for name, repo in pairs(themes) do
	table.insert(specs, {
		repo, -- GitHub repository
		name = name, -- Set theme name
		lazy = false, -- Load all themes
		priority = 1000,
		config = function()
			require("themes." .. name .. "." .. name).setup()
		end,
	})
end

-- Feline setup for the active theme
table.insert(specs, {
	"freddiehaddad/feline.nvim",
	dependencies = { "kyazdani42/nvim-web-devicons" },
	config = function()
		require("themes." .. active_theme .. ".plugins.feline")
		vim.cmd("colorscheme " .. active_theme)
	end,
	vim.keymap.set("n", "<leader>st", switch_theme, { desc = "Switch Theme" }),
})

-- Return the specs to Lazy.nvim
return specs
