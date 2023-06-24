;; Define the leader key
(global-evil-leader-mode)

;; visual mode movement
(define-key evil-normal-state-map (kbd "j") 'evil-next-visual-line)
(define-key evil-normal-state-map (kbd "k") 'evil-previous-visual-line)
(define-key evil-normal-state-map (kbd "0") 'beginning-of-visual-line)

(defun evil-jump-to-first-non-blank ()
  "Jump to the first non-blank character of the visual line."
  (interactive)
  (evil-beginning-of-visual-line)
  (evil-first-non-blank))
(define-key evil-normal-state-map (kbd "^") 'evil-jump-to-first-non-blank)

;; esc quits
(defun minibuffer-keyboard-quit ()
  "Abort recursive edit.
In Delete Selection mode, if the mark is active, just deactivate it;
then it takes a second \\[keyboard-quit] to abort the minibuffer."
  (interactive)
  (if (and delete-selection-mode transient-mark-mode mark-active)
      (setq deactivate-mark  t)
    (when (get-buffer "*Completions*") (delete-windows-on "*Completions*"))
    (abort-recursive-edit)))
(define-key evil-normal-state-map [escape] 'keyboard-quit)
(define-key evil-visual-state-map [escape] 'keyboard-quit)
(define-key minibuffer-local-map [escape] 'minibuffer-keyboard-quit)
(define-key minibuffer-local-ns-map [escape] 'minibuffer-keyboard-quit)
(define-key minibuffer-local-completion-map [escape] 'minibuffer-keyboard-quit)
(define-key minibuffer-local-must-match-map [escape] 'minibuffer-keyboard-quit)
(define-key minibuffer-local-isearch-map [escape] 'minibuffer-keyboard-quit)
(global-set-key [escape] 'evil-exit-emacs-state)

(setq x-select-enable-clipboard nil)

(define-key global-map (kbd "RET") 'newline-and-indent)

;; copy and paste
(define-key evil-insert-state-map (kbd "C-v") 'clipboard-yank)
(define-key evil-visual-state-map (kbd "C-c") 'clipboard-kill-ring-save)

;; Buffer switch
(global-set-key (kbd "DEL") 'previous-buffer)
(define-key evil-normal-state-map (kbd "BS") 'next-buffer)
