local icon = {
	branch = " ",
	position = "",
	scrollbar = "",
	lsp = " ",
}

local unicodes = {
	n = " ", -- "NORMAL"
	i = " ", -- "INSERT"
	c = " ", -- "COMMAND"
	R = " ", -- "REPLACE"
	v = " ", -- "VISUAL"
	V = " ", -- "V-LINE"
	["␖"] = "󰫙 ", -- "V-BLOCK"
}

local lsp_icons = {
	["zls"] = " ",
	["html"] = " ",
	["gopls"] = " ",
	["cssls"] = " ",
	["taplo"] = " ",
	["jsonls"] = " ",
	["clangd"] = "󰙱 ",
	["lua_ls"] = " ",
	["bashls"] = " ",
	["default"] = " ",
	["pyright"] = " ",
	["copilot"] = " ",
	["phpactor"] = " ",
	["tailwindcss"] = "󱏿 ",
	["intelephense"] = " ",
	["rust_analyzer"] = " ",
}

return {
	icon = icon,
	unicodes = unicodes,
	lsp_icons = lsp_icons,
}
