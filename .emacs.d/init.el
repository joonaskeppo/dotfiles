(require 'package)
(setq package-list '(evil better-defaults))
(add-to-list 'package-archives '("melpa" . "http://melpa.org/packages/"))
(package-initialize)
(unless package-archive-contents
  (package-refresh-contents))
(dolist (package package-list)
  (unless (package-installed-p package)
    (package-install package)))

(add-to-list 'custom-theme-load-path "~/.emacs.d/themes")
(load-theme 'gruvbox t)

(require 'evil)
(evil-mode 1)

;; Start at *scratch* buffer
(setq inhibit-startup-screen t)
;; Global line numbers
(global-linum-mode t)

;; Full screening (adapted from http://emacswiki.org/emacs/FullScreen)
(defun fullscreen-view ()
  (interactive)
  (set-frame-parameter nil 'fullscreen 'fullboth)) ;this makes the frame go fullscreen
(defun windowed-view ()
  (interactive)
  (set-frame-parameter nil 'width 90)
  (set-frame-parameter nil 'fullscreen 'fullheight))
(defun toggle-fullscreen ()
  (interactive)
  (if (eq (frame-parameter nil 'fullscreen) 'fullboth)  ;tests if already fullscreened
      (windowed-view)
    (fullscreen-view)))
(global-set-key (kbd "<f11>") 'toggle-fullscreen)

;; Tabs -> 2 spaces
(setq tab-width 2)
(defvaralias 'c-basic-offset 'tab-width)

