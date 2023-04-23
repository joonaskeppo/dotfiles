(module joonas.lsp.langs
  {autoload {a aniseed.core
             nvim aniseed.nvim
             handlers joonas.lsp.handlers
             : mason
             : mason-lspconfig
             : lspconfig}})

(def- base-opts
  {:on-attach handlers.on-attach
   :capabilities handlers.capabilities})

(def- default-server-config {:settings {}})

(def- servers
  {:lua_ls {:settings {:Lua {:diagnostics {:globals ["vim"]}
                             :workspace {:library {(nvim.fn.expand "$VIMRUNTIME/lua") true
                                                   (.. (nvim.fn.stdpath "config") "/lua") true}}
                             :telemetry {:enable false}}}}
   :clangd default-server-config
   :clojure_lsp default-server-config
   :sqlls default-server-config})

(mason-lspconfig.setup {:ensure_installed (a.keys servers)})

(each [lang lang-opts (pairs servers)]
  (let [setup-fn (. lspconfig lang :setup)
        server-opts (a.merge lang-opts base-opts)]
    (setup-fn server-opts)))
