(module joonas.lsp.handlers
  {autoload {nvim aniseed.nvim
             cmp-nvim-lsp cmp_nvim_lsp
             a aniseed.core}})

;; adapted from:
;; https://github.com/neovim/nvim-lspconfig#suggested-configuration
;; https://github.com/LunarVim/Neovim-from-scratch/blob/06-LSP/lua/user/lsp/handlers.lua

; (defn- keymap [mode chord cmd opts]
;   (vim.api.nvim mode chord cmd opts))

;; per `:h lsp-semantic-highlight`
(defn- clear-semantic-highlights []
  ;; Hide semantic highlights for functions
  (nvim.set_hl 0 "@lsp.type.function" {})
  ;; Hide all semantic highlights
  (each [_ group (ipairs (vim.fn.getcompletion "@lsp" "highlight"))]
    (nvim.set_hl 0 group {})))

(defn setup [mode]
  (let [config {:virtual_text (case mode :lisp false _ true)
                :update_in_insert true
                :signs (case mode :lisp false _ true)
                :underline true
                :severity_sort true
                :float {:focusable false
                        :style "minimal"
                        :border "rounded"
                        :source "always"
                        :header ""
                        :prefix ""}}]
    (vim.diagnostic.config config)
    (clear-semantic-highlights)
    (-> vim.lsp
        (a.assoc-in [:handlers :textDocument/hover]
                    (vim.lsp.with vim.lsp.handlers.hover {:border "rounded"}))
        (a.assoc-in [:handlers :textDocument/signatureHelp]
                    (vim.lsp.with vim.lsp.handlers.signature_help {:border "rounded"})))))

(def capabilities
  (-> (vim.lsp.protocol.make_client_capabilities)
      (cmp-nvim-lsp.default_capabilities)))

;; Use LspAttach autocommand to only map the following keys
;; after the language server attaches to the current buffer

(vim.api.nvim_create_autocmd
  "LspAttach"
  {:group (vim.api.nvim_create_augroup "UserLspConfig" {})
   :callback (fn [ev]
               (clear-semantic-highlights)
               ;; Enable completion triggered by <c-x><c-o>
               (tset (. vim.bo ev.buf) :omnifunc "v:lua.vim.lsp.omnifunc")
               (let [opts {:noremap true :silent true :buffer ev.buf}
                     keymap vim.keymap.set]
                 (keymap :n "gD" vim.lsp.buf.declaration opts)
                 (keymap :n "gd" vim.lsp.buf.definition opts)
                 (keymap :n "K" vim.lsp.buf.hover opts)
                 (keymap :n "gi" vim.lsp.buf.implementation opts)
                 (keymap :n "<C-k>" vim.lsp.buf.signature_help opts)
                 (keymap :n "<leader>D" vim.lsp.buf.type_definition opts)
                 (keymap :n "<leader>gr" vim.lsp.buf.references opts)
                 (keymap :n "<leader>bf" (fn [] (vim.lsp.buf.format {:async true})) opts)))})
