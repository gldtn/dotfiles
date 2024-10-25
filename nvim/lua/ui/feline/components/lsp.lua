local icons = require("ui.feline.icons")
local colors = require("themes." .. _G.active_theme .. "." .. _G.active_theme .. "-feline-theme")

local component = {}
local left_separator = ""
local right_separator = ""

-- LSP client info component
local function lsp_icon_provider()
	local clients = vim.lsp.get_clients({ bufnr = 0 })
	if #clients == 0 then
		return ""
	end

	local lsp_icons = ""
	for _, client in pairs(clients) do
		local lsp_icon = icons.lsp_icons[client.name] or icons.lsp_icons["default"]
		lsp_icons = lsp_icons .. " " .. lsp_icon
	end

	return lsp_icons
end

component.lsp = {
	provider = lsp_icon_provider,
	icon = icons.icon.lsp,
	hl = { fg = colors.color.lsp_icon },
	left_sep = left_separator,
	right_sep = right_separator,
}

return component
