local M = {}


--- Table based API for setting keybindings
-- @param map_table A nested table where the first key is the vim mode, the second key is the key to map, and the value is the function to set the mapping to
-- @param base A base set of options to set on every keybinding
function M.set_mappings(map_table)
    for mode, maps in pairs(map_table) do
        -- iterate over each keybinding set in the current mode
        for keymap, options in pairs(maps) do
            -- build the options for the command
            if options then
                local cmd = options
                local keymap_opts = {}
                if type(options) == "table" then
                    cmd = options[1]
                    keymap_opts = vim.tbl_deep_extend("force", keymap_opts, options)
                    keymap_opts[1] = nil
                end
                if not cmd or keymap_opts.name then
                    -- TODO: whick key configuration
                else
                    vim.keymap.set(mode, keymap, cmd, keymap_opts)
                end
            end
        end
    end
end


--- Check if a plugin is defined in lazy. Useful with lazy loading when a plugin is not necessarily loaded yet
-- @param plugin the plugin string to search for
-- @return boolean value if the plugin is available
function M.is_available(plugin)
    local lazy_config_avail, lazy_config = pcall(require, "lazy.core.config")
    return lazy_config_avail and lazy_config.plugins[plugin] ~= nil
end

return M
