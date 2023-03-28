local utils = require "dan.utils"
local is_available = utils.is_available
local ui = require "dan.utils.ui"

local maps = { i = {}, n = {}, v = {}, t = {} }

local sections = {
    f = { name = "󰍉 Find" },
    p = { name = "󰏖 Packages" },
    l = { name = " LSP" },
    u = { name = " UI" },
    b = { name = "󰓩 Buffers" },
    d = { name = " Debugger" },
    g = { name = " Git" },
    S = { name = "󱂬 Session" },
    t = { name = " Terminal" },
}

if not vim.g.icons_enabled then vim.tbl_map(function(opts) opts.name = opts.name:gsub("^.* ", "") end, sections) end

-- NORMAL --
-- Standard Operations
maps.n["j"] = { "v:count ? 'j' : 'gj'", expr = true, desc = "Move cursor down" }
maps.n["k"] = { "v:count ? 'k' : 'gk'", expr = true, desc = "Move cursor up" }
maps.v["j"] = maps.n.j
maps.v["k"] = maps.n.k
maps.n["<leader>w"] = { "<cmd>w<cr>", desc = "Save" }
maps.n["<leader>q"] = { "<cmd>confirm q<cr>", desc = "Quit" }
maps.n["<leader>n"] = { "<cmd>enew<cr>", desc = "New File" }
maps.n["gx"] = { utils.system_open, desc = "Open the file under cursor with system app" }
maps.n["<C-s>"] = { "<cmd>w!<cr>", desc = "Force write" }
maps.n["<C-q>"] = { "<cmd>q!<cr>", desc = "Force quit" }
maps.n["|"] = { "<cmd>vsplit<cr>", desc = "Vertical Split" }
maps.n["\\"] = { "<cmd>split<cr>", desc = "Horizontal Split" }