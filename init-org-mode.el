(add-to-list 'load-path "~/.emacs.d/site-lisp/org-mode/lisp/")
(add-to-list 'load-path "~/.emacs.d/site-lisp/org-mode/contrib/lisp/")

(require 'org-install)
(setq org-latex-to-pdf-process
  '("xelatex -interaction nonstopmode %f"
     "xelatex -interaction nonstopmode %f"))
(add-hook 'org-mode-hook
		  '(lambda ()
			(org-babel-do-load-languages 'org-babel-load-languages
			 '((emacs-lisp . t) (lisp . t) (gnuplot . t) (octave . t)))
            (setq org-src-fontify-natively t)))

(require 'org-table)
(define-key orgtbl-mode-map (kbd "C-c t") 'orgtbl-insert-radio-table)

(provide 'init-org-mode)
