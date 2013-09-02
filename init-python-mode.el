(add-to-list 'load-path "~/.emacs.d/site-lisp/python-mode")
(setq py-install-directory "~/.emacs.d/site-lisp/python-mode")

(require 'python-mode)

(add-to-list 'load-path "~/.emacs.d/site-lisp/python-mode/completion")

(require 'auto-complete-pycomplete)

(add-hook 'python-mode-hook (lambda ()
                              (add-to-list 'ac-sources 'ac-source-pycomplete)))
(add-to-list 'auto-mode-alist '("\\.py\\'" . python-mode))
(add-to-list 'interpreter-mode-alist '("python" . python-mode))

(defun flymake-pyflakes-init()
  (let* ((temp-file (flymake-init-create-temp-buffer-copy
					 'flymake-create-temp-inplace))
		 (local-file (file-relative-name
					  temp-file
					  (file-name-directory buffer-file-name))))
	(list "pyflakes" (list local-file))))

(add-to-list 'flymake-allowed-file-name-masks
			 '("\\.py\\'" flymake-pyflakes-init))

(add-hook 'python-mode-hook 'pyflakes-flymake-mode)


(provide 'init-python-mode)
