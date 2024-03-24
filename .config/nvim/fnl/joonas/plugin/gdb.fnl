(module joonas.plugin.gdb
  {autoload {nvim aniseed.nvim}})

(set nvim.g.nvimgdb_config_override
  {:key_next "n"
   :key_step "s"
   :key_finish "f"
   :key_continue "c"
   :key_until "u"
   :key_breakpoint "b"
   :set_tkeymaps (fn []
                   (vim.api.nvim_buf_set_keymap 0 "t" "<esc>" "<c-\\><c-n>"
                                                {:noremap true :silent true}))})
