(module joonas.plugin.null-ls
  {autoload {: null-ls}})

(def- formatting null-ls.builtins.formatting)
(def- diagnostics null-ls.builtins.diagnostics)

;; TODO: use conform.nvim instead
(null-ls.setup
  {:debug false
   :sources [formatting.clang_format
             formatting.prettier
             diagnostics.clj_kondo]})
