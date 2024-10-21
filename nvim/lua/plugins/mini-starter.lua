return {
	"echasnovski/mini.starter",
	version = false,
	event = "VimEnter",
	config = function()
		local starter = require("mini.starter")

		-- Header (greeting message)
		local header = function()
			return "Good afternoon, gldtn"
		end

		-- Footer (plugin count and startup time)
		local footer = function()
			local stats = require("lazy").stats()
			local ms = (math.floor(stats.startuptime * 100 + 0.5) / 100)
			local version = vim.version()
			local nvim_version = string.format(" Neovim v%s.%s.%s", version.major, version.minor, version.patch)
			return nvim_version .. "\n Loaded plugins: " .. stats.loaded .. "/" .. stats.count .. "\n󱫍 Startup time: " .. ms .. " ms"
		end

		local function format_recent_file(path)
			-- Get a shortened relative path from the current working directory
			local relative_path = vim.fn.fnamemodify(path, ":~:.") -- Clean relative path
			local short_path = vim.fn.pathshorten(relative_path) -- Shorten the path further

			return " " .. "[" .. short_path .. "]"
		end

		local function custom_recent_files(n)
			local items = {}
			local oldfiles = vim.v.oldfiles
			local count = 0
			for _, file in ipairs(oldfiles) do
				if vim.fn.filereadable(file) == 1 then
					table.insert(items, {
						name = vim.fn.fnamemodify(file, ":t"), -- Just the filename
						action = "edit " .. file,
						section = "[ recent files ]", -- Custom section name
					})
					count = count + 1
				end
				if count == n then
					break
				end -- Stop once we've gathered n files
			end
			return items
		end

		-- Setup starter with recent files, built-in actions, and hooks
		starter.setup({
			items = {
				-- Include formatted recent files
				custom_recent_files(5),
				-- starter.sections.recent_files(5, false, format_recent_file),
				-- Custom actions with explicit indexing
				{ name = "f. Files", action = "Telescope find_files", section = "[ files ]" },
				{ name = "p. Projects", action = "Telescope projects", section = "[ files ]" },
				{ name = "d. Dotfiles", action = "FzfLua files ~/.config", section = "[ files ]" },
				{ name = "s. Sessions", action = "Telescope persisted", section = "[ files ]" },
				{ name = "c. Config", action = "FzfLua files ~/.config/nvim", section = "[ files ]" },
				{ name = "l. Lazy", action = "Lazy", section = "[ nvim ]" },
				{ name = "q. Quit", action = "qa", section = "[ nvim ]" },
			},
			-- Apply content hooks: adding bullets, indexing by custom letters, centering, and padding
			content_hooks = {
				starter.gen_hook.adding_bullet("» "), -- Add custom bullet points
				starter.gen_hook.indexing("all", { "[ files ]", "[ nvim ]" }), -- Custom indexing
				starter.gen_hook.aligning("center", "center"), -- Center both horizontally and vertically
			},
			-- Specify query characters based on indexing letters
			query_updaters = "fpslcqd12345",

			-- Header and footer configuration
			header = header,
			footer = footer,
		})

		-- Refresh starter after Lazy finishes loading to update startup time
		vim.schedule(function()
			starter.refresh()
		end)
	end,
}
