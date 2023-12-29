local M = {
    "EdenEast/nightfox.nvim",
    lazy = false,
    priority = 1000,
}

function M.config()
    vim.cmd("colorscheme carbonfox")
end

return M
