return {
	"rmagatti/auto-session",
	lazy = false,

	keys = {
		{ "<C-e>", "<cmd>SessionSearch<CR>", desc = "Session search" },
	},

	opts = {
		suppressed_dirs = { "~/", "~/projects", "~/downloads", "/" },
	},
}
