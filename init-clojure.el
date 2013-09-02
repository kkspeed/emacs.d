(add-to-list 'load-path "~/.emacs.d/site-lisp/clojure-mode")
(add-to-list 'load-path "~/.emacs.d/site-lisp/nrepl")

(require 'clojure-mode)

(defun setup-clojure-mode-paredit ()
  (define-key clojure-mode-map
    (kbd "{") 'paredit-open-curly)
  (define-key clojure-mode-map
    (kbd "}") 'paredit-close-curly)
  (modify-syntax-entry ?\{ "(}")
  (modify-syntax-entry ?\} "){")
  (modify-syntax-entry ?\[ "(]")
  (modify-syntax-entry ?\] ")["))

(add-hook 'clojure-mode-hook 'setup-clojure-mode-paredit)
(add-hook 'clojure-mode-hook (lambda () (paredit-mode +1)))

(require 'nrepl)
(add-hook 'nrepl-interaction-mode-hook
           'nrepl-turn-on-eldoc-mode)

(add-hook 'nrepl-interaction-mode-hook 'nrepl-turn-on-eldoc-mode)
(setq nrepl-popup-stacktraces nil)
(add-hook 'nrepl-mode-hook '(lambda () (paredit-mode +1)))

(add-to-list 'load-path "~/.emacs.d/site-lisp/ac-nrepl")
(require 'ac-nrepl)
(add-hook 'nrepl-mode-hook 'ac-nrepl-setup)
(add-hook 'nrepl-interaction-mode-hook 'ac-nrepl-setup)
(eval-after-load "auto-complete"
  '(add-to-list 'ac-modes 'nrepl-mode))

(provide 'init-clojure)
