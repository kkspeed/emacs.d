(add-to-list 'load-path "~/.emacs.d/site-lisp/auto-complete")

(require 'auto-complete-config)
(ac-config-default)

(add-to-list 'ac-dictionary-directories "~/.emacs.d/site-lisp/auto-complete/ac-dict")
(global-set-key "\M-/" 'auto-complete)
(provide 'init-auto-complete)
