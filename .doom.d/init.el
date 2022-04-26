;;; init.el -*- lexical-binding: t; -*-

(doom! :completion
       company
       ivy

       :ui
       deft
       doom
       doom-dashboard
       doom-quit
       (emoji +unicode)
       hl-todo
       modeline
       ophints
       (popup +defaults)
       treemacs
       vc-gutter
       vi-tilde-fringe
       workspaces
       zen

       :editor
       (evil +everywhere)
       file-templates
       fold
       (format +onsave)
       multiple-cursors
       snippets
       word-wrap

       :emacs
       dired
       electric
       undo
       vc

       :term
       vterm

       :checkers
       syntax

       :tools
       biblio
       docker
       (eval +overlay)
       lookup
       lsp
       magit
       make
       terraform

       :os
       (:if IS-MAC macos)

       :lang
       cc
       (clojure +lsp)
       common-lisp
       data
       emacs-lisp
       (go +lsp)
       (haskell +dante)
       json
       javascript
       latex
       markdown
       (org +roam2
            +dragndrop
            +present
            +pomodoro)
       racket
       scheme
       sh
       web
       yaml

       :config
       literate
       (default +bindings +smartparens))
