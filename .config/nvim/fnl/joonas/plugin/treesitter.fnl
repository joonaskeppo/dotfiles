(module joonas.plugin.treesitter
  {autoload {installer nvim-treesitter.install
             configs nvim-treesitter.configs}
   require {: ocaml_mlx}})

(installer.update {:with_sync true})

(configs.setup
  {:ensure_installed  ["c" "cpp" "rust"
                       "lua"
                       "sql"
                       "clojure" "fennel" "scheme" "racket"
                       "markdown"
                       "vim"
                       "bash"
                       "ocaml" "ocaml_mlx"
                       "html" "css" "json" "javascript" "typescript"]
   :sync_installed false
   :highlight {:enable true}
   :additional_vim_regex_highlighting  true ; at least for now (primarily: Clojure/Conjure)
   :indent {:enable true
            :disable ["ocaml"]}
   :rainbow {:enable false
             :extended_mode true
             :max_file_lines nil}
   :context_commentstring {:enable true}})
