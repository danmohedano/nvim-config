require("dan.options")
require("dan.utils.lazy-spec")

-- Colorscheme
ADD_PLUGIN("dan.plugins.colorscheme")
-- Utilities
ADD_PLUGIN("dan.plugins.treesitter")
ADD_PLUGIN("dan.plugins.telescope")
ADD_PLUGIN("dan.plugins.fugitive")
ADD_PLUGIN("dan.plugins.harpoon")
ADD_PLUGIN("dan.plugins.undotree")
ADD_PLUGIN("dan.plugins.trouble")
ADD_PLUGIN("dan.plugins.lualine")
-- LSP
ADD_PLUGIN("dan.plugins.lsp-zero")
ADD_PLUGIN("dan.plugins.mason")

require("dan.plugins.lazy")
require("dan.mappings")
