(add-to-list 'load-path "~/.emacs.d/site-lisp/auctex")
(add-to-list 'load-path "~/.emacs.d/site-lisp/auctex/preview")
(load "auctex.el" nil t t)
(load "preview-latex.el" nil t t)

(setq TeX-engine "xetex")
(setq LaTeX-command "xelatex")

(provide 'init-auctex)
