(require 'slime)

(defun anything-slime-default-action (elm)
  "Insert completion at point."
  (let ((initial-pattern (anything-slime-get-initial-pattern)))
    (delete-char (- (length initial-pattern)))
    (insert elm)))

(defvar anything-source-slime
  '((name . "Slime completion")
    (candidates . (lambda ()
					(let ((prefix (anything-slime-get-initial-pattern)))
					  (car (slime-simple-completions prefix)))))
    (action . anything-slime-default-action)
    (volatile)
    (requires-pattern . 2)))


(defun anything-slime-get-initial-pattern ()
  "Get the pattern to complete from."
  (let* ((end (point))
		 (beg (slime-symbol-start-pos))
		 (prefix (buffer-substring-no-properties beg end)))
    (buffer-substring-no-properties beg end)))

(defun anything-slime-complete ()
  "Preconfigured anything for ipython completions."
  (interactive)
  (delete-other-windows)
  (let ((initial-pattern (anything-slime-get-initial-pattern)))
    (anything 'anything-source-slime initial-pattern)))

(provide 'anything-slime)
