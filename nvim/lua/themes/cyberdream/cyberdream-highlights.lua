local M = {}

M.setup = function()
	-- Load the color palette for cyberdream
	local c = require("cyberdream.colors").default

	-- ------------------------------------------------------------
	-- [[ mini.starter ]]
	-- ------------------------------------------------------------

	vim.cmd("hi MiniStarterHeader guifg=" .. c.blue)
	vim.cmd("hi MiniStarterSection guifg=" .. c.pink)
	vim.cmd("hi MiniStarterItemBullet guifg=" .. c.grey)
	vim.cmd("hi MiniStarterItemPrefix guifg=" .. c.orange)
	vim.cmd("hi MiniStarterItem guifg=" .. c.fg)
	vim.cmd("hi MiniStarterQuery guifg=" .. c.cyan)
	vim.cmd("hi MiniStarterCurrent guifg=" .. c.cyan)
	vim.cmd("hi MiniStarterFooter guifg=" .. c.grey)

	-- ------------------------------------------------------------
	-- [[ fzf-lua ]]
	-- ------------------------------------------------------------

	-- keybinds
	vim.api.nvim_set_hl(0, "FzfLuaFzfHeader", { fg = c.grey })
	vim.api.nvim_set_hl(0, "FzfLuaHeaderText", { fg = c.grey })
	vim.api.nvim_set_hl(0, "FzfLuaHeaderBind", { fg = c.orange })
	-- prompt
	vim.api.nvim_set_hl(0, "FzfLuaFzfQuery", { fg = c.fg })
	vim.api.nvim_set_hl(0, "FzfLuaFzfInfo", { fg = c.cyan })
	vim.api.nvim_set_hl(0, "FzfLuaFzfMatch", { fg = c.blue })
	vim.api.nvim_set_hl(0, "FzfLuaFzfPrompt", { fg = c.blue })
	vim.api.nvim_set_hl(0, "FzfLuaFzfMarker", { fg = c.pink })
	vim.api.nvim_set_hl(0, "FzfLuaFzfPointer", { fg = c.bgAlt })
	vim.api.nvim_set_hl(0, "FzfLuaTitle", { fg = c.bgAlt, bg = c.blue })
	-- preview
	vim.api.nvim_set_hl(0, "FzfLuaFzfSeparator", { fg = c.bgHighlight })
	vim.api.nvim_set_hl(0, "FzfLuaPreviewTitle", { fg = c.bgAlt, bg = c.green })
	vim.api.nvim_set_hl(0, "FzfLuaPreviewBorder", { fg = c.bgHighlight, bg = c.bgAlt })
end

return M
