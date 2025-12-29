---@type LazyPluginSpec
vim.api.nvim_create_autocmd("FileType", {
	pattern = "cmp_docs",
	callback = function()
		vim.treesitter.start(0, "markdown")
	end,
})

return {
	"yetone/avante.nvim",
	event = "VeryLazy",
	version = false, -- Version pinning is not recommended

	-- Plugin configuration
	opts = {
		provider = "copilot", -- Default AI provider

		-- AI Provider configurations
		providers = {
			-- OpenAI Configuration
			openai = {
				endpoint = "https://api.openai.com/v1",
				model = "gpt-4o",
				extra_request_body = {
					timeout = 30000, -- Timeout in milliseconds
					temperature = 0.75, -- Response creativity (0-1)
					max_completion_tokens = 8192, -- Maximum response length
				},
			},

			-- GitHub Copilot Configuration
			copilot = {
				endpoint = "https://api.githubcopilot.com",
				model = "claude-haiku-4.5",
				proxy = nil, -- Optional proxy configuration
				allow_insecure = false, -- Security setting
				timeout = 30000, -- Request timeout
				extra_request_body = {
					temperature = 0,
					max_tokens = 8192,
				},
			},

			-- Ollama Configuration
			ollama = {
				endpoint = "http://localhost:11434", -- Local Ollama endpoint
				model = "qwen2.5-coder:7b",
			},
			ollamalocal = {
				__inherited_from = "openai",
				api_key_name = "",
				endpoint = "http://localhost:11434/v1",
				model = "qwen2.5-coder:7b",
			},
		},
	},

	-- Build configuration
	build = "make", -- Unix/Linux build command
	-- Uncomment for Windows build:
	-- build = [[powershell -ExecutionPolicy Bypass -File Build.ps1 -BuildFromSource false]],

	-- Plugin dependencies
	dependencies = {
		-- Core dependencies
		"nvim-treesitter/nvim-treesitter",
		"nvim-lua/plenary.nvim",
		"MunifTanjim/nui.nvim",

		-- File selection and UI dependencies
		"echasnovski/mini.pick", -- Mini.pick file selector
		"nvim-telescope/telescope.nvim", -- Telescope file selector
		"ibhagwan/fzf-lua", -- FZF file selector
		"stevearc/dressing.nvim", -- Input UI enhancement
		"folke/snacks.nvim", -- Notification UI
		"nvim-tree/nvim-web-devicons", -- File icons
		"hrsh7th/nvim-cmp", -- Autocompletion
		"zbirenbaum/copilot.lua", -- Copilot integration

		-- Image handling
		{
			"HakonHarnes/img-clip.nvim",
			event = "VeryLazy",
			opts = {
				default = {
					embed_image_as_base64 = false,
					prompt_for_file_name = false,
					drag_and_drop = { insert_mode = true },
					use_absolute_path = true, -- Required for Windows
				},
			},
		},

		-- Markdown rendering
		-- {
		-- 	"MeanderingProgrammer/render-markdown.nvim",
		-- 	opts = { file_types = { "markdown", "Avante" } },
		-- 	ft = { "markdown", "Avante" },
		-- },
	},
}
