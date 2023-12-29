local M = {
    "williamboman/mason.nvim",
    dependencies = {
        "williamboman/mason-lspconfig.nvim",
        "nvim-lua/plenary.nvim",
    },
}

local servers = {
    "lua_ls",
    "rust_analyzer",
    "clangd",
    "pyright",
    "julials",
    "fortls",
}

function M.config()
    local lsp = require("lsp-zero")
    lsp.preset("recommended")

    lsp.set_preferences({
        suggest_lsp_servers = false,
        sign_icons = {
            error = "E",
            warn = "W",
            hint = "H",
            info = "I",
        }
    })

    lsp.setup_nvim_cmp({
        preselect = "none",
        completion = {
            completeopt = "menu,menuone,noinsert,noselect",
        },
    })

    lsp.setup()
    require("mason").setup()

    require("mason-lspconfig").setup_handlers {
        function (server_name)
            require("lspconfig") [server_name].setup {}
        end
    }

    require("mason-lspconfig").setup {
        ensure_installed = servers,
        automatic_installation = true,
    }

    vim.diagnostic.config({
        virtual_text = true,
    })

    local cmp = require("cmp")
    cmp.setup({
        preselect = cmp.PreselectMode.None,
        mapping = {
            ["<CR>"] = cmp.mapping.confirm({ select = false }),
            ["<C-N>"] = cmp.mapping.select_next_item(),
            ["<C-P>"] = cmp.mapping.select_prev_item(),
            ["<TAB>"] = cmp.mapping.select_next_item(),
            ["<S-TAB>"] = cmp.mapping.select_prev_item(),
            ["<C-Y>"] = cmp.mapping.confirm({ select = true }),
            ["<C-Space>"] = cmp.mapping.complete(),
        },
    })
end

return M
