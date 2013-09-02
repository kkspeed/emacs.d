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

(provide 'init-basic-editing)
