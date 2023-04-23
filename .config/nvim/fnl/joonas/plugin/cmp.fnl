(module joonas.plugin.cmp
  {autoload {: cmp
             : luasnip
             snip-from-vscode luasnip.loaders.from_vscode}})

(snip-from-vscode.lazy_load)

(cmp.setup {:snippet {:expand (fn [args] (luasnip.lsp_expand args.body)) }
            :mapping {:<C-b> (cmp.mapping.scroll_docs -4)
                      :<C-f> (cmp.mapping.scroll_docs 4)
                      :<C-Space> (cmp.mapping.complete)
                      :<C-e> (cmp.mapping.abort)
                      :<CR> (cmp.mapping.confirm {:select true}) ; accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
                      :<Tab> (cmp.mapping (fn [fallback]
                                            (if
                                              (cmp.visible) (cmp.select_next_item)
                                              (luasnip.expandable) (luasnip.expand)
                                              (luasnip.expand_or_jumpable) (luasnip.expand_or_jump)
                                              (fallback)))
                                          ["i" "s"])
                      :<S-Tab> (cmp.mapping (fn [fallback]
                                              (if
                                                (cmp.visible) (cmp.select_prev_item)
                                                (luasnip.jumpable -1) (luasnip.jump -1)
                                                (fallback)))
                                            ["i" "s"])}
            :sources [{:name "nvim_lsp"}
                      {:name "conjure"}
                      {:name "nvim_lua"}
                      {:name "luasnip"}
                      {:name "buffer"}
                      {:name "path"}]
            :confirm_opts {:behavior cmp.ConfirmBehavior.Replace
                           :select false}
            :experimental {:ghost_text false
                           :native_menu false}})

