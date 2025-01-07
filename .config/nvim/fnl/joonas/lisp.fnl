(module joonas.lisp)

;; Lisp filetypes
(def filetypes ["clojure" "fennel" "janet" "hy" "racket" "scheme" "lisp" "sicp"])

;; Override file extensions
(vim.filetype.add
  {:extension {:bb "clojure"}})
