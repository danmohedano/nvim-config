# nvim-config

Personal Neovim configuration. 

This branch contains a modification of my original config aimed at being as minimal as possible to reduce clutter both on execution and in the configuration.

## Features

- Plugin management using [`lazy`](https://github.com/folke/lazy.nvim)
- Syntax highlighting using [`treesitter`](https://github.com/nvim-treesitter/nvim-treesitter)
- Fuzzy finding using [`telescope`](https://github.com/nvim-telescope/telescope.nvim)
- Buffer changes record using [`undotree`](https://github.com/mbbill/undotree)
- File marks for fast movement between files using [`harpoon`](https://github.com/ThePrimeagen/harpoon)
- LSP using [`lsp-zero`](https://github.com/VonHeikemen/lsp-zeron.nvim) and [`mason`](https://github.com/williamboman/mason.nvim)
- Git wrapping using [`fugitive`](https://github.com/tpope/vim-fugitive)
- Diagnostics summary using [`trouble`](https://github.com/folke/trouble.nvim)
- Status line using [`lualine`](https://github.com/nvim-lualine/lualine.nvim)

## Structure

- `lua/dan/mappings.lua`: keybindings
- `lua/dan/options.lua`: vim options
- `lua/dan/utils/`: some utils used by the configuration
- `lua/dan/plugins/`: plugin configuration
