(module joonas.lsp.null-ls
  {autoload {: null-ls}})

(def- formatting null-ls.builtins.formatting)
(def- diagnostics null-ls.builtins.diagnostics)

(null-ls.setup
  {:debug false
   :sources [formatting.stylua
             formatting.prettier
             formatting.clang_format
             diagnostics.clj_kondo]})
