return {
    -- Package Management
    'wbthomason/packer.nvim',

    -- Popups
    'nvim-lua/popup.nvim',

    -- Misc
    'nvim-lua/plenary.nvim', -- reusable Lua fns
    'windwp/nvim-autopairs', -- [], (), {}, "", ''

    -- Themes
    'ellisonleao/gruvbox.nvim',

    -- LSP
    'neovim/nvim-lspconfig',
    'williamboman/mason.nvim',
    'williamboman/mason-lspconfig.nvim',

    -- Completion
    'hrsh7th/nvim-cmp', -- base completion plugin
    'hrsh7th/cmp-nvim-lsp',
    'hrsh7th/cmp-nvim-lua',
    'hrsh7th/cmp-buffer',
    'hrsh7th/cmp-path',
    'hrsh7th/cmp-cmdline',

    -- Snippets
    'L3MON4D3/LuaSnip', -- snippets engine
    'rafamadriz/friendly-snippets',

    -- Telescope
    'nvim-telescope/telescope.nvim',

    -- Treesitter
    ['nvim-treesitter/nvim-treesitter'] = { 
        run = function()
	        require('nvim-treesitter.install').update { with_sync = true }
        end,
        config = function()
            require('nvim-treesitter.configs').setup {
                ensure_installed = 'all',
                sync_installed = false,
                ignore_install = { "phpdoc" }, -- seems to be borked atm (`npm install` error)
                highlight = {
                    enable = true,
                    disable = { "" },
                },
                additional_vim_regex_highlighting = false,
                indent = {
                    enable = true,
                    disable = { "" },
                },
                rainbow = {
                    enable = true,
                    extended_mode = true,
                    max_file_lines = nil,
                }
            }
        end,
    },
    'p00f/nvim-ts-rainbow', -- rainbow parens

    -- Clojure
    ['Olical/conjure'] = {
        as = 'conjure',
        config = function()
            vim.g['conjure#highlight#enabled'] = true
        end
    },

    -- Modeline
    ['nvim-lualine/lualine.nvim'] = {
        requires = { 'kyazdani42/nvim-web-devicons', opt = true }
    }
}
