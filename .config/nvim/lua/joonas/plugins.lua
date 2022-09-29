return function(use)
  use 'wbthomason/packer.nvim'
  use 'nvim-lua/popup.nvim'
  use 'nvim-lua/plenary.nvim'
  use {
      'nvim-treesitter/nvim-treesitter',
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
  }
  use {
    'Olical/conjure',
    as = 'conjure',
    config = function()
      vim.g['conjure#highlight#enabled'] = true
    end
  }
  use {
    'ellisonleao/gruvbox.nvim',
    as = 'gruvbox',
    config = function()
      vim.o.background = 'dark'
      vim.cmd('colorscheme gruvbox')
    end
  }
  use {
    'nvim-lualine/lualine.nvim',
    requires = { 'kyazdani42/nvim-web-devicons', opt = true }
  }
end
