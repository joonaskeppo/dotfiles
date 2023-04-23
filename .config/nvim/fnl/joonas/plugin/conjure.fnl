(module joonas.plugin.conjure
  {autoload {nvim aniseed.nvim}})

(set nvim.g.conjure#highlight#enabled true)
(set nvim.g.conjure#extract#tree_sitter#enabled true)

(nvim.command "command! PortalAPIOpen ConjureEval (do (require '[portal.api]) (portal.api/tap) (portal.api/open {:theme :portal.colors/nord}))")
    
