(module joonas.plugin.conjure
  {autoload {nvim aniseed.nvim
             core aniseed.core
             lisp joonas.lisp}})

(set nvim.g.conjure#highlight#enabled true)
(set nvim.g.conjure#filetypes lisp.filetypes) ; use only for Lisp-like languages
(set nvim.g.conjure#filetype#sicp "conjure.client.racket.stdio")
(set nvim.g.conjure#filetype#scheme "conjure.client.guile.socket")
(set nvim.g.conjure#extract#tree_sitter#enabled true)

(nvim.create_user_command :PortalAPIOpen
                          (fn [_args]
                            (nvim.command "ConjureEval (do (require '[portal.api]) (portal.api/tap) (portal.api/open {:theme :portal.colors/solarized-light}))"))
                          {})
(nvim.create_user_command :FigwheelStart
                          (fn [args]
                            (nvim.command (core.str "ConjureEval (do (require '[figwheel.main.api :as f]) "
                                                                   "(f/start \"" (core.get args :args) "\"))")))
                          {:nargs 1})

(set nvim.g.conjure#client#clojure#nrepl#mapping#macro_expand "xm")

; (vim.api.nvim_create_autocmd
;   "FileType"
;   {:pattern   "clj"
;    :callback  (fn [_ev]
;                 (set nvim.g.conjure#client#clojure#nrepl#mapping#macro_expand nil))})
