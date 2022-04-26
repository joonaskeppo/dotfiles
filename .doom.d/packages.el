;; -*- no-byte-compile: t; -*-
;;; $DOOMDIR/packages.el

(package! evil-snipe :disable t) ; messes with keybindings

(package! evil-cleverparens)

;; FIXME: delete when map.el fixed upstream (https://github.com/hlissner/doom-emacs/issues/5537)
(package! map :pin "bb50dbaafc0f71743bd9ffd5784258a9fd682c20")
;; FIXME: tempfix for issue with parseclj and shadow-cljs with cider-jack-in-cljs (https://github.com/hlissner/doom-emacs/issues/5561)
(package! parseclj :recipe (:build (:not compile)))
