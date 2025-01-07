(module joonas.plugin.telescope
  {autoload {nvim aniseed.nvim
             : telescope
             builtin telescope.builtin}})

(telescope.setup
  {:defaults {:preview {:treesitter false}} ; NOTE: TS slows nvim down to a crawl with large projects, when using live_grep
   :pickers {:find_files {:disable_devicons true}}})

;; -- Extensions --
(telescope.load_extension "harpoon")
(telescope.load_extension "live_grep_args")
