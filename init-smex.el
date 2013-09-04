(add-to-list 'load-path "~/.emacs.d/site-lisp/smex")
(require 'smex)

(global-set-key [(meta x)]
                (lambda ()
                  (interactive)
                  (or (boundp 'smex-cache)
                      (smex-initialize))
                  (global-set-key [(meta x)] 'smex)
                  (smex)))

(global-set-key [(shift meta x)]
                (lambda ()
                  (interactive)
                  (or (boundp 'smex-cache)
                      (smex-initialize))
                  (global-set-key [(shift meta x)]
                                  'smex-major-mode-commands)
                  (smex-major-mode-commands)))
(provide 'init-smex)
