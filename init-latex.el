(add-to-list 'load-path "~/.emacs.d/site-lisp/auctex")
(add-to-list 'load-path "~/.emacs.d/site-lisp/auctex/preview")
(load "auctex.el" nil t t)
(load "preview-latex.el" nil t t)

(setq TeX-engine "xetex")
(setq LaTeX-command "xelatex")

(require 'reftex)
(add-hook 'LaTeX-mode-hook 'turn-on-reftex)

(require 'auto-complete-auctex)
(require 'ac-math)

(add-to-list 'ac-modes 'latex-mode) 
(defun ac-latex-mode-setup ()       
  (setq ac-sources
     (append '(ac-source-math-latex ac-source-latex-commands) ac-sources)))

(add-hook 'LaTeX-mode-hook 'ac-latex-mode-setup)
(add-hook 'LaTeX-mode-hook 'ac-flyspell-workaround)

(add-hook 'LaTeX-mode-hook 'LaTeX-math-mode)
(add-hook 'LaTeX-mode-hook 'auto-fill-mode)

(provide 'init-latex)
