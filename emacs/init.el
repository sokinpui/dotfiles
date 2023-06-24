(setq package-list '(smooth-scrolling
                     lsp-mode
                     smex
                     markdown-mode
                     evil
                     evil-leader
                     evil-search-highlight-persist))

;; Initialize package management
(require 'package)
(setq package-archives '(("gnu" . "http://elpa.gnu.org/packages/")
                         ("org" . "http://orgmode.org/elpa/")
                         ("marmalade" . "http://marmalade-repo.org/packages/")
                         ("melpa-stable" . "http://melpa-stable.milkbox.net/packages/")))
(package-initialize)

;; Install packages
(unless package-archive-contents
  (package-refresh-contents))
(dolist (package package-list)
  (unless (package-installed-p package)
    (package-install package)))

;; use-package
(eval-when-compile
  ;; Following line is not needed if use-package.el is in ~/.emacs.d
  (add-to-list 'load-path "~/.config/emacs")
  (require 'use-package))

;; Package Toggle
(require 'evil)
(evil-mode 1)
(require 'smooth-scrolling)
(smooth-scrolling-mode 1)
(require 'evil-search-highlight-persist)
(global-evil-search-highlight-persist -1)

;; theme
(add-to-list 'custom-theme-load-path "~/.config/emacs/atom-one-dark-theme/")
(load-theme 'atom-one-dark t)
;; font
(add-to-list 'default-frame-alist
             '(font . "JetBrains Mono-12:weight=SemiBold"))
(set-face-attribute 'bold nil :weight 'ExtraBold)
(set-face-attribute 'bold-italic nil :weight 'ExtraBold :slant 'italic)


(add-to-list 'default-frame-alist '(drag-internal-border . 1))
(add-to-list 'default-frame-alist '(internal-border-width . 5))
(setq-default auto-fill-function 'do-auto-fill)

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

;; Load modulade source
(defconst user-init-dir
  (cond ((boundp 'user-emacs-directory)
         user-emacs-directory)
        ((boundp 'user-init-directory)
         user-init-directory)
        (t "~/.config/emacs")))

(defun load-user-file (file)
  (interactive "f")
  "Load a file in current user's configuration directory"
  (load-file (expand-file-name file user-init-dir)))

(load-user-file "evil.el")


(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(initial-frame-alist '((fullscreen . maximized)))
 '(package-selected-packages
   '(use-package evil-search-highlight-persist evil-leader smooth-scrolling lsp-mode evil))
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
