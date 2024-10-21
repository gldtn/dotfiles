-- Theme enable/disable variables
local rose_pine_enabled = true
local cyberdream_enabled = false

-- Determine which theme to load based on the enabled flags
local theme, git_repo
if rose_pine_enabled then
	theme = "rose-pine"
	git_repo = "rose-pine/neovim"
elseif cyberdream_enabled then
	theme = "cyberdream"
	git_repo = "scottmckendry/cyberdream.nvim"
else
	error("No theme enabled")
end

-- Plugin specifications
return {
	{
		-- Theme setup
		git_repo,
		dev = false,
		lazy = false,
		enabled = true,
		priority = 1000,
		config = function()
			require("themes." .. theme .. "." .. theme).setup()
		end,
	},

	-- Feline config
	{
		"freddiehaddad/feline.nvim",
		dependencies = { "kyazdani42/nvim-web-devicons" },
		enabled = true,
		config = function()
			require("themes." .. theme .. ".plugins.feline")
		end,
	},
}
