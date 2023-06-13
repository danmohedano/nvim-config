local utils = require "dan.utils"
local is_available = utils.is_available

local maps = { i = {}, n = {}, v = {}, t = {}, x = {}}

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

-- MOVEMENT BINDINGS --
maps.n["j"] = { "v:count ? 'j' : 'gj'", expr = true, desc = "Move cursor down" }
maps.n["k"] = { "v:count ? 'k' : 'gk'", expr = true, desc = "Move cursor up" }
maps.v["j"] = maps.n.j
maps.v["k"] = maps.n.k
-- maps.n["<C-h>"] = { "<C-w>h", desc = "Focus Left Window" }
-- maps.n["<C-l>"] = { "<C-w>l", desc = "Focus Right Window" }
-- maps.n["<C-j>"] = { "<C-w>j", desc = "Focus Down Window" }
-- maps.n["<C-k>"] = { "<C-w>k", desc = "Focus Up Window" }
-- maps.n["<C-H>"] = { "<C-w>H", desc = "Move to Left Window" }
-- maps.n["<C-L>"] = { "<C-w>L", desc = "Move to Right Window" }
-- maps.n["<C-J>"] = { "<C-w>J", desc = "Move to Down Window" }
-- maps.n["<C-K>"] = { "<C-w>K", desc = "Move to Up Window" }
maps.n["J"] = { "mzJ`z", desc = "Append following line to current" }
maps.n["n"] = { "nzzzv", desc = "Keep cursor in middle when searching" }
maps.n["N"] = { "Nzzzv", desc = "Keep cursor in middle when searching" }

-- INSERT BINDINGS --
maps.i["kj"] = { "<Esc>" }

-- LEADER BINDINGS --
maps.n["<leader>w"] = { "<cmd>w<cr>", desc = "Save" }
maps.n["<leader>q"] = { "<cmd>confirm q<cr>", desc = "Quit" }
maps.n["<leader>n"] = { "<cmd>enew<cr>", desc = "New File" }
maps.n["<leader>x"] = { "<cmd>!chmod +x %<CR>", desc = "Create executable" }
maps.n["<leader>s"] = { [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]], desc = "Substitute" }

-- SPLITTING BINDINGS --
maps.n["|"] = { "<cmd>vsplit<cr>", desc = "Vertical Split" }
maps.n["\\"] = { "<cmd>split<cr>", desc = "Horizontal Split" }

-- RESIZING BINDINGS --
maps.n["<C-Plus>"] = { "<cmd>resize -1<CR>"}
maps.n["<C-Minus>"] = { "<cmd>resize +1<CR>"}
maps.n["<C-Left>"] = { "<cmd>vertical resize -5<CR>"}
maps.n["<C-Right>"] = { "<cmd>vertical resize +5<CR>"}
maps.n["<C-Up>"] = { "<cmd>horizontal resize +5<CR>"}
maps.n["<C-Down>"] = { "<cmd>horizontal resize -5<CR>"}

-- SELECTION BINDINGS --
maps.v["J"] = { "<cmd>m '>+1<CR>gv=gv" }
maps.v["K"] = { "<cmd>m '<-2<CR>gv=gv" }
-- Stay in indent mode
maps.v["<S-Tab>"] = { "<gv", desc = "unindent line" }
maps.v["<Tab>"] = { ">gv", desc = "indent line" }
maps.v["<"] = { "<gv", desc = "unindent line" }
maps.v[">"] = { ">gv", desc = "indent line" }

-- COPY/PASTE BINDINGS --
maps.x["p"] =  { "\"_dP" } -- Hold onto yanked content when pasting in visual mode
maps.n["<leader>d"] = { "\"_d" }
maps.v["<leader>d"] = { "\"_d" }

--=================--
-- PLUGIN BINDINGS --
--=================--
-- NVIMTREE --
if is_available "nvim-tree.lua" then
    maps.n["<leader>e"] = { "<cmd>NvimTreeToggle<cr>", desc = "Toggle Explorer" }
    maps.n["<leader>o"] = { "<cmd>NvimTreeFocus<cr>", desc = "Toggle Explorer Focus" }
end

-- COMMENT --
if is_available "Comment.nvim" then
    maps.n["<leader>/"] = {
        function() require("Comment.api").toggle.linewise.count(vim.v.count > 0 and vim.v.count or 1) end,
        desc = "Comment line",
    }
    maps.v["<leader>/"] =
        { "<esc><cmd>lua require('Comment.api').toggle.linewise(vim.fn.visualmode())<cr>", desc = "Toggle comment line" }
end

-- TELESCOPE --
if is_available "telescope.nvim" then
    local builtin = require("telescope.builtin")

    maps.n["<leader>ff"] = { builtin.find_files, desc = "Telescope - Find files" }
    maps.n["<leader>fg"] = { builtin.git_files, desc = "Telescope - Find Git Files" }
    maps.n["<leader>fs"] = { function()
        builtin.grep_string({ search = vim.fn.input("Grep > ") })
    end, desc = "Telescope - Find String in Files" }
end

-- HARPOON --
if is_available "harpoon" then
    local mark = require("harpoon.mark")
    local ui = require("harpoon.ui")

    maps.n["<leader>ha"] = { mark.add_file, desc = "Harpoon - Add Mark" }
    maps.n["<leader>he"] = { ui.toggle_quick_menu, desc = "Harpoon - Quick Menu Toggle" }
    maps.n["<leader>h1"] = { function() ui.nav_file(1) end, desc = "Harpoon - Navigate to 1" }
    maps.n["<leader>h2"] = { function() ui.nav_file(2) end, desc = "Harpoon - Navigate to 2" }
    maps.n["<leader>h3"] = { function() ui.nav_file(3) end, desc = "Harpoon - Navigate to 3" }
    maps.n["<leader>h4"] = { function() ui.nav_file(4) end, desc = "Harpoon - Navigate to 4" }
end

-- UNDOTREE --
if is_available "undotree" then
    maps.n["<leader>u"] = { vim.cmd.UndotreeToggle, desc = "Undotree - Toggle" }
end

-- VIMFUGITIVE --
if is_available "vim-fugitive" then
    maps.n["<leader>gs"] = { vim.cmd.Git, desc = "VimFugitive - Git" }
end


-- MASON PACKAGE MANAGER --
if is_available "mason.nvim" then
    maps.n["<leader>pm"] = { "<cmd>Mason<cr>", desc = "Mason Installer" }
    maps.n["<leader>pM"] = { "<cmd>MasonUpdateAll<cr>", desc = "Mason Update" }
end

utils.set_mappings(maps)
