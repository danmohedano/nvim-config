-- LSP ZERO --
local status_ok, lsp = pcall(require, "lsp-zero")
if not status_ok then
    return
end

lsp.preset("minimal")

-- LSP Keybinds
lsp.on_attach(function(client, bufnr)
    local opts = { buffer = bufnr, remap = false }

    vim.keymap.set("n", "K", function() vim.lsp.buf.hover() end, opts)
    vim.keymap.set("n", "gd", function() vim.lsp.buf.definition() end, opts)
    vim.keymap.set("n", "gD", function() vim.lsp.buf.declaration() end, opts)
    vim.keymap.set("n", "gi", function() vim.lsp.buf.implementation() end, opts)
    vim.keymap.set("n", "go", function() vim.lsp.buf.type_definition() end, opts)
    vim.keymap.set("n", "gr", function() vim.lsp.buf.references() end, opts)
    vim.keymap.set("n", "gs", function() vim.lsp.buf.signature_help() end, opts)
    vim.keymap.set("n", "<F2>", function() vim.lsp.buf.rename() end, opts)
    vim.keymap.set({ "n", "x" }, "<F3>", function() vim.lsp.buf.format({ async = true }) end, opts)
    vim.keymap.set("n", "<F4>", function() vim.lsp.buf.code_action() end, opts)

    vim.keymap.set("n", "gl", function() vim.diagnostic.open_float() end, opts)
    vim.keymap.set("n", "[d", function() vim.diagnostic.goto_next() end, opts)
    vim.keymap.set("n", "]d", function() vim.diagnostic.goto_prev() end, opts)
end)


lsp.setup()

-- mason-lspconfig
require("mason").setup()
require("mason-lspconfig").setup({
    ensure_installed = {
        "clangd", -- C/C++ - LSP
        "cmake",         -- CMake -- LSP
        "rust_analyzer", -- Rust - LSP
        "pyright",       -- Python - LSP
        "julials", -- Julia - LSP
        "fortls",  -- Fortran - LSP
        "lua_ls",  -- Lua - LSP
    },
    automatic_installation = true,
})

-- cmp configuration
local cmp = require('cmp')

cmp.setup({
    mapping = {
        ['<C-N>'] = cmp.mapping.select_next_item(),
        ['<C-P>'] = cmp.mapping.select_prev_item(),
        ['<TAB>'] = cmp.mapping.select_next_item(),
        ['<S-TAB>'] = cmp.mapping.select_prev_item(),
        ['<C-Y>'] = cmp.mapping.confirm({ select = true }),
        ['<C-Space>'] = cmp.mapping.complete(),
    }
})

-- Config VIM diagnostic messages
vim.diagnostic.config({
    virtual_text = true
})


-- Julials
require'lspconfig'.julials.setup{
    on_new_config = function(new_config, _)
        local julia = vim.fn.expand("~/.julia/environments/nvim-lspconfig/bin/julia")
        if require'lspconfig'.util.path.is_file(julia) then
	    vim.notify("Hello!")
            new_config.cmd[1] = julia
        end
    end
}

-- null-ls --
-- local null_status, null_ls = pcall(require, "null-ls")
-- if not null_status then
--     return
-- end
--
-- local formatting = null_ls.builtins.formatting
-- local diagnostics = null_ls.builtins.diagnostics
--
-- null_ls.setup({
--     debug = false,
--     border = 'rounded',
--     log_level = 'error',
--     diagnostics_format = '#{c} #{m} (#{s})',
--     sources = {
--         formatting.rustfmt,                                   -- Rust
--         formatting.clang_format,                              -- C/C++
--         diagnostics.cpplint,                                  -- C/C++
--         diagnostics.cmake_lint,                               -- CMake
--         formatting.black.with({ extra_args = { '--fast' } }), -- Python
--         diagnostics.flake8,                                   -- Python
--         diagnostics.pydocstyle,                               -- Python
--         -- diagnostics.selene,                                   -- Lua
--         formatting.stylua,                                    -- Lua
--         formatting.prettier,                                  -- JS, CSS, HTML, JSON, YAML, MD
--     },
-- })
--
-- -- mason-null-ls
-- require("mason-null-ls").setup({
--     ensure_installed = nil,
--     automatic_installation = true, -- Automatically install configured sources
-- })
