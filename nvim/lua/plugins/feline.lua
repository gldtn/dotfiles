return {
	"freddiehaddad/feline.nvim",
	dependencies = { "kyazdani42/nvim-web-devicons" },
	enabled = true,
	config = function()
		require("config.feline") -- the location of this GIST.
	end,
}
