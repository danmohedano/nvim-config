local options = {
    opt = {
        backup = false, -- does not create a backup file
        breakindent = true, -- wrap text to match line start
        clipboard = "unnamedplus", -- allows neovim to access the system clipboard
        cmdheight = 0, -- hide command line unless needed
        colorcolumn = "80", -- colorcolumn at 80 chars
        completeopt = { "menuone", "noselect" }, -- mostly just for cmp and insert mode completion
        conceallevel = 0, -- so that `` is visible in markdown files
        copyindent = true, -- copy the previous indentation on autoindenting
        cursorline = true, -- highlight the text line of the cursor
        errorbells = false, -- avoid error bells
        expandtab = true, -- convert tabs to spaces
        fileencoding = "utf-8", -- the encoding written to a file
        fillchars = { eob = " " }, -- disable `~` on noexistent lines
        foldenable = true, -- enable fold for nvim-ufo
        foldlevel = 99, -- set high foldlevel for nvim-ufo
        foldlevelstart = 99, -- start with all code unfolded
        foldcolumn = vim.fn.has "nvim-0.9" == 1 and "1" or nil, -- show foldcolumn in nvim 0.9
        history = 100, -- number of commands to remember in a history table
        hlsearch = true, -- highlight all matches on previous search pattern
        incsearch = true, -- show the search pattern if found as it is being typed 
        ignorecase = true, -- ignore case in search patterns
        infercase = true, -- infer cases in keyword completion
        laststatus = 3, -- globalstatus
        linebreak = true, -- wrap lines at 'breakat'
        mouse = "a", -- allow the mouse to be used in neovim
        number = true, -- show numberline
        preserveindent = true, -- preserve indent structure as much as possible
        pumheight = 10, -- pop up menu height
        relativenumber = true, -- show relative numberline
        scrolloff = 12, -- number of lines to keep above and below the cursor
        shiftwidth = 4, -- number of spaces inserted for indentation
        showmode = true, -- show modes in command line
        showtabline = 2, -- always show tabs
        sidescrolloff = 12, -- number of columns to keep at the sides of the cursor
        signcolumn = "yes", -- always show the sign column
        smartcase = true, -- case sensitive searching
        smartindent = true, -- make indenting smarter again
        softtabstop = 4, -- tab length
        splitbelow = true, -- splitting a new window below the current one
        splitkeep = vim.fn.has "nvim-0.9" == 1 and "screen" or nil, -- maintain code view when splitting
        splitright = true, -- splitting a new window at the right of the current one
        tabstop = 4, -- tab length
        termguicolors = true, -- set term gui colors (most terminals support this)
        timeoutlen = 500, -- time to wait for a mapped sequence to complete (in milliseconds)
        undofile = true, -- enable persistent undo
        updatetime = 50, -- faster completion (4000ms default)
        virtualedit = "block", -- allow going past end of line in visual block mode
        wrap = false, -- display lines as one long line
        writebackup = false, -- if a file is being edited by another program (or was written to file while editing with another program), it is not allowed to be edited
    },
    g = {
        highlighturl_enabled = true, -- highlight urls by default
        mapleader = " ", -- set leader key
        autoformat_enabled = true, -- enable or disable autoformatting at start (lsp.formatting.format_on_save must be enabled)
        codelens_enabled = true, -- enable or disable automatic codelens refreshing for lsp that support it
        lsp_handlers_enabled = true, -- enable or disable default vim.lsp.handlers (hover and signatureHelp)
        cmp_enabled = true, -- enable completion at start
        autopairs_enabled = true, -- enable autopairs at start
        diagnostics_mode = 3, -- set the visibility of diagnostics in the UI (0=off, 1=only show in status line, 2=virtual text off, 3=all on)
        icons_enabled = true, -- disable icons in the UI (disable if no nerd font is available)
        ui_notifications_enabled = true, -- disable notifications when toggling UI elements
    },
    t = { bufs = vim.api.nvim_list_bufs() }, -- initialize buffers for the current tab
}


-- set all options from table
for scope, table in pairs(options) do
    for setting, value in pairs(table) do
        vim[scope][setting] = value
    end
end


vim.cmd "set whichwrap+=<,>,[,]"
vim.cmd [[set iskeyword+=-]]                    -- Consider as a whole word things like abc-cde 
