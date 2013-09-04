(require 'ac-octave)
(defun ac-octave-mode-setup ()
  
(setq ac-sources '(ac-source-octave)))
(add-hook 'octave-mode-hook
          '(lambda () (ac-octave-mode-setup)))

(add-to-list 'auto-mode-alist '("\\.m\\'" . octave-mode))
(add-to-list 'ac-modes 'octave-mode)

(provide 'init-octave)
