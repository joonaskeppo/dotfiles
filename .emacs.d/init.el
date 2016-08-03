(require 'package)
(setq package-list '(evil evil-escape better-defaults))
(add-to-list 'package-archives '("melpa" . "http://melpa.org/packages/"))
(package-initialize)
(unless package-archive-contents
  (package-refresh-contents))
(dolist (package package-list)
  (unless (package-installed-p package)
    (package-install package)))

(add-to-list 'custom-theme-load-path "~/.emacs.d/themes")
(load-theme 'gruvbox t)

;; EVIL MODE
;; ~~~~~~~~~

(require 'evil)
(evil-mode 1)
(setq evil-move-cursor-back nil)

(require 'evil-escape)
(global-set-key (kbd "C-g") 'evil-escape)

;; ~~~~~~~~~

(add-hook 'before-save-hook
          'delete-trailing-whitespace)

(setq inhibit-startup-screen t)
(global-linum-mode t)
(cond
 ((find-font (font-spec :name "Monoid"))
  (set-face-attribute 'default nil
                        :family "Monoid"
                        :height 90
                        :weight 'normal
                        :width 'normal))
 ((find-font (font-spec :name "Ubuntu Mono"))
  (set-face-attribute 'default nil
                        :family "Ubuntu Mono"
                        :height 90
                        :weight 'normal
                        :width 'normal)))

;; Tabs -> 2 spaces (+ manual tabbing)
(setq c-basic-indent 2)
(setq tab-width 2)
(setq indent-tabs-mode nil)

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
