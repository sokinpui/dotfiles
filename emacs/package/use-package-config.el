(provide 'use-package-config)

;; load package
(use-package smooth-scrolling)
(use-package lsp-mode)
(use-package smex)
(use-package markdown-mode)
(use-package evil)
(use-package evil-leader)
(use-package evil-search-highlight-persist)

(use-package evil
  :demand t
  :bind (("<escape>" . keyboard-escape-quit))
  :init
  ;; allows for using cgn
  ;; (setq evil-search-module 'evil-search)
  (setq evil-want-keybinding nil)
  ;; no vim insert bindings
  (setq evil-undo-system 'undo-fu)
  :config
  (evil-mode 1))
