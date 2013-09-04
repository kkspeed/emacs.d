(require 'elscreen)

(defun anything-elscreen-default-action (elm)
  "Insert completion at point."
  (let ((number (string-to-number
				 (first (split-string elm)))))
	(elscreen-goto number)))

(defun anything-elscreen-get-list ()
  "Get list of anything elscreen"
  (let ((alist (elscreen-get-screen-to-name-alist)))
	(mapcar (lambda (x)
			  (format "%2s - %s"  (car x) (cdr x)))
			alist)))

(setq anything-source-elscreen
  '((name . "elscreen completion")
    (candidates . (lambda ()
					(anything-elscreen-get-list)))
    (action . anything-elscreen-default-action)))

(defun anything-elscreen-complete ()
  "Preconfigured anything for ipython completions."
  (interactive)
  (delete-other-windows)
  (anything 'anything-source-elscreen))

(provide 'anything-elscreen)