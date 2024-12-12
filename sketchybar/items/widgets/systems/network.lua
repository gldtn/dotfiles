local icons = require("icons")
local colors = require("colors")
local sbar = require("sketchybar")
local settings = require("settings")

local M = {} -- Module table

local config = {
	font = {
		family = settings.font.numbers,
		style = settings.font.style_map["Bold"],
		size = 7.0,
	},
}

local popup_width = 250

-- Function to initialize the widget
function M.setup()
	-- Main network item
	local network_item = sbar.add("item", "widgets.network", {
		position = "right",
		icon = {
			string = "􀙇", -- Default to Wi-Fi connected icon
			color = colors.theme.widgets.network.connected,
		},
		label = { drawing = false },
		padding_right = -1,
	})

	-- Background bracket
	local network_bracket = sbar.add("bracket", "widgets.network.bracket", {
		network_item.name,
	}, {
		background = { color = "NONE" },
		popup = { align = "center", height = 30 },
	})

	-- Popup items
	local ssid = sbar.add("item", {
		position = "popup." .. network_bracket.name,
		width = popup_width,
		align = "center",
		icon = {
			font = { style = config.font.style },
			string = icons.wifi.router,
			align = "center",
		},
		label = {
			font = {
				size = 15,
				style = config.font.style,
			},
			max_chars = 18,
			string = "Not connected",
			align = "center",
		},
		background = {
			height = 2,
			color = colors.theme.bg.tertiary,
			y_offset = -15,
		},
	})

	local ip = sbar.add("item", {
		position = "popup." .. network_bracket.name,
		icon = {
			string = "IP:",
			align = "left",
			width = popup_width / 2,
		},
		label = {
			string = "???.???.???.???",
			align = "right",
			width = popup_width / 2,
		},
	})

	local hostname = sbar.add("item", {
		position = "popup." .. network_bracket.name,
		icon = {
			string = "Hostname:",
			align = "left",
			width = popup_width / 2,
		},
		label = {
			string = "Unknown",
			align = "right",
			width = popup_width / 2,
		},
	})

	local mask = sbar.add("item", {
		position = "popup." .. network_bracket.name,
		icon = {
			align = "left",
			string = "Subnet mask:",
			width = popup_width / 2,
		},
		label = {
			string = "???.???.???.???",
			width = popup_width / 2,
			align = "right",
		},
	})

	local router = sbar.add("item", {
		position = "popup." .. network_bracket.name,
		icon = {
			align = "left",
			string = "Router:",
			width = popup_width / 2,
		},
		label = {
			string = "???.???.???.???",
			width = popup_width / 2,
			align = "right",
		},
	})

	-- Helper function to copy label to clipboard
	local function copy_label_to_clipboard(env)
		local label = sbar.query(env.NAME).label.value
		sbar.exec('echo "' .. label .. '" | pbcopy')
		sbar.set(env.NAME, { label = { string = icons.clipboard, align = "center" } })
		sbar.delay(1, function()
			sbar.set(env.NAME, { label = { string = label, align = "right" } })
		end)
	end

	-- Helper function to get the active interface
	local function get_active_interface(callback)
		sbar.exec("route get default | awk '/interface/ {print $2}'", function(result)
			local active_interface = result:gsub("%s+", "") -- Trim whitespace
			callback(active_interface)
		end)
	end

	-- Update the network status
	local function update_network_status()
		get_active_interface(function(interface)
			sbar.exec("ifconfig " .. interface .. " | awk '/status:/{print $2}'", function(status)
				local connected = status:find("active") ~= nil
				if connected then
					if interface == "en1" then -- Wi-Fi
						network_item:set({
							icon = { string = "􀙇", color = colors.theme.widgets.network.connected },
						})
						sbar.exec(
							"ipconfig getsummary " .. interface .. " | awk -F ' SSID : ' '/ SSID : / {print $2}'",
							function(ssid_result)
								ssid:set({ label = { string = ssid_result or "Unknown" } })
							end
						)
						sbar.exec(
							"networksetup -getinfo Wi-Fi | awk -F 'Subnet mask: ' '/^Subnet mask: / {print $2}'",
							function(mask_result)
								mask:set({ label = { string = mask_result or "Unknown" } })
							end
						)
						sbar.exec(
							"networksetup -getinfo Wi-Fi | awk -F 'Router: ' '/^Router: / {print $2}'",
							function(router_result)
								router:set({ label = { string = router_result or "Unknown" } })
							end
						)
					else -- Wired
						network_item:set({
							icon = { string = "􀤆", color = colors.theme.widgets.network.connected },
						})
						ssid:set({ label = { string = "Wired" } })
						sbar.exec(
							"networksetup -getinfo Ethernet | awk -F 'Subnet mask: ' '/^Subnet mask: / {print $2}'",
							function(mask_result)
								mask:set({ label = { string = mask_result or "Unknown" } })
							end
						)
						sbar.exec(
							"networksetup -getinfo Ethernet | awk -F 'Router: ' '/^Router: / {print $2}'",
							function(router_result)
								router:set({ label = { string = router_result or "Unknown" } })
							end
						)
					end
					sbar.exec("ipconfig getifaddr " .. interface, function(ip_result)
						ip:set({ label = { string = ip_result or "Unknown" } })
					end)
				else
					local icon = interface == "en1" and "􀙈" or "􁣡"
					network_item:set({
						icon = { string = icon, color = colors.theme.widgets.network.disconnected },
					})
					ip:set({ label = { string = "Not connected" } })
					ssid:set({ label = { string = "Not connected" } })
					mask:set({ label = { string = "Not connected" } })
					router:set({ label = { string = "Not connected" } })
				end

				sbar.exec("networksetup -getcomputername", function(hostname_result)
					hostname:set({ label = { string = hostname_result or "Unknown" } })
				end)
			end)
		end)
	end

	-- Subscriptions
	local function hide_popup()
		network_bracket:set({ popup = { drawing = false } })
	end

	local function toggle_popup()
		local should_draw = network_bracket:query().popup.drawing == "off"
		if should_draw then
			network_bracket:set({ popup = { drawing = true } })
			update_network_status()
		else
			hide_popup()
		end
	end

	network_item:subscribe("mouse.clicked", toggle_popup)
	network_item:subscribe("mouse.exited.global", function()
		hide_popup()
	end)

	ssid:subscribe("mouse.clicked", copy_label_to_clipboard)
	hostname:subscribe("mouse.clicked", copy_label_to_clipboard)
	ip:subscribe("mouse.clicked", copy_label_to_clipboard)
	mask:subscribe("mouse.clicked", copy_label_to_clipboard)
	router:subscribe("mouse.clicked", copy_label_to_clipboard)

	-- Initial update
	update_network_status()

	return { "widgets.network" }
end

return M
