(add-to-list 'load-path "~/.emacs.d/site-lisp/paredit")
(require 'paredit)
(add-hook 'paredit-mode-hook '(lambda () (setq autopair-dont-activate t)))

(defadvice paredit-mode (around disable-autopairs-around (arg))
  "Disable autopairs mode if paredit-mode is turned on"
  ad-do-it
  (if (null ad-return-value)
	  (autopair-mode 1)
	(autopair-mode 0)))

(ad-activate 'paredit-mode)

(add-hook 'emacs-lisp-mode-hook       (lambda () (paredit-mode +1)))
(add-hook 'lisp-mode-hook             (lambda () (paredit-mode +1)))
(add-hook 'scheme-mode-hook           (lambda () (paredit-mode +1)))
(add-hook 'slime-repl-mode-hook (lambda ()
								  (paredit-mode +1)
								  (setq slime-complete-symbol-function
								     	'slime-fuzzy-complete-symbol)
								  (define-key slime-repl-mode-map
									  (kbd "M-s") 'paredit-splice-sexp)))

(provide 'init-paredit)
