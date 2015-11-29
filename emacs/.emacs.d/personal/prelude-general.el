;; UTF-8 Encoding
(set-language-environment 'utf-8)
(set-default-coding-systems 'utf-8)
(setq locale-coding-system 'utf-8)
(set-terminal-coding-system 'utf-8)
(set-keyboard-coding-system 'utf-8)
(set-selection-coding-system 'utf-8)
(prefer-coding-system 'utf-8)

(setq initial-major-mode 'lisp-interaction-mode
      redisplay-dont-pause t
      column-number-mode t
      echo-keystrokes 0.02
      inhibit-startup-message t
      transient-mark-mode t
      shift-select-mode nil
      require-final-newline t
      truncate-partial-width-windows nil
      delete-by-moving-to-trash nil
      confirm-nonexistent-file-or-buffer nil
      query-replace-highlight t
      next-error-highlight t
      next-error-highlight-no-select t
      initial-scratch-message nil)

;; enable cua-mode for rectangular selections
(require 'cua-base)
(require 'cua-gmrk)
(require 'cua-rect)
(cua-mode 1)
(setq cua-enable-cua-keys nil)

;; OS X specific configuration
(setq default-input-method "MacOSX")

;; Make cut and paste work with the OS X clipboard
;; stolen from Emacs Live
(defun live-copy-from-osx ()
  (shell-command-to-string "pbpaste"))

(defun live-paste-to-osx (text &optional push)
  (let ((process-connection-type nil))
    (let ((proc (start-process "pbcopy" "*Messages*" "pbcopy")))
      (process-send-string proc text)
      (process-send-eof proc))))

(when (not window-system)
  (setq interprogram-cut-function 'live-paste-to-osx)
  (setq interprogram-paste-function 'live-copy-from-osx))

;; Work around a bug on OS X where system-name is a FQDN
(setq system-name (car (split-string system-name "\\.")))

;; Spelling
(use-package flyspell-mode
  :diminish (flyspell-mode " FSp")
  :config
  (progn
    (setq flyspell-issue-welcome-flag nil)
    (setq-default ispell-program-name "/usr/local/bin/aspell")
    (setq-default ispell-list-command "list")))

;; Window management (ace-window)
(use-package ace-jump-buffer
  :bind
  ("C-c J" . ace-jump-buffer))

(use-package ace-window
  :defer t
  :config (setq aw-keys '(?a ?s ?d ?f ?g ?h ?j ?k ?l))
  :bind ("C-c H" . ace-window))

(use-package ace-isearch
  :defer t
  :config
  (global-ace-isearch-mode 1))

(use-package ace-jump-zap
  :defer t
  :bind
  (("M-z" . ace-jump-zap-up-to-char-dwim)
   ("M-Z" . ace-jump-zap-to-char-dwim)))


;; Enable arrow keys
(defun disable-guru-mode ()
  (guru-mode -1))

(add-hook 'prelude-prog-mode-hook 'disable-guru-mode t)

;; File handling
(setq backup-directory-alist
      '(("." . "~/.emacs.backups")))

(provide 'personal/prelude-general)
