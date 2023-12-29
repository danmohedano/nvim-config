local M = {
    "folke/trouble.nvim",
}

function M.config()
    local trouble = require("trouble")
    trouble.setup({
        icons = false,
    })
end

return M
