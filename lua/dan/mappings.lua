local utils = require "dan.utils"
local is_available = utils.is_available

local KEYBOARD_LAYOUT = "es"

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
if KEYBOARD_LAYOUT == "es" then
    -- Update movement keymaps for spanish keyboard layout
    -- Translates hjkl to jklñ
    -- Normal mode movement
    maps.n["k"] = { "v:count ? 'j' : 'gj'", expr = true, desc = "Move cursor down" }
    maps.n["l"] = { "v:count ? 'k' : 'gk'", expr = true, desc = "Move cursor up" }
    maps.n["j"] = { "h" }
    maps.n["ñ"] = { "l" }

    -- Visual mode movement
    maps.v["k"] = maps.n.k
    maps.v["l"] = maps.n.l
    maps.v["j"] = maps.n.j
    maps.v["ñ"] = maps.n["ñ"]

    -- Delete movement
    maps.n["dj"] = { "dh" }
    maps.n["dk"] = { "dj" }
    maps.n["dl"] = { "dk" }
    maps.n["dñ"] = { "dl" }

    -- Window navigation
    maps.n["<C-j>"] = { "<C-w>h" , desc = "Focus Left Window"}
    maps.n["<C-k>"] = { "<C-w>j", desc = "Focus Down Window"}
    maps.n["<C-l>"] = { "<C-w>k", desc = "Focus Up Window" }
    maps.n["<C-Q>"] = { "<C-w>l", desc = "Focus Right Window" }
else
    -- Regular US keyboard layout
    maps.n["k"] = { "v:count ? 'j' : 'gj'", expr = true, desc = "Move cursor down" }
    maps.n["l"] = { "v:count ? 'k' : 'gk'", expr = true, desc = "Move cursor up" }
    maps.v["k"] = maps.n.k
    maps.v["l"] = maps.n.l
end

maps.n["<leader>w"] = { "<cmd>w<cr>", desc = "Save" }
maps.n["<leader>q"] = { "<cmd>confirm q<cr>", desc = "Quit" }
maps.n["<leader>n"] = { "<cmd>enew<cr>", desc = "New File" }
--maps.n["gx"] = { utils.system_open, desc = "Open the file under cursor with system app" }
maps.n["<C-s>"] = { "<cmd>w!<cr>", desc = "Force write" }
--maps.n["<C-q>"] = { "<cmd>q!<cr>", desc = "Force quit" }
maps.n["|"] = { "<cmd>vsplit<cr>", desc = "Vertical Split" }
maps.n["\\"] = { "<cmd>split<cr>", desc = "Horizontal Split" }

if vim.fn.has("unix") then
    -- Create executable
    maps.n["<leader>x"] = { "<cmd>!chmod +x %<CR>", desc = "Turn file into executable" }
end

-- Resizing
maps.n["<C-Plus>"] = { "<cmd>resize -2<CR>"}
maps.n["<C-Minus>"] = { "<cmd>resize +2<CR>"}
maps.n["<C-Left>"] = { "<cmd>vertical -2<CR>"}
maps.n["<C-Right>"] = { "<cmd>vertical -2<CR>"}

-- Move text
maps.v["<A-k>"] = { "<cmd>m .+1<CR>gv" }
maps.v["<A-l>"] = { "<cmd>m .-2<CR>gv" }

-- Hold onto yanked content when pasting in visual mode
maps.v["p"] =  { '"_dP' }

-- Plugin Manager
maps.n["<leader>p"] = sections.p
maps.n["<leader>pi"] = { function() require("lazy").install() end, desc = "Plugins Install" }
maps.n["<leader>ps"] = { function() require("lazy").home() end, desc = "Plugins Status" }
maps.n["<leader>pS"] = { function() require("lazy").sync() end, desc = "Plugins Sync" }
maps.n["<leader>pu"] = { function() require("lazy").check() end, desc = "Plugins Check Updates" }
maps.n["<leader>pU"] = { function() require("lazy").update() end, desc = "Plugins Update" }

-- Navigate tabs
maps.n["]t"] = { function() vim.cmd.tabnext() end, desc = "Next tab" }
maps.n["[t"] = { function() vim.cmd.tabprevious() end, desc = "Previous tab" }

