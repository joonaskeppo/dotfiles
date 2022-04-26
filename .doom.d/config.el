;;; $DOOMDIR/config.el -*- lexical-binding: t; -*-

;; --- base configurations ---

(setq user-full-name "Joonas Keppo"
      user-mail-address "joonaskeppo@gmail.com")

(setq doom-font (font-spec :family "Fira Code" :style "Retina" :size 15)
      doom-variable-pitch-font (font-spec :family "Menlo" :size 13))

(setq doom-theme 'doom-nord)

;; start with maximized window
(add-to-list 'default-frame-alist '(fullscreen . maximized))

(setq display-line-numbers-type 'relative)
(setq-default line-spacing 0.2)

(setq doom-localleader-key ",")

;; --- formatting ---

;; (setq-hook! 'web-mode-hook +format-with 'prettier-prettify)

(setq +format-on-save-enabled-modes
      '(not web-mode))

;; --- editing ---

(add-hook! 'smartparens-enabled-hook #'evil-cleverparens-mode)
(setq evil-move-beyond-eol t) ;; https://github.com/luxbock/evil-cleverparens/issues/29

(require 'evil-multiedit)
;(evil-multiedit-default-keybindings)

;; --- treemacs ---

(map! :map global-map "C-x t t" #'treemacs)

;; --- org ---

(require 'org-habit)
(require 'ox-publish)

(setq org-directory "~/org/"
      org-roam-directory "~/org/roam/"
      org-publish-project-alist
      '(("org-notes"
         :base-directory "~/org/roam/"
         :base-extension "org"
         :publishing-directory "~/org/roam/build/"
         :recursive t
         :publishing-function org-html-publish-to-html)))

(defun publish-notes ()
  "Publish all org-roam notes"
  (interactive)
  (shell-command "rm ~/org/roam/build/**/*.html")
  (org-publish "org-notes" t))

(setq org-babel-clojure-backend 'cider)

;; ** org-roam workflow stuff **
;;
;; adapted from org-roam creator's excellent article on his personal org-roam workflow
;; (mimicking Luhmann's original workflow):
;; https://jethrokuan.github.io/org-roam-guide/
;;
;; the specific workflow combines Jethro's workflow with David Kadavy's,
;; as detailed in his book, Digital Zettelkasten.
;;
;; the org-roam directory structure will look like this:
;;
;; .
;; ├── articles
;; ├── permanent
;; ├── literature
;; ├── raw
;; ├── maybe
;; ├── inbox.org
;; └── refs.bib
;;
;; where:
;; - each folder is a "slipbox",
;; - `inbox.org' is an "inbox" of as-yet unprocessed thoughts and ideas, and
;; - `refs.bib' contains all bibtex references, exported and sync'd automagically using Better BibTeX + Zotero.

(setq org-roam-capture-templates
      '(;; permanent notes -- notes by yours truly, in my own words, synthesizing previous notes on a single topic
        ("p" "permanent" plain "%?"
         :if-new (file+head "permanent/${slug}.org"
                            "#+title: ${title}\n#+filetags: :permanent:\n")
         :immediate-finish t
         :unnarrowed t)
        ;; literature notes -- notes from various media in my own words
        ("l" "literature" plain "%?"
         :if-new
         (file+head "literature/${title}.org"
                    "#+title: ${title}\n#+filetags: :literature:\n")
         :immediate-finish t
         :unnarrowed t)
        ;; articles -- articles generated principally from permanent notes
        ("a" "article" plain "%?"
         :if-new
         (file+head "articles/${title}.org"
                    "#+title: ${title}\n#+filetags: :article:\n")
         :immediate-finish t
         :unnarrowed t)
        ;; raw notes -- exported highlights from various media; for those cases where literature notes don't contain exact quotes or highlights
        ("r" "raw" plain "%?"
         :if-new
         (file+head "raw/${title}.org"
                    "#+title: ${title}\n#+filetags: :raw:\n")
         :immediate-finish t
         :unnarrowed t)
        ;; "someday/maybe" -- things that are interesting, but irrelevant to current areas of focus
        ("m" "maybe" plain "%?"
         :if-new
         (file+head "maybe/${title}.org"
                    "#+title: ${title}\n#+filetags: :maybe:\n")
         :immediate-finish t
         :unnarrowed t)))

(cl-defmethod org-roam-node-type ((node org-roam-node))
  "Return the TYPE of NODE."
  (condition-case nil
      (file-name-nondirectory
       (directory-file-name
        (file-name-directory
         (file-relative-name (org-roam-node-file node) org-roam-directory))))
    (error "")))

(setq org-roam-node-display-template
      (concat "${type:15} ${title:*} "
              (propertize "${tags:10}" 'face 'org-tag)))

(setq org-capture-templates
      (add-to-list 'org-capture-templates
                   `("s" "Slipbox" entry (file ,(concat org-roam-directory "inbox.org"))
                     "* %?\n")))

(defun org-roam-capture-inbox ()
  (interactive)
  (org-capture nil "s"))

;; creating literature notes
(defun org-roam-node-from-cite (keys-entries)
    (interactive (list (citar-select-ref :multiple nil :rebuild-cache t)))
    (let ((title (citar--format-entry-no-widths (cdr keys-entries)
                                                "${author editor} :: ${title}")))
      (org-roam-capture- :templates
                         '(("l" "literature" plain "%?" :if-new
                            (file+head "literature/${citekey}.org"
                                       ":PROPERTIES:
:ROAM_REFS: [cite:@${citekey}]
:END:
#+title: ${title}\n#+filetags: :literature:\n")
                            :immediate-finish t
                            :unnarrowed t))
                         :info (list :citekey (car keys-entries))
                         :node (org-roam-node-create :title title)
                         :props '(:finalize find-file))))

(defun org-roam-tag-node-as-draft ()
  (org-roam-tag-add '("draft")))

;; make sure all new zettels are marked with tag `draft'
(add-hook 'org-roam-capture-new-node-hook #'org-roam-tag-node-as-draft)

;; publishing org-roam notes into HTML
(require 'ox-publish)


;; bibtex completion via `biblio' module:
;; https://github.com/hlissner/doom-emacs/tree/master/modules/tools/biblio#path-configuration
(after! org-cite
  (setq! bibtex-completion-bibliography
         (list (concat org-roam-directory "refs.org"))))

;; --- misc ---

(setq +doom-dashboard-banner-file (expand-file-name "emacs-e.svg" doom-private-dir))

;; --- clojure ---

;; Leverage an existing cider nrepl connection to evaluate portal.api functions
;; and map them to convenient key bindings.

(defun portal.api/open ()
  (interactive)
  (cider-nrepl-sync-request:eval
   "(require 'portal.api) (portal.api/tap) (portal.api/open)"))

(defun portal.api/clear ()
  (interactive)
  (cider-nrepl-sync-request:eval "(portal.api/clear)"))

(defun portal.api/close ()
  (interactive)
  (cider-nrepl-sync-request:eval "(portal.api/close)"))

;; Example key mappings for doom emacs
(map! :map clojure-mode-map
      ;; cmd  + o
      :n "s-o" #'portal.api/open
      ;; ctrl + l
      :n "C-l" #'portal.api/clear)
