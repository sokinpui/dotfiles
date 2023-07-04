;;(add-to-list 'load-path "~/.config/emacs/elisp")
(provide 'use-package-config)

;; load package
(use-package smooth-scrolling)
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
  (evil-set-undo-system 'undo-redo)
  :config
  (evil-mode 1))

(use-package undo-tree
  :init
  (undo-tree-mode)
  (setq undo-tree-auto-save-history t)
  (setq undo-tree-history-directory-alist '(("." . "~/.config/emacs/undo"))))

(use-package fzf
  :bind
    ;; Don't forget to set keybinds!
  :config
  (setq fzf/args "-x --color bw --print-query --margin=1,0 --no-hscroll"
        fzf/executable "fzf"
        fzf/git-grep-args "-i --line-number %s"
        fzf/grep-command "rg --ignore --hidden"
        fzf/position-bottom t
        fzf/window-height 15))

(use-package good-scroll
  :ensure t
  :init (good-scroll-mode))

;;(use-package auto-complete
;;  :config
;;  (ac-config-default))

(use-package counsel
  :ensure t)

(use-package ivy
  :ensure t
  :init
  (ivy-mode 1)
  (counsel-mode 1)
  :config
  (setq ivy-use-virtual-buffers t)
  (setq enable-recursive-minibuffers t)
  (setq search-default-mode #'char-fold-to-regexp)
  (setq ivy-count-format "(%d/%d) "))

(use-package lsp-mode
  :ensure t
  :init
  :hook 
  ((c++-mode python-mode java-mode js-mode) . lsp-deferred)
  :commands (lsp lsp-deferred)
  :config
  (setq lsp-completion-provider :none) ;; 阻止 lsp 重新设置 company-backend 而覆盖我们 yasnippet 的设置
  (setq lsp-headerline-breadcrumb-enable t))

(use-package lsp-ui
  :ensure t
  :config
  (define-key lsp-ui-mode-map [remap xref-find-definitions] #'lsp-ui-peek-find-definitions)
  (define-key lsp-ui-mode-map [remap xref-find-references] #'lsp-ui-peek-find-references)
  (setq lsp-ui-doc-position 'top))

(use-package lsp-ivy
  :ensure t
  :after (lsp-mode))

(use-package company
  :ensure t
  :config
  (setq company-idle-delay 0.0
        company-minimum-prefix-length 1
        company-tooltip-limit 20
        company-tooltip-align-annotations t
        company-tooltip-flip-when-above t
        company-show-numbers t
        company-dabbrev-downcase nil
        company-require-match nil
        company-dabbrev-ignore-case t)
  (setq company-backends '(company-dabbrev))
  :hook (after-init . global-company-mode))

;; Modify company so that tab and S-tab cycle through completions without
;; needing to hit enter.
(require 'company-complete-cycle)

;;(use-package company-box
;;  :ensure t
;;  :if window-system
;;  :hook (company-mode . company-box-mode))
