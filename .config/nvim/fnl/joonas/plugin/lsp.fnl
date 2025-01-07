(module joonas.plugin.lsp
  {autoload {: lspconfig
             handlers joonas.lsp.handlers}})

(handlers.setup :default)

(require :joonas.lsp.langs)
