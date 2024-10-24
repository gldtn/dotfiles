-- Theme name and repo
local themes = {
	["rose-pine"] = "rose-pine/neovim",
	["catppuccin"] = "catppuccin/nvim",
	["tokyonight"] = "folke/tokyonight.nvim",
	["cyberdream"] = "scottmckendry/cyberdream.nvim",
}

-- Set the active theme manually
_G.active_theme = "cyberdream"

-- Configure the themes for Lazy.nvim
local specs = {}
for name, repo in pairs(themes) do
	specs[#specs + 1] = {
		repo,
		name = name,
		lazy = false,
		priority = 1000,
		config = function()
			require("themes." .. name .. "." .. name).setup()
			vim.cmd("colorscheme " .. _G.active_theme)
		end,
	}
end

return specs
