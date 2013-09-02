(add-to-list 'load-path "~/.emacs.d")
(require 'init-libraries)
(require 'init-basics)
(require 'init-basic-editing)
(require 'init-ido)
(require 'init-frame)
(require 'init-mode-line)
(require 'init-color-theme)
(require 'init-flymake)
(require 'init-woman)
(require 'init-epa)
(require 'init-org-mode)
(require 'init-elscreen)
;(require 'init-edit-server)
(require 'init-anything)
(require 'init-autopair)
(require 'init-paredit)
(require 'init-comint)
(require 'init-auto-complete)

(require 'init-haskell-mode)

(require 'init-lisp)

(require 'init-pymacs)
(require 'init-python-mode)

(require 'init-clojure)
(require 'init-ess)

(require 'init-html)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(elscreen-display-tab nil)
 '(elscreen-tab-display-control nil))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:inherit nil :stipple nil :background "black" :foreground "#eeeeec" :inverse-video nil :box nil :strike-through nil :overline nil :underline nil :slant normal :weight normal :height 101 :width normal :foundry "unknown" :family "DejaVu Sans Mono"))))
 '(fringe ((t (:background "gray7"))))
 '(hl-line ((t (:background "gray15"))))
 '(mode-line ((t (:inherit nil :stipple nil :background "black" :foreground "#bbbbbc" :background "#222222" :inverse-video nil :box nil)))))
