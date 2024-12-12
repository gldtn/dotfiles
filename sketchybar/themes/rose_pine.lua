local p = {
	-- rosepine palette
	rp = {
		base = "191724",
		surface = "1f1d2e",
		overlay = "26233a",
		muted = "6e6a86",
		subtle = "908caa",
		text = "e0def4",
		gold = "f6c177",
		love = "eb6f92",
		rose = "ebbcba",
		pine = "31748f",
		foam = "9ccfd8",
		iris = "c4a7e7",
		highlight_low = "21202e",
		highlight_med = "403d52",
		highlight_high = "524f67",
		bg_accent = "2a283e", -- highlight_low (var: moon)
	},
}
local themes = {
	rose_pine = {
		-- primary colors
		primary = p.rp.gold,
		secondary = p.rp.love,
		highlight = p.rp.gold,
		accent = {
			primary = p.rp.foam,
			secondary = p.rp.rose,
		},
		icon = {
			vibrant = p.rp.foam,
			vivid = p.rp.text,
			subtle = p.rp.subtle,
			dimmed = p.rp.muted,
			muted = p.rp.highlight_med,
		},
		widgets = {
			mail = p.rp.foam,
			messages = p.rp.pine,
			mic = {
				on = p.rp.foam,
				off = p.rp.love,
			},
			network = {
				connected = p.rp.foam,
				disconnected = p.rp.love,
			},
		},
		text = {
			vibrant = p.rp.rose,
			vivid = p.rp.text,
			subtle = p.rp.subtle,
			dimmed = p.rp.muted,
			muted = p.rp.highlight_med,
		},
		bg = {
			primary = p.rp.base,
			secondary = p.rp.surface,
			tertiary = p.rp.overlay,
		},
		bracket = {
			bg = p.rp.bg_accent,
			border = "181623", -- custom, between bar bg and bracket bg
		},
		popup = {
			bg = p.rp.surface, -- Transparency can be handled manually if needed
			border = p.rp.highlight_med,
		},
		bar = {
			bg = p.rp.base,
			border = "2c2e34",
		},
	},
}
