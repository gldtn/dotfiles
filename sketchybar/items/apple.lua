local colors = require("colors")
local icons = require("icons")
---@diagnostic disable-next-line: unused-local
local settings = require("settings")

---@diagnostic disable-next-line: unused-local
local apple = sbar.add("item", {
	position = "left",
	icon = {
		padding_left = 8,
		padding_right = 8,
		string = icons.apple,
		color = colors.theme.icon.vibrant,
		font = { size = settings.font.size_map["Large"] },
	},
	label = { drawing = false },
	padding_left = 1,
	padding_right = 1,
	click_script = "$CONFIG_DIR/helpers/menus/bin/menus -s 0",
})
