-- Choose the scheme to use
local scheme_name = "catppuccin"

-- Configurations
local schemes = {
    tokyonight = {
        url = "folke/tokyonight.nvim",
        name = "tokyonight",
        config = {},
    },
    catppuccin = {
        url = "catppuccin/nvim",
        name = "catppuccin",
        config = {
            flavour = "frappe"
        },
    }
}

local chosen_scheme = schemes[scheme_name]

return {
    {
        chosen_scheme["url"],
        name = chosen_scheme["name"],
        lazy = false, -- loads during startup before everything else
        priority = 1000,
        config = function ()
            -- configure colorscheme if necessary
            require(chosen_scheme["name"]).setup(chosen_scheme["config"])
            -- load the colorscheme here
            command = "colorscheme " .. chosen_scheme["name"]
            vim.cmd(command)
        end,
    }
}
