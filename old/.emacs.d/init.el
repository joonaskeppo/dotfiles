(require 'package)
(setq package-list '(evil
                     evil-escape
                     better-defaults
                     clojure-mode
                     clojure-mode-extra-font-locking
                     ido-ubiquitous
                     smex
                     projectile
                     paredit
                     tagedit
                     magit
                     cider
                     cider-eval-sexp-fu
                     rainbow-delimiters))

;; Copy env vars from Mac shell
(if (eq system-type 'darwin)
    (add-to-list 'package-list 'exec-path-from-shell))

(add-to-list 'package-archives
             '("marmalade" . "http://marmalade-repo.org/packages/") t)
(add-to-list 'package-archives
             '("tromey" . "http://tromey.com/elpa/") t)
(add-to-list 'package-archives
             '("melpa" . "http://melpa.milkbox.net/packages/") t)
(add-to-list 'package-archives
             '("melpa-stable" . "https://stable.melpa.org/packages/") t)

(package-initialize)
(unless package-archive-contents
  (package-refresh-contents))
(dolist (package package-list)
  (unless (package-installed-p package)
    (package-install package)))

(add-to-list 'custom-theme-load-path "~/.emacs.d/themes")
(load-theme 'gruvbox t)

;; Rainbow delimiters in most programming modes
(add-hook 'prog-mode-hook #'rainbow-delimiters-mode)

;; Set up exec-path-from-shell
(when (memq window-system '(mac ns))
  (exec-path-from-shell-initialize)
  (exec-path-from-shell-copy-envs
'("PATH")))

;; No trailing whitespaces, pls
(add-hook 'before-save-hook
          'delete-trailing-whitespace)

;; Source: https://www.emacswiki.org/emacs/EndOfLineTips
(add-hook 'find-file-hook 'find-file-check-line-endings)
(defun dos-file-endings-p ()
     (string-match "dos" (symbol-name buffer-file-coding-system)))
(defun find-file-check-line-endings ()
     (when (dos-file-endings-p)
         (set-buffer-file-coding-system 'undecided-unix)
         (set-buffer-modified-p nil)))

;; Don't create lockfiles when editing
(setq create-lockfiles nil)
;; Start with scratch buffer
(setq inhibit-startup-screen t)
;; Line numbers
(global-linum-mode t)

(cond
 ((find-font (font-spec :name "Monoid"))
  (set-face-attribute 'default nil
                        :family "Monoid"
                        :height 100
                        :weight 'normal
                        :width 'normal))
 ((find-font (font-spec :name "Ubuntu Mono"))
  (set-face-attribute 'default nil
                        :family "Ubuntu Mono"
                        :height 100
                        :weight 'normal
                        :width 'normal)))

;; Fix indentation
(setq indent-tabs-mode nil)
(setq sh-basic-offset 2)
(setq sh-indentation 2)

;; Backup files to ~/.emacs.d/backups
(setq backup-directory-alist `(("." . , (concat user-emacs-directory "backups"))))

;; yes/no --> y/n
(fset 'yes-or-no-p 'y-or-n-p)

;; Full screening (adapted from http://emacswiki.org/emacs/FullScreen)
(defun fullscreen-view ()
  (interactive)
  (set-frame-parameter nil 'fullscreen 'fullboth))
(defun windowed-view ()
  (interactive)
  (set-frame-parameter nil 'width 90)
  (set-frame-parameter nil 'fullscreen 'fullheight))
(defun toggle-fullscreen ()
  (interactive)
  (if (eq (frame-parameter nil 'fullscreen) 'fullboth)
      (windowed-view)
    (fullscreen-view)))
(global-set-key (kbd "<f11>") 'toggle-fullscreen)

;; Fixes terminal bell issue on Mac
(setq ring-bell-function 'ignore)

;; Hack to fix OS X clipboard usage
;; Source: https://gist.github.com/the-kenny/267162
(defun copy-from-osx ()
    (shell-command-to-string "pbpaste"))
(defun paste-to-osx (text &optional push)
    (let ((process-connection-type nil))
        (let ((proc (start-process "pbcopy" "*Messages*" "pbcopy")))
            (process-send-string proc text)
            (process-send-eof proc))))
(setq interprogram-cut-function 'paste-to-osx)
(setq interprogram-paste-function 'copy-from-osx)

;; ~~~~~~~~~
;; Evil mode
;; ~~~~~~~~~

(require 'evil)
(require 'evil-escape)

(evil-mode 1)
(setq evil-move-cursor-back nil)
(global-set-key (kbd "C-g") 'evil-escape)

;; ~~~~~~~~~
;; Clojure
;; ~~~~~~~~~

(require 'cider-eval-sexp-fu)
(require 'clojure-mode-extra-font-locking)
(setq cider-overlays-use-font-lock t
      cider-prompt-save-file-on-load nil
      cider-repl-pop-to-buffer-on-connect t
      cider-repl-use-clojure-font-lock t)

(add-hook 'clojure-mode-hook 'enable-paredit-mode)
(add-hook 'clojure-mode-hook
  (function (lambda ()
    (setq evil-shift-width 2))))
