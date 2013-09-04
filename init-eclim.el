(add-to-list 'load-path "~/.emacs.d/site-lisp/emacs-eclim")
(require 'eclim)
(setq eclim-executable "~/.eclipse/99815505_linux_gtk_x86/eclim")

(global-eclim-mode)
(require 'ac-emacs-eclim-source)

(ac-emacs-eclim-config)

(provide 'init-eclim)
