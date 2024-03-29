(module joonas.plugin
  {autoload {p ext.plugin
             nvim aniseed.nvim}})

(p.use
  :akinsho/toggleterm.nvim {:tag "*" :config (fn [] (let [tt (require :toggleterm)] (tt.setup)))}
  :bakpakin/fennel.vim {}
  :christoomey/vim-tmux-navigator {}
  :ekaitz-zarraga/nvim-paredit-scheme {:mod :paredit}
  :folke/trouble.nvim {:mod :trouble}
  :godlygeek/tabular {}
  :hrsh7th/cmp-buffer {}
  :hrsh7th/cmp-cmdline {}
  :hrsh7th/cmp-nvim-lsp {}
  :hrsh7th/cmp-nvim-lua {}
  :hrsh7th/cmp-path {}
  :hrsh7th/nvim-cmp {:mod :cmp}
  :JoosepAlviste/nvim-ts-context-commentstring {}
  :jose-elias-alvarez/null-ls.nvim {}
  :julienvincent/nvim-paredit {:mod :paredit}
  :julienvincent/nvim-paredit-fennel {:mod :paredit}
  :junegunn/fzf {:mod :fzf :build (fn [] (nvim.fn.fzf#install))}
  :junegunn/fzf.vim {}
  :L3MON4D3/LuaSnip {}
  :lewis6991/gitsigns.nvim {:config (fn [] (let [gitsigns (require :gitsigns)] (gitsigns.setup)))}
  :lewis6991/impatient.nvim {}
  :mcchrish/zenbones.nvim {:mod :theme}
  :neovim/nvim-lspconfig {:mod :lsp :requires [[:williamboman/mason.nvim] [:williamboman/mason-lspconfig.nvim]]}
  :numToStr/Comment.nvim {:mod :comment}
  :nvim-lua/plenary.nvim {}
  :nvim-lua/popup.nvim {}
  :nvim-lualine/lualine.nvim {:mod :lualine}
  :nvim-orgmode/orgmode {:config (fn [] (let [orgmode (require :orgmode)] (orgmode.setup_ts_grammar)))}
  :nvim-telescope/telescope-fzf-native.nvim {:run "make"} 
  :nvim-telescope/telescope.nvim {:mod :telescope :requires [[:nvim-telescope/telescope-live-grep-args.nvim]]}
  :nvim-treesitter/nvim-treesitter {:mod :treesitter}
  :Olical/aniseed {}
  :Olical/conjure {:mod :conjure}
  :Olical/nvim-local-fennel {}
  :PaterJason/cmp-conjure {}
  :preservim/vim-markdown {}
  :purescript-contrib/purescript-vim {}
  :rafamadriz/friendly-snippets {}
  :rktjmp/lush.nvim {}
  :sakhnik/nvim-gdb {:mod :gdb}
  :stevearc/oil.nvim {:mod :oil}
  :ThePrimeagen/harpoon {}
  :tpope/vim-fugitive {}
  :tpope/vim-repeat {}
  :tpope/vim-surround {}
  :wbthomason/packer.nvim {}
  :williamboman/mason-lspconfig.nvim {:requires [[:neovim/nvim-lspconfig] [:williamboman/mason.nvim]]}
  :williamboman/mason.nvim {:config (fn [] (let [mason (require :mason)] (mason.setup))) :run ":MasonUpdate"}
  :windwp/nvim-autopairs {:mod :autopairs}
  :wlangstroth/vim-racket {}
  )

