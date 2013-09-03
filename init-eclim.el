(add-to-list 'load-path "~/.emacs.d/site-lisp/emacs-eclim")
(require 'eclim)
(require 'ac-emacs-eclim-source)
(global-eclim-mode)
(ac-emacs-eclim-config)

(provide 'init-eclim)
