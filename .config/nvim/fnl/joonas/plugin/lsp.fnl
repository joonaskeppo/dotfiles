(module joonas.plugin.lsp
  {autoload {: lspconfig
             handlers joonas.lsp.handlers}})

(handlers.setup)

(require :joonas.lsp.langs)
(require :joonas.lsp.null-ls)
