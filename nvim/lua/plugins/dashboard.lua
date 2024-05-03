return {
  "nvimdev/dashboard-nvim",
  dependencies = {
    "kyazdani42/nvim-web-devicons",
    "nvim-lua/popup.nvim",
    "nvim-lua/plenary.nvim",
    "nvim-telescope/telescope.nvim",
  },
  event = "VimEnter",
  opts = function()
    -- stylua: ignore start
    local logo = [[
      @gldtn
      ██╗  ██╗██╗████████╗ █████╗ ███╗   ██╗ █████╗
      ██║ ██╔╝██║╚══██╔══╝██╔══██╗████╗  ██║██╔══██╗
      █████╔╝ ██║   ██║   ███████║██╔██╗ ██║███████║
      ██╔═██╗ ██║   ██║   ██╔══██║██║╚██╗██║██╔══██║
      ██║  ██╗██║   ██║   ██║  ██║██║ ╚████║██║  ██║
      ╚═╝  ╚═╝╚═╝   ╚═╝   ╚═╝  ╚═╝╚═╝  ╚═══╝╚═╝  ╚═╝
    ]]
    -- stylua: ignore end

    -- Add 12 empty lines above and below the logo
    logo = string.rep("\n", 10) .. logo .. "\n\n"

    -- Configure dashboard-nvim
    local opts = {
      theme = "doom",
      hide = {
        -- this is taken care of by lualine
        -- enabling this messes up the actual laststatus setting after loading a file
        statusline = false,
      },
      config = {
        header = vim.split(logo, "\n"),
        center = {
          {
            action = "Telescope find_files",
            desc = " Find File",
            icon = " ",
            key = "f",
          },
          {
            action = "Telescope oldfiles",
            desc = " Open Recent File",
            icon = " ",
            key = "r",
          },
          {
            action = "Telescope live_grep",
            desc = " Search Project",
            icon = " ",
            key = "g",
          },
          {
            action = "Telescope file_browser",
            desc = " Browse Files",
            icon = "󰥨 ",
            key = "b",
          },
          {
            action = "Telescope persisted",
            desc = " List Sessions",
            icon = " ",
            key = "s",
          },
          {
            action = "Lazy",
            desc = " Package Manager",
            icon = " ",
            key = "l",
          },
          {
            action = "Mason",
            desc = " Mason",
            icon = " ",
            key = "m",
          },
          {
            action = "Telescope help_tags",
            desc = " Search Help",
            icon = "󰋖 ",
            key = "h",
          },
        },
        footer = function()
          local stats = require("lazy").stats()
          local ms = (math.floor(stats.startuptime * 100 + 0.5) / 100)
          return {
            " ",
            "⚡ Neovim loaded " .. stats.loaded .. "/" .. stats.count .. " plugins in " .. ms .. "ms",
          }
        end,
      },
    }

    for _, button in ipairs(opts.config.center) do
      button.desc = button.desc .. string.rep(" ", 38 - #button.desc)
      button.key_format = "  %s"
    end

    return opts
  end,
}
