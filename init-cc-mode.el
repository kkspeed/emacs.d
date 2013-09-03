(require 'semantic)
(require 'semantic/ia)

(global-semantic-idle-completions-mode t)
(global-semantic-decoration-mode t)
(global-semantic-highlight-func-mode t)
(global-semantic-show-unmatched-syntax-mode t)

(add-hook 'c-mode-common-hook '(lambda()
   (define-key c-mode-base-map (kbd "C-c j") 'semantic-ia-fast-jump)
   (define-key c-mode-base-map (kbd "C-c b") 'semantic-mrub-switch-tags)
   (define-key c-mode-base-map (kbd "C-x C-z") 'eassist-switch-h-cpp)))


;; CC-mode
(add-hook 'c-mode-hook '(lambda ()
                          (setq ac-sources (append '(ac-source-semantic-raw) ac-sources))
                          (local-set-key (kbd "RET") 'newline-and-indent)
                          (semantic-mode t)
                          (semantic-idle-summary-mode +1)))

(provide 'init-cc-mode)
