return {
    "yetone/avante.nvim",
    event = "VeryLazy",
    lazy = false,

    version = "*", -- Set this to "*" to always pull the latest release version, or set it to false to update to the latest code changes.

    opts = {
        -- add any opts here
        -- for example
        provider = "copilot",
        openai = {
            endpoint = "https://api.openai.com/v1",
            model = "o1-preview", -- your desired model (or use gpt-4o, etc.)
            timeout = 30000,      -- timeout in milliseconds
            temperature = 0,      -- adjust if needed
            max_tokens = 4096,
        },
        claude = {
            endpoint = "https://api.anthropic.com",
            model = "claude-3-5-sonnet-20241022",
            timeout = 30000, -- Timeout in milliseconds

            temperature = 0,
            max_tokens = 4096,
            disable_tools = true, -- disable tools!
        },
        gemini = {
            endpoint = "https://generativelanguage.googleapis.com/v1beta/models",
            model = "gemini-2.5-pro-exp-03-25",
            -- timeout = 30000, -- Timeout in milliseconds
            temperature = 0,
            max_tokens = 4096,
        },
        copilot = {
            endpoint = "https://api.githubcopilot.com",
            model = "claude-3.5-sonnet",
            proxy = nil,            -- [protocol://]host[:port] Use this proxy
            allow_insecure = false, -- Allow insecure server connections
            timeout = 30000,        -- Timeout in milliseconds
            temperature = 0,
            max_tokens = 4096,
        },
        ollama = {
            endpoint = "http://windows:31337", -- Note that there is no /v1 at the end.
            model = "deepseek-r1:latest",
        },
    },
    -- if you want to build from source then do `make BUILD_FROM_SOURCE=true`

    build = "make",
    -- build = "powershell -ExecutionPolicy Bypass -File Build.ps1 -BuildFromSource false" -- for windows
    dependencies = {

        "stevearc/dressing.nvim",
        "nvim-lua/plenary.nvim",
        "MunifTanjim/nui.nvim",
        --- The below dependencies are optional,
        "echasnovski/mini.pick",         -- for file_selector provider mini.pick
        "nvim-telescope/telescope.nvim", -- for file_selector provider telescope
        "hrsh7th/nvim-cmp",              -- autocompletion for avante commands and mentions

        "ibhagwan/fzf-lua",              -- for file_selector provider fzf
        "nvim-tree/nvim-web-devicons",   -- or echasnovski/mini.icons
        "zbirenbaum/copilot.lua",        -- for providers='copilot'

        {
            -- Make sure to set this up properly if you have lazy=true
            'MeanderingProgrammer/render-markdown.nvim',
            opts = {
                file_types = { "markdown", "Avante" },
            },
            ft = { "markdown", "Avante" },
        },
    },
}
