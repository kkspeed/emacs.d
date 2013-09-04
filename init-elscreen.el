(add-to-list 'load-path "~/.emacs.d/site-lisp/elscreen")
(setq elscreen-prefix-key "")
(add-to-list 'load-path "~/.emacs.d/elscreen")
(load "elscreen" "Elscreen")
(setq elscreen-buffer-list-enabled t)
(require 'elscreen-buffer-list)
(global-set-key (kbd "<f9>") 'elscreen-create)
(global-set-key (kbd "S-<f9>") 'elscreen-kill)

(setq elscreen-display-tab nil)
(setq elscreen-tab-display-control nil)

(provide 'init-elscreen)
