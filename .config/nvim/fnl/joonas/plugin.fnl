(module joonas.plugin
  {autoload {p ext.plugin
             nvim aniseed.nvim}})

(p.use
  :JoosepAlviste/nvim-ts-context-commentstring {}
  :L3MON4D3/LuaSnip {}
  :ThePrimeagen/harpoon {}
  :akinsho/toggleterm.nvim {:tag "*" :config (fn [] (let [tt (require :toggleterm)] (tt.setup)))}
  :bakpakin/fennel.vim {}
  :christoomey/vim-tmux-navigator {}
  :folke/trouble.nvim {}
  :godlygeek/tabular {}
  :guns/vim-sexp {:mod :sexp}
  :hrsh7th/cmp-buffer {}
  :hrsh7th/cmp-cmdline {}
  :hrsh7th/cmp-nvim-lsp {}
  :hrsh7th/cmp-nvim-lua {}
  :hrsh7th/cmp-path {}
  :hrsh7th/nvim-cmp {:mod :cmp}
  :jay-babu/mason-nvim-dap.nvim {}
  :jose-elias-alvarez/null-ls.nvim {}
  :junegunn/fzf {:mod :fzf :build (fn [] (nvim.fn.fzf#install))}
  :junegunn/fzf.vim {}
  :lewis6991/gitsigns.nvim {:config (fn [] (let [gitsigns (require :gitsigns)] (gitsigns.setup)))}
  :lewis6991/impatient.nvim {}
  :mcchrish/zenbones.nvim {:mod :theme}
  :mfussenegger/nvim-dap {:mod :dap}
  :neovim/nvim-lspconfig {:mod :lsp :requires [[:williamboman/mason.nvim] [:williamboman/mason-lspconfig.nvim]]}
  :numToStr/Comment.nvim {:mod :comment}
  :nvim-lua/plenary.nvim {}
  :nvim-lua/popup.nvim {}
  :nvim-lualine/lualine.nvim {:mod :lualine}
  :nvim-orgmode/orgmode {:config (fn [] (let [orgmode (require :orgmode)] (orgmode.setup_ts_grammar)))}
  :nvim-telescope/telescope-fzf-native.nvim {:run "make"} 
  :nvim-telescope/telescope.nvim {:mod :telescope :requires [[:nvim-telescope/telescope-live-grep-args.nvim]]}
  :nvim-tree/nvim-web-devicons {}
  :nvim-treesitter/nvim-treesitter {:mod :treesitter}
  :preservim/vim-markdown {}
  :rafamadriz/friendly-snippets {}
  :rktjmp/lush.nvim {}
  :stevearc/oil.nvim {:mod :oil}
  :theHamsta/nvim-dap-virtual-text {:mod :dap}
  :tpope/vim-fugitive {}
  :tpope/vim-repeat {}
  :tpope/vim-sexp-mappings-for-regular-people {}
  :tpope/vim-surround {}
  :wbthomason/packer.nvim {}
  :williamboman/mason-lspconfig.nvim {:requires [[:neovim/nvim-lspconfig] [:williamboman/mason.nvim]]}
  :williamboman/mason.nvim {:config (fn [] (let [mason (require :mason)] (mason.setup))) :run ":MasonUpdate"}
  :windwp/nvim-autopairs {:mod :autopairs}
  :wlangstroth/vim-racket {}
  )

