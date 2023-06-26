(module joonas.plugin.treesitter
  {autoload {installer nvim-treesitter.install
             configs nvim-treesitter.configs}})

(installer.update {:with_sync true})

(configs.setup
  {:ensure_installed  ["c" "cpp" "rust"
                       "lua"
                       "sql"
                       "clojure" "fennel" "scheme" "racket"
                       "markdown"
                       "vim"
                       "bash"
                       "html" "css" "json" "javascript" "typescript"]
   :sync_installed false
   :highlight {:enable true
               :disable ["sql"] ; some issues likely due to HugSQL syntax
               }
   :additional_vim_regex_highlighting  true ; at least for now (primarily: Clojure/Conjure)
   :indent {:enable true
            :disable [""]}
   :rainbow {:enable false
             :extended_mode true
             :max_file_lines nil}
   :context_commentstring {:enable true}})
