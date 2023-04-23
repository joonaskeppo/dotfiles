(module joonas.plugin.autopairs
  {autoload {npairs nvim-autopairs
             cmp-autopairs nvim-autopairs.completion.cmp
             cmp cmp}})

(npairs.setup
  {:check_ts true
   :ts_config {:lua ["string"] ; it will not add a pair on that treesitter node
               :javascript ["template_string"]}
   :disable_filetype ["TelescopePrompt" "clojure"]
   :enable_check_bracket_line false})

(cmp.event:on "confirm_done" cmp-autopairs.on_confirm_done {:map_char {:tex ""}})

