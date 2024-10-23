-- Define themes and their repositories
local themes = {
	["rose-pine"] = "rose-pine/neovim",
	["catppuccin"] = "catppuccin/nvim",
	["cyberdream"] = "scottmckendry/cyberdream.nvim",
}

-- Set the active theme manually
_G.active_theme = "catppuccin" -- Set it globally using `_G`

-- Configure the themes for Lazy.nvim
local specs = {}
for name, repo in pairs(themes) do
	specs[#specs + 1] = {
		repo, -- GitHub repository
		name = name, -- Set theme name
		lazy = false, -- Load all themes
		priority = 1000, -- Set theme loading priority
		config = function()
			require("themes." .. name .. "." .. name).setup()
			vim.cmd("colorscheme " .. _G.active_theme)
		end,
	}
end

return specs
