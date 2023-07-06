return {
    -- Appearance
    'rebelot/kanagawa.nvim',
    'nvim-tree/nvim-web-devicons',

    -- Utilities
    'nvim-tree/nvim-tree.lua',
    'ThePrimeagen/harpoon',
    {
        'mbbill/undotree',
        lazy = false,
    },
    {
        'tpope/vim-fugitive',
        lazy = false,
    },

    -- Telescope
    {
        'nvim-telescope/telescope.nvim',
        version = '0.1.1',
        dependencies = {
            'nvim-lua/plenary.nvim',
            { 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' },
            'BurntSushi/ripgrep',
        },
        lazy = true,
    },
    -- Treesitter
    {
        'nvim-treesitter/nvim-treesitter',
        build = ':TSUpdate',
        dependencies = {
            'nvim-treesitter/nvim-treesitter-context', -- adds context to show in which block of code you are currently at
            'p00f/nvim-ts-rainbow', -- rainbow parenthesis
        },
        lazy = true,
    },

    -- LSP
    {
        'VonHeikemen/lsp-zero.nvim',
        branch = 'v2.x',
        dependencies = {
            -- LSP Support
            {'neovim/nvim-lspconfig'},             -- Required
            {                                      -- Optional
                'williamboman/mason.nvim',
                build = function()
                    pcall(vim.cmd, 'MasonUpdate')
                end,
            },
            {'williamboman/mason-lspconfig.nvim'}, -- Optional

            -- Autocompletion
            {'hrsh7th/nvim-cmp'},     -- Required
            {'hrsh7th/cmp-buffer'},     -- Optional
            {'hrsh7th/cmp-path'},     -- Optional
            {'hrsh7th/cmp-nvim-lsp'}, -- Required
            {'hrsh7th/cmp-nvim-lua'},     -- Optional
            {'kdheepak/cmp-latex-symbols'},

            -- Snippets
            {'L3MON4D3/LuaSnip'},     -- Required
            {'rafamadriz/friendly-snippets'}, -- Optional
            -- Linting and formatting additions
            -- {'jose-elias-alvarez/null-ls.nvim'}, -- Optional
            -- {'jay-babu/mason-null-ls.nvim'}, -- Optional
        }
    },

    -- Editing
    'numToStr/Comment.nvim',
    'windwp/nvim-autopairs',
    'folke/trouble.nvim',
}
