(add-to-list 'load-path "~/.emacs.d/site-lisp/color-theme/")
(require 'color-theme)
(color-theme-initialize)
(setq color-theme-load-all-themes nil)
(require 'color-theme)
(require 'color-theme-tangotango)

(color-theme-tangotango)

(custom-set-faces
 '(default ((t (:inherit nil :stipple nil :background "black"
                :foreground "#eeeeec" :inverse-video nil :box nil
                :strike-through nil :overline nil :underline nil
                :slant normal :weight normal :height 101
                :width normal :foundry "unknown"
                :family "DejaVu Sans Mono"))))
 '(fringe ((t (:background "gray7"))))
 '(hl-line ((t (:background "gray15")))))

(provide 'init-color-theme)
