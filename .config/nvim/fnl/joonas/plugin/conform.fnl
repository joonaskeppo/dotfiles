(module joonas.conform
  {autoload {: conform}})

(conform.setup
  {:formatters_by_ft {:ocaml.mlx ["ocamlformat_mlx"]
                      :lua ["stylua"]
                      :javascript ["prettier"]}})
;
; (vim.api.nvim_create_autocmd
;   "BufWritePre"
;   {:pattern "*"
;    :callback (fn [args]
;                (let [conform (require :conform)]
;                  (conform.format {:bufnr args.buf})))})
;
; (vim.api.nvim_create_user_command
;   "Format"
;   (fn [args]
;     (let [range (if (= args.count -1)
;                   nil
;                   (let [end-line (nth (vim.api.nvim_buf_get_lines
;                               0
;                               (dec (.-line2 args))  ;; Fennel is 1-indexed, so subtract 1
;                               (.-line2 args)
;                               true)
;                             1)]
;                     {:start [(.-line1 args) 0]
;                      :end   [(.-line2 args) (string.len end-line)]}))
;           conform (require :conform)]
;       (conform.format
;        {:async true
;         :lsp_format "fallback"
;         :range range})))
;   {:range true})
