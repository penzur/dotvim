return {
	"rmagatti/auto-session",
	lazy = false,

	keys = {
		{ "<leader>sp", "<cmd>SessionSearch<CR>", desc = "Session search" },
	},

	opts = {
		suppressed_dirs = { "~/", "~/projects", "~/downloads", "/" },
	},
}
