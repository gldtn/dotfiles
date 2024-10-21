-- Theme switch: enable/disable theme here
local themes = {
	["rose-pine"] = {
		enabled = true,
		git_repo = "rose-pine/neovim",
	},
	["cyberdream"] = {
		enabled = false,
		git_repo = "scottmckendry/cyberdream.nvim",
	},
	["catppuccin"] = {
		enabled = false,
		git_repo = "catppuccin/nvim",
	},
}

-- Get active theme
local active_theme, git_repo
for name, data in pairs(themes) do
	if data.enabled then
		active_theme = name
		git_repo = data.git_repo
		break
	end
end

if not active_theme then
	error("No theme enabled")
end

-- Lazy specs
return {
	{
		-- Theme setup
		git_repo,
		dev = false,
		lazy = false,
		enabled = true,
		priority = 1000,
		config = function()
			require("themes." .. active_theme .. "." .. active_theme).setup()
		end,
	},

	-- Feline config
	{
		"freddiehaddad/feline.nvim",
		dependencies = { "kyazdani42/nvim-web-devicons" },
		enabled = true,
		config = function()
			require("themes." .. active_theme .. ".plugins.feline")
		end,
	},
}
