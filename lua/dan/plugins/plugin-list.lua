return {
    -- Appearance
    'rebelot/kanagawa.nvim',
    'nvim-tree/nvim-web-devicons',

    -- Utilities
    'nvim-tree/nvim-tree.lua',
    {
        'nvim-treesitter/nvim-treesitter',
        build = ':TSUpdate',
        dependencies = {
            'nvim-treesitter/nvim-treesitter-context', -- adds context to show in which block of code you are currently at
            'p00f/nvim-ts-rainbow', -- rainbow parenthesis
            'windwp/nvim-ts-autotag', -- autoclose html tags
            'RRethy/nvim-treesitter-endwise', -- automatically add end when necessary
        },
        lazy = true,
    },

    -- Editing
    'windwp/nvim-autopairs',
    'numToStr/Comment.nvim',
}
