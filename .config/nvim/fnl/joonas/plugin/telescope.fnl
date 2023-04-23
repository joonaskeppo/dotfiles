(module joonas.plugin.telescope
  {autoload {nvim aniseed.nvim
             : telescope
             builtin telescope.builtin}})

(telescope.setup
  {:extensions {:fzf {:fuzzy true ; false will only do exact matching
                      :override_generic_sorter true ; override the generic sorter
                      :override_file_sorter true ; override the file sorter
                      :case_mode "smart_case" ; or "ignore_case" or "respect_case"
                      ; the default case_mode is "smart_case"
                      }
                :file_browser {:theme "ivy"
                               ; disables netrw and use telescope-file-browser in its place
                               :hijack_netrw true}}})

;; -- Extensions --
(telescope.load_extension "file_browser")
(telescope.load_extension "fzf")
