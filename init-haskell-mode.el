(add-to-list 'load-path "~/.emacs.d/site-lisp/haskell-mode")
(require 'haskell-mode-autoloads)
; (add-to-list 'Info-default-directory-list "~/lib/emacs/haskell-mode/")

(add-hook 'haskell-mode-hook 'turn-on-haskell-doc-mode)
(add-hook 'haskell-mode-hook 'turn-on-haskell-indent)

(define-key haskell-mode-map (kbd "C-,") 'haskell-move-nested-left)
(define-key haskell-mode-map (kbd "C-.") 'haskell-move-nested-right)

(setq haskell-font-lock-symbols t)
(provide 'init-haskell-mode)
