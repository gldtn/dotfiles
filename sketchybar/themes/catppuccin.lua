local alpha = require("utils.color_utils").with_alpha

local p = {
	rosewater = "f5e0dc",
	flamingo = "f2cdcd",
	pink = "f5c2e7",
	mauve = "cba6f7",
	red = "f38ba8",
	maroon = "eba0ac",
	peach = "fab387",
	yellow = "f9e2af",
	green = "a6e3a1",
	teal = "94e2d5",
	sky = "89dceb",
	sapphire = "74c7ec",
	blue = "89b4fa",
	lavender = "b4befe",
	text = "cdd6f4",
	subtext1 = "bac2de",
	subtext0 = "a6adc8",
	overlay2 = "9399b2",
	overlay1 = "7f849c",
	overlay0 = "6c7086",
	surface2 = "585b70",
	surface1 = "45475a",
	surface0 = "313244",
	base = "1e1e2e",
	mantle = "181825",
	crust = "11111b",
}

return {
	-- primary colors
	primary = p.flamingo,
	secondary = p.maroon,
	highlight = p.yellow, -- spaces & front_app icon
	accent = {
		primary = p.lavender,
		secondary = p.mauve,
	},
	icon = {
		vibrant = p.lavender,
		vivid = p.rosewater,
		subtle = p.subtext0,
		dimmed = p.overlay0,
		muted = p.surface0,
	},
	widgets = {
		label_muted = p.subtext0,
		label_highlight = p.peach,
		mail = {
			unread = p.blue,
			read = p.lavender,
		},
		messages = {
			unread = p.green,
			read = p.lavender,
		},
		brew = {
			outdated = p.maroon,
			updated = p.lavender,
		},
		weather = p.rosewater,
		network = {
			connected = p.green,
			disconnected = p.red,
		},
		volume = {
			slider = {
				bg = p.base,
				knob = p.text,
				bar = p.lavender,
			},
		},
	},
	text = {
		vibrant = p.text,
		vivid = p.rosewater,
		subtle = p.subtext0,
		dimmed = p.overlay0,
		muted = p.surface0,
	},
	bg = {
		primary = p.base,
		secondary = p.surface1,
		tertiary = p.overlay1,
	},
	bracket = {
		bg = p.surface0,
		border = p.mantle,
	},
	popup = {
		bg = p.surface0, -- Transparency can be handled manually if needed
		border = p.surface1,
	},
	bar = {
		bg = alpha(tonumber(p.base, 16), 0.99), -- Adds 50% transparency to bar.bg
		border = p.crust,
	},
}
