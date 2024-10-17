(module joonas.lsp.langs
  {autoload {a aniseed.core
             nvim aniseed.nvim
             handlers joonas.lsp.handlers
             : mason
             : mason-lspconfig
             : lspconfig}})

(def- base-opts
  {:capabilities handlers.capabilities})

(def- default-server-config {:settings {}})

(def- servers
  {:lua_ls {:settings {:Lua {:diagnostics {:globals ["vim"]}
                             :workspace {:library {(nvim.fn.expand "$VIMRUNTIME/lua") true
                                                   (.. (nvim.fn.stdpath "config") "/lua") true}}
                             :telemetry {:enable false}}}}
   :clangd default-server-config
   :purescriptls {:settings {:purescript {:addSpagoSources true}}}
   :ts_ls default-server-config
   :ocamllsp default-server-config
   :clojure_lsp {:settings {}
                 :on_attach (fn [] (handlers.setup :lisp))}
   :sqlls default-server-config
   :rust_analyzer default-server-config})

(mason-lspconfig.setup {:ensure_installed (a.keys servers)})

(each [lang lang-opts (pairs servers)]
  (let [setup-fn (. lspconfig lang :setup)
        server-opts (a.merge base-opts lang-opts)]
    (setup-fn server-opts)))
