local M = {
    "nvim-treesitter/nvim-treesitter",
    build = "TSUpdate",
    lazy = false,
    dependencies = {
        'nvim-treesitter/nvim-treesitter-context', -- adds context to show in which block of code you are currently at
        'p00f/nvim-ts-rainbow',                    -- rainbow parenthesis
    }
}

function M.config()
    require("nvim-treesitter.configs").setup {
        ensure_installed = {
            "c",
            "lua",
            "vim",
            "vimdoc",
            "julia",
            "rust",
            "python",
            "markdown",
            "markdown_inline",
            "nix"
        }, -- one of "all", "maintained" (parsers with maintainers), or a list of languages
        sync_install = false,
        auto_install = true,
        highlight = {
            enable = true,
            additional_vim_regex_highlighting = false,
        },
        indent = { enable = true },
    }
end

return M
