(require 'ropemacs)

(defun anything-rope-default-action (elm)
  "Insert completion at point."
  (insert elm))

(setq anything-source-rope
  '((name . "rope completion")
    (candidates . rope-completions)
    (action . anything-rope-default-action)))

(defun anything-rope-complete ()
  "Preconfigured anything for rope completions."
  (interactive)
  (anything 'anything-source-rope))

(provide 'anything-rope)