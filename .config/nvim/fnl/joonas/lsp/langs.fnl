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
   ;; See these instructions when setting this up on a new machine: https://github.com/neovim/nvim-lspconfig/blob/master/doc/configs.md#bicep
   :bicep {:settings {}
           :cmd_env {:DOTNET_ROOT "/usr/local/share/dotnet"}
           :cmd ["/usr/local/share/dotnet/dotnet" (nvim.fn.expand "~/.local/share/nvim/mason/packages/bicep-lsp/extension/bicepLanguageServer/Bicep.LangServer.dll")]
           :filetypes ["bicep"]
           :root_dir (fn [name]
                       (or ((lspconfig.util.root_pattern "main.bicep" ".git") name)
                           (lspconfig.util.path.dirname name)))}
   :ts_ls default-server-config
   :ocamllsp default-server-config
   :clojure_lsp {:settings {}
                 :on_attach (fn [] (handlers.setup :lisp))}
   :hls default-server-config
   :sqlls default-server-config
   :zls default-server-config
   :rust_analyzer default-server-config
   :marksman default-server-config})

(mason-lspconfig.setup {:ensure_installed (a.keys servers)})

(each [lang lang-opts (pairs servers)]
  (let [setup-fn (. lspconfig lang :setup)
        server-opts (a.merge base-opts lang-opts)]
    (setup-fn server-opts)))
