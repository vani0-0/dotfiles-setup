---@class Plugin
---@field repo string
---@field build? string
---@field version? string|vim.VersionRange
---@field dependencies? Plugin[]

---@type Plugin[]
return {
    {
        repo = 'nvim-flutter/flutter-tools.nvim',
    },

    -- Treesitter 
    {
        repo = 'nvim-treesitter/nvim-treesitter',
        version = 'main',
    },
    {
        repo = "lewis6991/gitsigns.nvim",
    },
    {
        repo = "folke/todo-comments.nvim",
    },
    -- Telescope
    {
        repo = 'nvim-telescope/telescope.nvim',
        dependencies = {
            {
                repo = 'nvim-lua/plenary.nvim',
            },
            {
                repo = 'nvim-telescope/telescope-ui-select.nvim',
            },
            {
                repo = 'nvim-telescope/telescope-fzf-native.nvim',
                build = 'make',
            },
        },
    },

    -- LSP
    {
        repo = 'neovim/nvim-lspconfig',
        dependencies = {
            {
                repo = 'mason-org/mason.nvim',
            },
            {
                repo = 'mason-org/mason-lspconfig.nvim',
            },
            {
                repo = 'WhoIsSethDaniel/mason-tool-installer.nvim',
            },
            {
                repo = 'j-hui/fidget.nvim',
            },
            {
                repo = 'stevearc/conform.nvim',
            },
        },
    },

    -- Themes "Catppuccin"
    {
        repo = 'catppuccin/nvim',
    },
    -- Blink
    {
        repo = 'saghen/blink.cmp',
        version = vim.version.range '1.*',
    },
    -- Luasnip
    {
        repo = 'L3MON4D3/LuaSnip',
        version = vim.version.range '2.*',
    },

    {
        repo = 'folke/which-key.nvim',
    },

    -- Mini nvim
    {
        repo = 'nvim-mini/mini.nvim',
        version = 'stable',
        dependencies = {
            {
                repo = 'nvim-mini/mini.pairs',
            },
        },
    },
}
