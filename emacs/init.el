(setq frame-resize-pixelwise t)

;; Initialize mepla repo
(require 'package)
(setq package-archives '(("gnu" . "http://elpa.gnu.org/packages/")
                         ("org" . "http://orgmode.org/elpa/")
                         ("marmalade" . "http://marmalade-repo.org/packages/")
                         ("melpa-stable" . "http://melpa-stable.milkbox.net/packages/")))
(package-initialize)

;; install use-package if missing
(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))
(eval-and-compile
  (setq use-package-always-ensure t
        use-package-expand-minimally t))

;; use-package
(eval-when-compile
  ;; Following line is not needed if use-package.el is in ~/.emacs.d
  (add-to-list 'load-path "~/.config/emacs/elpa/")
  (require 'use-package))

(setq-default auto-fill-function 'do-auto-fill)


;; load modualized file.
(add-to-list 'load-path "~/.config/emacs/elisp")
(require 'evil-mappings)
(require 'use-package-config)
(require 'settings)

;; Appearance
(add-to-list 'custom-theme-load-path "~/.config/emacs/elisp")
(load-theme 'atom-one-dark t)

;; font
(set-face-attribute 'default nil :font "JetBrains Mono-12" :weight 'SemiBold)
(set-face-attribute 'bold nil :weight 'ExtraBold)
(set-face-attribute 'bold-italic nil :weight 'ExtraBold :slant 'italic)


(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(initial-frame-alist '((fullscreen . maximized)))
 '(package-selected-packages
   '(## fzf undo-tree use-package evil-search-highlight-persist evil-leader smooth-scrolling lsp-mode evil))
 '(warning-suppress-types
   '(((defvaralias losing-value save-place))
     ((defvaralias losing-value save-place))
     ((defvaralias losing-value save-place))
     ((defvaralias losing-value save-place))
     (comp)
     (comp)
     (comp)
     (comp)
     (comp)
     (comp)
     (comp))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
