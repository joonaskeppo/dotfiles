return {
    'wbthomason/packer.nvim',
    'nvim-lua/popup.nvim',
    'nvim-lua/plenary.nvim',
    ['nvim-treesitter/nvim-treesitter'] = { 
        run = function()
	        require('nvim-treesitter.install').update { with_sync = true }
        end,
        config = function()
            require('nvim-treesitter.configs').setup {
                highlight = {
                    enable = true,
                    additional_vim_regex_highlighting = false
                },
                ensure_installed = { "clojure" }
            }
        end
    },
    ['Olical/conjure'] = {
        as = 'conjure',
        config = function()
            vim.g['conjure#highlight#enabled'] = true
        end
    },
    ['ellisonleao/gruvbox.nvim'] = {
        as = 'gruvbox',
        config = function()
            vim.o.background = 'dark'
            vim.cmd('colorscheme gruvbox')
        end
    },
    ['nvim-lualine/lualine.nvim'] = {
        requires = { 'kyazdani42/nvim-web-devicons', opt = true }
    }
}
