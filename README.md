# nvim-config
Personal Neovim configuration.

### Features
- Plugin management using [`lazy`](https://github.com/folke/lazy.nvim)
- Cwd tree using [`nvim-tree`](https://github.com/nvim-tree/nvim-tree.lua) 
- Syntax highlighting using [`treesitter`](https://github.com/nvim-treesitter/nvim-treesitter)
    - Added context of current code block using [`treesitter-context`](https://github.com/nvim-treesitter/nvim-treesitter-context)
    - Automatic close of functions with `end` using [`nvim-treesitter-endwise`](https://github.com/RRethy/nvim-treesitter-endwise)
    - Automatic close of various tags using [`nvim-ts-autotag`](https://github.com/windwp/nvim-ts-autotag)
    - Rainbow parenthesis using [`nvim-t-s-rainbow`](https://github.com/p00f/nvim-ts-rainbow)
- Fuzzy finding using [`telescope`](htts://github.com/nvim-telescope/telescope.nvim)
- Buffer changes record using [`undotree`](https://github.com/mbbill/undotree)
- File marks for fast movement between files using [`harpoon`](https://github.com/ThePrimeagen/harpoon)
- LSP using [`lsp-zero`](https://github.com/VonHeikemen/lsp-zeron.nvim)
- Autoparing using [`nvim-autopairs`](https://github.com/windwp/nvim-autopairs)
- Commenting utilities using [`Comment`](https://github.com/numToStr/Comment.nvim)


### Structure
- `lua/dan/mappings.lua`: Contains most of the key bindings for the configuration. Some of them are also in the specific plugin configuration they belong.
- `lua/dan/options.lua`: Contains all the vim options being set
- `lua/dan/icons.lua`: Contains a variety of icons that can be used in other configurations
- `lua/dan/plugins/`: Contains all the plugin configurations.
    - `lua/dan/plugins/plugin-list.lua`: Contains a list of all plugins that will be installed by `lazy`
    - `lua/dan/plugins/plugin-active.lua`: Contains all the active plugins in the configuration (responsible for calling the `setup` function of each module)


