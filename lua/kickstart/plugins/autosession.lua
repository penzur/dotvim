return {
	"rmagatti/auto-session",
	lazy = false,

	keys = {
		{ "<M-s>", "<cmd>SessionSearch<CR>", desc = "Session search" },
	},

	opts = {
		suppressed_dirs = { "~/", "~/projects", "~/downloads", "/" },
	},
}
