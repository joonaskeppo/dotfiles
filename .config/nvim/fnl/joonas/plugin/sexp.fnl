(module joonas.plugin.sexp
  {autoload {nvim aniseed.nvim
             paredit nvim-paredit}})

(paredit.setup)

;; TODO: not needed anymore?
; (set nvim.g.sexp_filetypes "clojure,scheme,racket,lisp,timl,fennel,janet")
; (set nvim.g.sexp_insert_mode_mappings 0)

