(prefer-coding-system 'utf-8)
(put 'upcase-region 'disabled nil)
(tool-bar-mode 0)
(menu-bar-mode -1)
(setq use-dialog-box nil)
(scroll-bar-mode -1)
(setq-default indent-tabs-mode nil)
(defalias 'yes-or-no-p 'y-or-n-p)
(global-set-key (kbd "C-S-t") 'transpose-chars)

(add-to-list 'load-path "~/.emacs.d/site-lisp/linum+")
(require 'linum+)
(global-linum-mode)
(setq column-number-mode t)

(require 'uniquify)
(setq uniquify-buffer-name-style 'forward)

(add-to-list 'load-path "~/.emacs.d/site-lisp/window-number")
(autoload 'window-number-mode "window-number" t)
(autoload 'window-number-meta-mode "windows-number" t)
(window-number-mode 1)
(window-number-meta-mode 1)

(global-hl-line-mode t)

(setq inhibit-startup-message t) ;no splash screen
(setq default-tab-width 4)

(provide 'init-basics)
