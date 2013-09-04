(add-to-list 'load-path "~/.emacs.d/site-lisp/auto-complete")

(require 'auto-complete-config)
(ac-config-default)

(add-to-list 'ac-dictionary-directories "~/.emacs.d/site-lisp/auto-complete/ac-dict")
(global-set-key "\M-/" 'auto-complete)

(setq ac-use-menu-map t)

(define-key ac-menu-map "\C-n" 'ac-next)
(define-key ac-menu-map "\C-p" 'ac-previous)

(add-to-list 'load-path "~/.emacs.d/ac-sources")
(provide 'init-auto-complete)
