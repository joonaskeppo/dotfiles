(module joonas.lsp.handlers
  {autoload {nvim aniseed.nvim
             cmp-nvim-lsp cmp_nvim_lsp
             a aniseed.core}})

;; adapted from:
;; https://github.com/neovim/nvim-lspconfig#suggested-configuration
;; https://github.com/LunarVim/Neovim-from-scratch/blob/06-LSP/lua/user/lsp/handlers.lua

(defn- keymap [mode chord f bufopts]
  (vim.keymap.set mode chord f bufopts))

(defn setup []
  (let [config {:virtual_text false
                :update_in_insert true
                :signs false
                :underline true
                :severity_sort true
                :float {:focusable false
                        :style "minimal"
                        :border "rounded"
                        :source "always"
                        :header ""
                        :prefix ""}}]
    (vim.diagnostic.config config)
    (-> vim.lsp
        (a.assoc-in [:handlers :textDocument/hover]
                    (vim.lsp.with vim.lsp.handlers.hover {:border "rounded"}))
        (a.assoc-in [:handlers :textDocument/signatureHelp]
                    (vim.lsp.with vim.lsp.handlers.signature_help {:border "rounded"})))))

;; Use an on-attach function to only map the following keys
;; after the language server attaches to the current buffer
(defn on-attach [client bufnr]
  ; Enable completion triggered by <c-x><c-o>
  (set nvim.bo.omnifunc "v:lua.vim.lsp.omnifunc")
  (set nvim.bo.tagfunc "v:lua.vim.lsp.tagfunc")
  ; Use LSP as the handler for formatexpr.
  (set nvim.bo.formatexpr "v:lua.vim.lsp.formatexpr()")
  ;; - Mappings -
  ;; See `:help vim.lsp.*` for documentation on any of the below functions
  (let [bufopts {:noremap true :silent true :buffer bufnr}]
	(keymap :n "gD" vim.lsp.buf.declaration bufopts)
	(keymap :n "gd" vim.lsp.buf.definition bufopts)
	(keymap :n "K" vim.lsp.buf.hover bufopts)
	(keymap :n "gi" vim.lsp.buf.implementation bufopts)
	(keymap :n "<C-k>" vim.lsp.buf.signature_help bufopts)
    ; COULD WE JUST USE TROUBLE FOR THESE??
	(keymap :n "<space>D" vim.lsp.buf.type_definition bufopts)
	(keymap :n "<space>rn" vim.lsp.buf.rename bufopts)
	(keymap :n "<space>ca" vim.lsp.buf.code_action bufopts)
	(keymap :n "gr" vim.lsp.buf.references bufopts) ; REDUNDANT???
	(keymap :n "<space>lf" (fn [] (vim.lsp.buf.format {:async true})) bufopts)))

(def capabilities
  (-> (vim.lsp.protocol.make_client_capabilities)
      (cmp-nvim-lsp.default_capabilities)))
