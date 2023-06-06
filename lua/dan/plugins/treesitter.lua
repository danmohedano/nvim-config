return {
    "nvim-treesitter/nvim-treesitter",
    build = function()
        require("nvim-treesitter.install").update({ with_sync = true })
    end,
    config = function()
        require("nvim-treesitter.configs").setup({
            ensure_installed = { "c", "lua", "vim", "vimdoc", "julia", "rust", "python", "markdown", "markdown_inline", "nix"},
            sync_install = false,
            auto_install = true,
            ignore_install = { "" },
            highlight = {
                enable = true,
                disable = { "" },
                additional_vim_regex_highlighting = false,
            },
            indent = { enable = true, disable = { "yaml" } },
            rainbow = {
                enable = true,
                extended_mode = true,
                max_file_lines = nil,
            }
        })
    end,
}
