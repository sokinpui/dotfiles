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

;; line wrapping
;(add-hook 'text-mode-hook 'visual-line-mode)
(visual-line-mode 1)
(global-visual-line-mode t)
(setq-default word-wrap t)
(auto-fill-mode -1)

(global-display-line-numbers-mode)
(setq display-line-numbers-type 'relative)

;; backup and swap file under /tmp
(setq make-backup-files nil)
(setq backup-directory-alist
      `((".*" . ,temporary-file-directory)))
(setq auto-save-file-name-transforms
      `((".*" ,temporary-file-directory t)))

;; remember last cursor postion
(save-place-mode 1)

;; Smooth scrolling
(setq scroll-margin 5
      scroll-conservatively 9999
      scroll-step 1)

;; Indentaion
(setq-default tab-width 4 indent-tabs-mode nil)
(setq-default c-basic-offset 4 c-default-style "bsd")

;; disable message buffer
(setq-default message-log-max nil)
(kill-buffer "*Messages*")
