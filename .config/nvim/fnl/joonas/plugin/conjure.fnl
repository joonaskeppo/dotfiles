(module joonas.plugin.conjure
  {autoload {nvim aniseed.nvim
             core aniseed.core}})

(set nvim.g.conjure#highlight#enabled true)
(set nvim.g.conjure#filetypes ["clojure" "fennel" "janet" "hy" "racket" "scheme" "lisp"]) ; use only for Lisp-like languages
(set nvim.g.conjure#extract#tree_sitter#enabled true)

(nvim.create_user_command :PortalAPIOpen
                          (fn [_args]
                            (nvim.command "ConjureEval (do (require '[portal.api]) (portal.api/tap) (portal.api/open {:theme :portal.colors/nord}))"))
                          {})
(nvim.create_user_command :FigwheelStart
                          (fn [args]
                            (nvim.command (core.str "ConjureEval (do (require '[figwheel.main.api :as f]) "
                                                                   "(f/start \"" (core.get args :args) "\"))")))
                          {:nargs 1})
    
