;; No stupid menu bar or scroll bar
(menu-bar-mode -1)
;; (scroll-bar-mode -1)

;; Appearance
(disable-theme 'zenburn)
(load-theme 'cyberpunk t)

(require 'ansi-color)
(ansi-color-for-comint-mode-on)

;; Whitespace, Indentation
(setq-default tab-width 2)
(setq-default c-basic-offset 2)
(setq-default js2-basic-offset 2)
(setq-default js-indent-level 2)
(setq-default indent-tabs-mode nil) ;; spaces
(setq prelude-whitespace nil)

;; Highlights, Parens
(setq global-hl-line-mode nil)
(column-number-mode)
(setq visible-bell t)

;; Mode line
;;(setq sml/theme 'respectful) ;; dark | light | respectful | automatic
(setq sml/name-width 60)
(setq sml/mode-width 'full)
(setq sml/shorten-directory t) 
(setq sml/shorten-modes nil)

(sml/setup)

(sml/apply-theme 'dark)

;; Line numbers
(require 'linum)
(global-linum-mode 1)
(setq linum-format " %d ")

;; Enable pretty symbols in all languages
(global-prettify-symbols-mode +1)
