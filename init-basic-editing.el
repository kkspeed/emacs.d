(defun vi-open-newline-below()
  (interactive)
  (end-of-line)
  (newline-and-indent))

(defun vi-open-newline-above()
  (interactive)
  (beginning-of-line)
  (newline-and-indent)
  (previous-line))

(global-set-key (kbd "C-o") 'vi-open-newline-below)
(global-set-key (kbd "M-o") 'vi-open-newline-above)

(require 'saveplace)
(setq-default save-place t)

(add-to-list 'load-path "~/.emacs.d/site-lisp/undo-tree")
(require 'undo-tree)
(global-undo-tree-mode)

(add-to-list 'load-path "~/.emacs.d/site-lisp/browse-kill-ring")
(require 'browse-kill-ring)
(global-set-key "\C-cy" 'browse-kill-ring)

(provide 'init-basic-editing)
