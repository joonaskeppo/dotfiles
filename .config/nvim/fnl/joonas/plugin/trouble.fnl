(module joonas.plugin.trouble
  {autoload {nvim aniseed.nvim
             : trouble}})

(trouble.setup
  {:icons {:ident {:top "│ "
                   :middle "├╴"
                   :last "└╴"
                   :fold_open "⌄ "
                   :fold_closed "⌃ "
                   :ws "  "}}
   :auto_refresh false
   :focus true
   :follow true
   ; :indent_guides false ;; add an indent guide below the fold icons
   :win {:type "split"
         :relative "editor"
         :position "bottom"}})