-- Alpha
if is_available "alpha-nvim" then
    maps.n["<leader>h"] = {
        function()
            local wins = vim.api.nvim_tabpage_list_wins(0)
            if #wins > 1 and vim.api.nvim_get_option_value("filetype", { win = wins[1] }) == "neo-tree" then
                vim.fn.win_gotoid(wins[2]) -- go to non-neo-tree window to toggle alpha
            end
            require("alpha").start(false, require("alpha").default_config)
        end,
        desc = "Home Screen",
    }
end

-- Comment
if is_available "Comment.nvim" then
    maps.n["<leader>/"] = {
        function() require("Comment.api").toggle.linewise.count(vim.v.count > 0 and vim.v.count or 1) end,
        desc = "Comment line",
    }
    maps.v["<leader>/"] =
        { "<esc><cmd>lua require('Comment.api').toggle.linewise(vim.fn.visualmode())<cr>", desc = "Toggle comment line" }
end

-- NeoTree
if is_available "neo-tree.nvim" then
    maps.n["<leader>e"] = { "<cmd>Neotree toggle<cr>", desc = "Toggle Explorer" }
    maps.n["<leader>o"] = {
        function()
            if vim.bo.filetype == "neo-tree" then
                vim.cmd.wincmd "p"
            else
                vim.cmd.Neotree "focus"
            end
        end,
        desc = "Toggle Explorer Focus",
    }
end

-- Package Manager
if is_available "mason.nvim" then
    maps.n["<leader>pm"] = { "<cmd>Mason<cr>", desc = "Mason Installer" }
    maps.n["<leader>pM"] = { "<cmd>MasonUpdateAll<cr>", desc = "Mason Update" }
end

-- Terminal
if is_available "toggleterm.nvim" then
    maps.n["<leader>t"] = sections.t
    if vim.fn.executable "lazygit" == 1 then
        maps.n["<leader>g"] = sections.g
        maps.n["<leader>gg"] = { function() utils.toggle_term_cmd "lazygit" end, desc = "ToggleTerm lazygit" }
        maps.n["<leader>tl"] = { function() utils.toggle_term_cmd "lazygit" end, desc = "ToggleTerm lazygit" }
    end
    if vim.fn.executable "node" == 1 then
        maps.n["<leader>tn"] = { function() utils.toggle_term_cmd "node" end, desc = "ToggleTerm node" }
    end
    if vim.fn.executable "gdu" == 1 then
        maps.n["<leader>tu"] = { function() utils.toggle_term_cmd "gdu" end, desc = "ToggleTerm gdu" }
    end
    if vim.fn.executable "btm" == 1 then
        maps.n["<leader>tt"] = { function() utils.toggle_term_cmd "btm" end, desc = "ToggleTerm btm" }
    end
    local python = vim.fn.executable "python" == 1 and "python" or vim.fn.executable "python3" == 1 and "python3"
    if python then maps.n["<leader>tp"] = { function() utils.toggle_term_cmd(python) end, desc = "ToggleTerm python" } end
    maps.n["<leader>tf"] = { "<cmd>ToggleTerm direction=float<cr>", desc = "ToggleTerm float" }
    maps.n["<leader>th"] = { "<cmd>ToggleTerm size=10 direction=horizontal<cr>", desc = "ToggleTerm horizontal split" }
    maps.n["<leader>tv"] = { "<cmd>ToggleTerm size=80 direction=vertical<cr>", desc = "ToggleTerm vertical split" }
    maps.n["<F7>"] = { "<cmd>ToggleTerm<cr>", desc = "Toggle terminal" }
    maps.t["<F7>"] = maps.n["<F7>"]
    maps.n["<C-'>"] = maps.n["<F7>"]
    maps.t["<C-'>"] = maps.n["<F7>"]
end

-- Improved Code Folding
if is_available "nvim-ufo" then
    maps.n["zR"] = { function() require("ufo").openAllFolds() end, desc = "Open all folds" }
    maps.n["zM"] = { function() require("ufo").closeAllFolds() end, desc = "Close all folds" }
    maps.n["zr"] = { function() require("ufo").openFoldsExceptKinds() end, desc = "Fold less" }
    maps.n["zm"] = { function() require("ufo").closeFoldsWith() end, desc = "Fold more" }
    maps.n["zp"] = { function() require("ufo").peekFoldedLinesUnderCursor() end, desc = "Peek fold" }
end

-- Stay in indent mode
maps.v["<S-Tab>"] = { "<gv", desc = "unindent line" }
maps.v["<Tab>"] = { ">gv", desc = "indent line" }

-- INSERT --
maps.i["lk"] = { "<Esc>" }

utils.set_mappings(maps)