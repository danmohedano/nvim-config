local utils = require("dan.utils")
local is_available = utils.is_available

local maps = { i = {}, n = {}, v = {}, t = {}, x = {} }

-- MOVEMENT BINDINGS --
maps.n["j"] = { "v:count ? 'j' : 'gj'", expr = true, desc = "Move cursor down" }
maps.n["k"] = { "v:count ? 'k' : 'gk'", expr = true, desc = "Move cursor up" }
maps.v["j"] = maps.n.j
maps.v["k"] = maps.n.k
maps.n["J"] = { "mzJ`z", desc = "Append following line to current" }
maps.n["n"] = { "nzzzv", desc = "Keep cursor in middle when searching" }
maps.n["N"] = { "Nzzzv", desc = "Keep cursor in middle when searching" }

-- INSERT BINDINGS --
maps.i["kj"] = { "<Esc>" }

-- LEADER BINDINGS --
maps.n["<leader>pv"] = { "<cmd>Ex<cr>", desc = "Project view with netrw" }
maps.n["<leader>w"] = { "<cmd>w<cr>", desc = "Save" }
maps.n["<leader>q"] = { "<cmd>confirm q<cr>", desc = "Quit" }
maps.n["<leader>n"] = { "<cmd>enew<cr>", desc = "New File" }
maps.n["<leader>x"] = { "<cmd>!chmod +x %<CR>", desc = "Create executable" }
maps.n["<leader>s"] = { [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]], desc = "Substitute" }

-- SPLITTING BINDINGS --
maps.n["|"] = { "<cmd>vsplit<cr>", desc = "Vertical Split" }
maps.n["\\"] = { "<cmd>split<cr>", desc = "Horizontal Split" }

-- RESIZING BINDINGS --
maps.n["<C-Plus>"] = { "<cmd>resize -1<CR>", desc = "Increase font size" }
maps.n["<C-Minus>"] = { "<cmd>resize +1<CR>", desc = "Decrease font size" }
maps.n["<C-Left>"] = { "<cmd>vertical resize -5<CR>", desc = "Decrease horizontal size" }
maps.n["<C-Right>"] = { "<cmd>vertical resize +5<CR>", desc = "Increase horizontal size" }
maps.n["<C-Up>"] = { "<cmd>horizontal resize +5<CR>", desc = "Increase vertical size" }
maps.n["<C-Down>"] = { "<cmd>horizontal resize -5<CR>", desc = "Decrease vertical size" }

-- SELECTION BINDINGS --
maps.v["J"] = { "<cmd>m '>+1<CR>gv=gv", desc = "Shift line down in visual mode" }
maps.v["K"] = { "<cmd>m '<-2<CR>gv=gv", desc = "Shift line up in visual mode" }
-- Stay in indent mode
maps.v["<S-Tab>"] = { "<gv", desc = "Unindent line" }
maps.v["<Tab>"] = { ">gv", desc = "Indent line" }
maps.v["<"] = { "<gv", desc = "Unindent line" }
maps.v[">"] = { ">gv", desc = "Indent line" }

-- COPY/PASTE BINDINGS --
maps.x["p"] = { "\"_dP" } -- Hold onto yanked content when pasting in visual mode
maps.n["<leader>d"] = { "\"_d", desc = "Delete content without saving deleted content to pastebin" }
maps.v["<leader>d"] = { "\"_d", desc = "Delete content without saving deleted content to pastebin" }

--!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!--
--          PLUGIN BINDINGS         --
--!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!--

-- TELESCOPE --
if is_available "telescope.nvim" then
    local builtin = require("telescope.builtin")

    maps.n["<leader>ff"] = { builtin.find_files, desc = "Telescope - Find files" }
    maps.n["<leader>fg"] = { builtin.git_files, desc = "Telescope - Find Git Files" }
    maps.n["<leader>fs"] = {
        function()
            builtin.grep_string({ search = vim.fn.input("Grep > ") })
        end,
        desc = "Telescope - Find String in Files"
    }
    maps.n["<leader>fh"] = { builtin.help_tags, desc = "Telescope - Help tags" }
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

-- LSP BINDINGS --
maps.n["K"] = { vim.lsp.buf.hover, desc = "LSP - Hover" }
maps.n["gd"] = { vim.lsp.buf.definition, desc = "LSP - Definition" }
maps.n["gD"] = { vim.lsp.buf.declaration, desc = "LSP - Declaration" }
maps.n["gi"] = { vim.lsp.buf.implementation, desc = "LSP - Implementation" }
maps.n["go"] = { vim.lsp.buf.type_definition, desc = "LSP - Type Definition" }
maps.n["gr"] = { vim.lsp.buf.references, desc = "LSP - References" }
maps.n["gs"] = { vim.lsp.buf.signature_help, desc = "LSP - Signature Help" }
maps.n["<F2>"] = { vim.lsp.buf.rename, desc = "LSP - Rename" }
maps.n["<F3>"] = { function() vim.lsp.buf.format({ async = true }) end, desc = "LSP - Format" }
maps.v["<F3>"] = maps.n["<F3>"]
maps.n["<F4>"] = { vim.lsp.buf.code_action, desc = "LSP - Code Action" }

maps.n["gl"] = { vim.diagnostic.open_float, desc = "LSP - Open float" }

-- TROUBLE --
if is_available "trouble.nvim" then
    local trouble = require("trouble")
    maps.n["<leader>xd"] = { function() trouble.toggle("document_diagnostics") end, desc = "Trouble Doc Diagnostics" }
    maps.n["<leader>xq"] = { function() trouble.toggle("quickfix") end, desc = "Trouble Quickfix" }
end

utils.set_mappings(maps)
