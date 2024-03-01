(module joonas.plugin.paredit
  {autoload {nvim aniseed.nvim
             paredit nvim-paredit
             indentation nvim-paredit.indentation.native
             scheme nvim-paredit-scheme
             fennel nvim-paredit-fennel
             lisp   joonas.lisp}})

(paredit.setup
  {; should plugin use default keybindings? (default = true)
   :use_default_keys true
   ; sometimes user wants to restrict plugin to certain file types only
   ; defaults to all supported file types including custom lang
   ; extensions (see next section)
   :filetypes lisp.filetypes
   ; This controls where the cursor is placed when performing slurp/barf operations
   ;
   ; - "remain" - It will never change the cursor position, keeping it in the same place
   ; - "follow" - It will always place the cursor on the form edge that was moved
   ; - "auto"   - A combination of remain and follow, it will try keep the cursor in the original position
   ;              unless doing so would result in the cursor no longer being within the original form. In
   ;              this case it will place the cursor on the moved edge
   :cursor_behaviour "auto" ;; remain, follow, auto
   :indent {
    ; This controls how nvim-paredit handles indentation when performing operations which
    ; should change the indentation of the form (such as when slurping or barfing).
    ;
    ; When set to true then it will attempt to fix the indentation of nodes operated on.
    :enabled true
    ; A function that will be called after a slurp/barf if you want to provide a custom indentation
    ; implementation.
    :indentor indentation.indentor}
    :keys
    {"<localleader>@"   [paredit.unwrap.unwrap_form_under_cursor "Splice sexp"]
     ">)"               [paredit.api.slurp_forwards "Slurp forwards"]
     ">("               [paredit.api.barf_backwards "Barf backwards"]
     "<)"               [paredit.api.barf_forwards "Barf forwards"]
     "<("               [paredit.api.slurp_backwards "Slurp backwards"]
     ">e"               [paredit.api.drag_element_forwards "Drag element right"]
     "<e"               [paredit.api.drag_element_backwards "Drag element left"]
     ">f"               [paredit.api.drag_form_forwards "Drag form right"]
     "<f"               [paredit.api.drag_form_backwards "Drag form left"]
     "<localleader>o"   [paredit.api.raise_form "Raise form"]
     "<localleader>O"   [paredit.api.raise_element "Raise element"]
     "E"                {1 paredit.api.move_to_next_element_tail
                         2 "Jump to next element tail"
                         ; by default all keybindings are dot repeatable
                         :repeatable false
                         :mode ["n" "x" "o" "v"]}
     "W"                {1 paredit.api.move_to_next_element_head
                         2 "Jump to next element head"
                         :repeatable false
                         :mode ["n" "x" "o" "v"]}
     "B"                {1 paredit.api.move_to_prev_element_head
                         2 "Jump to previous element head"
                         :repeatable false
                         :mode ["n" "x" "o" "v"]}
     "gE"               {1 paredit.api.move_to_prev_element_tail
                         2 "Jump to previous element tail"
                         :repeatable false
                         :mode ["n" "x" "o" "v"]}
     "("                {1 paredit.api.move_to_parent_form_start
                         2 "Jump to parent form's head"
                         :repeatable false
                         :mode ["n" "x" "v"]}
     ")"                {1 paredit.api.move_to_parent_form_end
                         2 "Jump to parent form's tail"
                         :repeatable false
                         :mode ["n" "x" "v"]}
     ; These are text o bject selection keybindings which can used with standard `d, y, c`, `v`
     "af"               {1 paredit.api.select_around_form
                         2 "Around form"
                         :repeatable false
                         :mode ["o" "v"]}
     "if"               {1 paredit.api.select_in_form
                         2 "In form"
                         :repeatable false
                         :mode ["o" "v"]}
     "aF"               {1 paredit.api.select_around_top_level_form
                         2 "Around top level form"
                         :repeatable false
                         :mode ["o" "v"]}
     "iF"               {1 paredit.api.select_in_top_level_form
                         2 "In top level form"
                         :repeatable false
                         :mode ["o" "v"]}
     "ae"               {1 paredit.api.select_element
                         2 "Around element"
                         :repeatable false
                         :mode ["o" "v"]}
     "ie"               {1 paredit.api.select_element
                         2 "Element"
                         :repeatable false
                         :mode ["o" "v"]}
     ; https://github.com/julienvincent/nvim-paredit?tab=readme-ov-file#vim-sexp-wrap-form-headtail-replication
     "<localleader>w"   [(fn []
                           ; place cursor and set mode to `insert`
                           (paredit.cursor.place_cursor
                             ; wrap element under cursor with `( ` and `)`
                             (paredit.wrap.wrap_element_under_cursor "(" ")")
                             ; cursor placement opts
                             {:placement "inner_start" :mode "insert"}))
                         "Wrap element insert head"]
     "<localleader>W"   [(fn []
                           (paredit.cursor.place_cursor
                             (paredit.wrap.wrap_element_under_cursor "(" ")")
                             {:placement "inner_end" :mode "insert"}))
                         "Wrap element insert tail"]
     ; same as above but for enclosing form
     "<localleader>i"   [(fn []
                           (paredit.cursor.place_cursor
                             (paredit.wrap.wrap_enclosing_form_under_cursor "(" ")")
                             {:placement "inner_start" :mode "insert"}))
                         "Wrap form insert head"]
     "<localleader>I"   [(fn []
                           (paredit.cursor.place_cursor
                             (paredit.wrap.wrap_enclosing_form_under_cursor "(" ")")
                             {:placement "inner_end" :mode "insert"}))
                         "Wrap form insert tail"]}})

;; Setting up extension plugins
(scheme.setup paredit)
(fennel.setup)
