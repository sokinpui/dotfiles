(provide 'settings)

;; Basic setting
(menu-bar-mode -1)  ; Leave this one on if you're a beginner!
(tool-bar-mode -1)
(scroll-bar-mode -1)

(setq inhibit-startup-message t
      visible-bell nil
      markdown-fontify-code-blocks-natively t
      default-frame-alist '((undecorated . t))
      )

(global-visual-line-mode t)
(global-display-line-numbers-mode)

(setq display-line-numbers-type 'relative)
(setq make-backup-files nil)
(setq backup-directory-alist
      `((".*" . ,temporary-file-directory)))
(setq auto-save-file-name-transforms
      `((".*" ,temporary-file-directory t)))

;; remember last cursor postion
(setq save-place-file "~/.config/emacs/saveplace")
(setq-default save-place-mode t)
(require 'saveplace)

;; Smooth scrolling
(setq scroll-margin 5
      scroll-conservatively 9999
      scroll-step 1)

;; Indentaion
(setq-default tab-width 4 indent-tabs-mode nil)
(setq-default c-basic-offset 4 c-default-style "bsd")

;; highlight & syntax
