-- List of active plugins being used
local plugins = {
    -- Plugin Manager
    'lazy',

    -- Utilities
    'harpoon',
    'nvim-tree',
    'telescope',
    'treesitter-context',
    'treesitter',

    -- LSP
    'lsp',

    -- Editing
    'autopairs',
    'comment',

    -- Appearance
    'kanagawa',
}

local errors = {}
local error_plugins = {}

for _, plugin in pairs(plugins) do
    local status_ok, error_msg = pcall(require, 'dan.plugins.' .. plugin)
    if not status_ok then
        table.insert(errors, error_msg)
        table.insert(error_plugins, plugin)
    end
end

for i, err_msg in pairs(errors) do
    vim.notify(err_msg, vim.log.levels.ERROR, {
        title = 'Error loading: ' ..  error_plugins[i],
    })
end
