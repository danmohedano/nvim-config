return {
    {
        "folke/tokyonight.nvim",
        lazy = false, -- loads during startup before everything else
        priority = 1000,
        config = function ()
            -- load the colorscheme here
            vim.cmd([[colorscheme tokyonight]])
        end,
    }
}
