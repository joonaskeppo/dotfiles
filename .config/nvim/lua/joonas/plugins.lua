return {
    -- Package Management
    'wbthomason/packer.nvim',

    -- Popups
    'nvim-lua/popup.nvim',

    -- Misc
    'nvim-lua/plenary.nvim', -- reusable Lua fns
    'windwp/nvim-autopairs', -- [], (), {}, "", ''
    'numToStr/Comment.nvim',
    'JoosepAlviste/nvim-ts-context-commentstring',
    'p00f/nvim-ts-rainbow', -- rainbow parens
    'nvim-lualine/lualine.nvim',
    'christoomey/vim-tmux-navigator', -- seamless navigation between tmux and vim window splits
    'nvim-tree/nvim-web-devicons',

    -- Themes
    'rktjmp/lush.nvim',
    'mcchrish/zenbones.nvim',

    -- LSP
    'neovim/nvim-lspconfig',
    'williamboman/mason.nvim',
    'williamboman/mason-lspconfig.nvim',
    'jose-elias-alvarez/null-ls.nvim',
    'folke/trouble.nvim', -- pretty diagnostics

    -- Completion
    'hrsh7th/nvim-cmp', -- base completion plugin
    'hrsh7th/cmp-nvim-lsp',
    'hrsh7th/cmp-nvim-lua',
    'hrsh7th/cmp-buffer',
    'hrsh7th/cmp-path',
    'hrsh7th/cmp-cmdline',
    'PaterJason/cmp-conjure',

    -- Snippets
    'L3MON4D3/LuaSnip', -- snippets engine
    'rafamadriz/friendly-snippets',

    -- Telescope
    'nvim-telescope/telescope.nvim',
    'nvim-telescope/telescope-file-browser.nvim', -- file navigation, netrw replacement
    ['nvim-telescope/telescope-fzf-native.nvim'] = -- fzf for better search
        { run = 'make'},

    -- Search
    ['junegunn/fzf'] =
        { build = function() vim.fn['fzf#install']() end},
    'junegunn/fzf.vim',

    -- Treesitter
    'nvim-treesitter/nvim-treesitter',

    -- Editing
    'guns/vim-sexp',
    'tpope/vim-sexp-mappings-for-regular-people',
    'tpope/vim-repeat',
    'tpope/vim-surround',

    -- Git
    'lewis6991/gitsigns.nvim',
    'tpope/vim-fugitive',

    -- Lisps
    'Olical/conjure',
    'wlangstroth/vim-racket',

    -- Markup
    'godlygeek/tabular',
    'preservim/vim-markdown',
    'nvim-orgmode/orgmode'
}
