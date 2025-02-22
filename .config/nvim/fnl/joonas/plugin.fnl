(module joonas.plugin
  {autoload {p ext.plugin
             nvim aniseed.nvim}})

(p.use
  :JoosepAlviste/nvim-ts-context-commentstring {}
  :L3MON4D3/LuaSnip {}
  :Olical/aniseed {}
  :Olical/conjure {:mod :conjure}
  :Olical/nvim-local-fennel {}
  :PaterJason/cmp-conjure {}
  :ThePrimeagen/harpoon {}
  :akinsho/toggleterm.nvim {:tag "*" :config (fn [] (let [tt (require :toggleterm)] (tt.setup)))}
  :alx741/vim-hindent {}
  :bakpakin/fennel.vim {}
  :carlsmedstad/vim-bicep {}
  :christoomey/vim-tmux-navigator {}
  :folke/trouble.nvim {:mod :trouble}
  :godlygeek/tabular {}
  :hrsh7th/cmp-buffer {}
  :hrsh7th/cmp-cmdline {}
  :hrsh7th/cmp-nvim-lsp {}
  :hrsh7th/cmp-nvim-lua {}
  :hrsh7th/cmp-path {}
  :hrsh7th/nvim-cmp {:mod :cmp}
  :julienvincent/nvim-paredit {:mod :paredit}
  :lewis6991/gitsigns.nvim {:config (fn [] (let [gitsigns (require :gitsigns)] (gitsigns.setup)))}
  :lewis6991/impatient.nvim {}
  :mcchrish/zenbones.nvim {:mod :theme}
  :neovim/nvim-lspconfig {:mod :lsp :requires [[:williamboman/mason.nvim] [:williamboman/mason-lspconfig.nvim]]}
  :numToStr/Comment.nvim {:mod :comment}
  :nvim-lua/plenary.nvim {}
  :nvim-lua/popup.nvim {}
  :nvim-lualine/lualine.nvim {:mod :lualine}
  :nvim-telescope/telescope.nvim {:mod :telescope :requires [[:nvim-telescope/telescope-live-grep-args.nvim]]}
  :nvim-treesitter/nvim-treesitter {:mod :treesitter :requires [[:ocaml-mlx/ocaml_mlx.nvim]]}
  :nvimtools/none-ls.nvim {:mod :null-ls}
  :ocaml-mlx/ocaml_mlx.nvim {}
  :preservim/vim-markdown {}
  :purescript-contrib/purescript-vim {}
  :rachartier/tiny-code-action.nvim {:config (fn [] (let [tiny-code-action (require :tiny-code-action)] (tiny-code-action.setup)))}
  :rafamadriz/friendly-snippets {}
  :rktjmp/lush.nvim {}
  :sakhnik/nvim-gdb {:mod :gdb}
  :stevearc/conform.nvim {:requires [[:ocaml-mlx/ocaml_mlx.nvim]] :mod :conform}
  :stevearc/oil.nvim {:mod :oil}
  :tpope/vim-fugitive {}
  :tpope/vim-repeat {}
  :tpope/vim-surround {}
  :wbthomason/packer.nvim {}
  :williamboman/mason-lspconfig.nvim {:requires [[:neovim/nvim-lspconfig] [:williamboman/mason.nvim]]}
  :williamboman/mason.nvim {:config (fn [] (let [mason (require :mason)] (mason.setup))) :run ":MasonUpdate"}
  :windwp/nvim-autopairs {:mod :autopairs}
  :wlangstroth/vim-racket {}
  :ziglang/zig.vim {}
  :zyedidia/literate.vim {}
  )

