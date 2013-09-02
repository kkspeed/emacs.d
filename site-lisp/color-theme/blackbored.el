;; Blackbored Colour Theme for Emacs.
;;
;; Defines a colour scheme resembling that of the original TextMate Blackboard colour theme.
;; To use add the following to your .emacs file (requires the color-theme package):
;;
;; (require 'color-theme)
;; (color-theme-initialize)
;; (load-file "~/.emacs.d/themes/color-theme-blackbored.el")
;;
;; And then (color-theme-blackboard) to activate it.
;;
;; MIT License Copyright (c) 2008 JD Huntington <jdhuntington at gmail dot com>
;; Credits due to the excellent TextMate Blackboard theme
;;
;; All patches welcome

(require 'color-theme)

;;;###autoload
(defun color-theme-blackbored ()
  "Color theme by Sam Aaron, based off BlackBoard by JD Huntington based off the TextMate Blackboard theme, created 2008-11-27"
  (interactive)
  (color-theme-install
   '(color-theme-blackbored
     ((background-color . "#000000")
      (background-mode . dark)
      (border-color . "#3e1259")
      (cursor-color . "#96CBFE")
      (foreground-color . "#EDEDED")
      (mouse-color . "sienna1"))

     (hl-line ((t (:background "#333333"))))
     (default ((t (:background "#3e1259" :foreground "#A9A9A9"))))
     (blue ((t (:foreground "blue"))))
     (bold ((t (:bold t))))
     (bold-italic ((t (:bold t))))
     (border-glyph ((t (nil))))
     (buffers-tab ((t (:background "#0C1021" :foreground "#F8F8F8"))))


     (font-lock-builtin-face ((t (:foreground "#4c83ff")))) ;; light blue
     (font-lock-comment-face ((t (:italic t :foreground "#8B8989"))))
     (font-lock-constant-face ((t (:foreground "#D8FA3C"))))
     (font-lock-doc-string-face ((t (:foreground "DarkOrange"))))
     (font-lock-function-name-face ((t (:foreground "deep pink"))))
     (font-lock-keyword-face ((t (:foreground "#FBDE2D"))))
     (font-lock-preprocessor-face ((t (:foreground "gray57"))))
     (font-lock-reference-face ((t (:foreground "medium slate blue"))))
     (font-lock-reference-face ((t (:foreground "gray"))))
     (font-lock-regexp-grouping-backslash ((t (:foreground "#E9C062"))))
     (font-lock-regexp-grouping-construct ((t (:foreground "red"))))
     (font-lock-string-face ((t (:foreground "#61CE3C"))))
     (font-lock-type-face ((t (:foreground "dark red"))))
     (font-lock-variable-name-face ((t (:foreground "#FF6400"))))
     (font-lock-warning-face ((t (:bold t :foreground "Pink"))))


     (gui-element ((t (:background "#333333" :foreground "#96CBFE"))))
     (region ((t (:background "#7F073F"))))

     (mode-line ((t (:background "gray10" :foreground "#4c83ff"))))
     (mode-line-inactive ((t (:background "gray10" :foreground "gray30"))))

     (highlight ((t (:background "DarkOrange"))))
     (isearch ((t (:background "yellow" :foreground "#3e1259"))))
     (isearch-fail ((t (:background "red4"))))
     (lazy-highlight ((t (:background "#333333"))))
     (query-replace ((t (:background "#333333"))))
     (Highline-face ((t (:background "SeaGreen"))))
     (italic ((t (nil))))
     (left-margin ((t (nil))))
     (text-cursor ((t (:background "yellow" :foreground "#3e1259"))))
     (toolbar ((t (nil))))
     (underline ((nil (:underline nil))))
     (vertical-border ((t (:background "#3e1259" :foreground "#333333"))))
     (zmacs-region ((t (:background "snow" :foreground "ble"))))

     (diff-added ((t (:foreground "green"))))
     (diff-removed ((t (:foreground "red"))))

     (magit-diff-add ((t (:foreground "green"))))
     (magit-diff-del ((t (:foreground "red"))))
     (magit-item-highlight ((t (:background "gray15"))))
     (magit-section-title ((t (:foreground "deep pink"))))
     (magit-diff-hunk-header ((t (:foreground "orange"))))
     (magit-branch ((t (:foreground "gold"))))

     (eval-sexp-fu-flash ((t (:background "grey15" :foreground "DeepPink3"))))

     (ac-completion-face ((t (:foreground "darkgray" :underline t))))
     (ac-candidate-face ((t (:background "gray60" :foreground "#3e1259"))))
     (ac-selection-face ((t (:background "deep pink" :foreground "#3e1259"))))
     (popup-isearch-match ((t (:background "#3e1259" :foreground "deep pink"))))
     (popup-tip-face ((t (:background "#333333" :foreground "white"))))
     (popup-scroll-bar-foreground-face ((t (:background "#0A0A0A"))))
     (popup-scroll-bar-background-face ((t (:background "#333333"))))

     (window-number-face ((t (:background "grey10" :foreground "#4c83ff"))))

     (yas/field-highlight-face ((t (:background "deep pink" :foreground "#3e1259"))))

     (naeu-green-face ((t (:foreground "green" :background "#3e1259"))))
     (naeu-pink-face ((t (:foreground "deep pink" :background "#3e1259"))))
     (naeu-blue-face ((t (:foreground "medium slate blue" :background "#3e1259"))))
     (naeu-orange-face ((t (:foreground "#FBDE2D" :background "#3e1259"))))
     (naeu-red-face ((t (:foreground "orange" :background "#3e1259"))))
     (naeu-grey-face ((t (:foreground "gray30" :background "#3e1259"))))

     )))

(custom-set-faces

 ;;nXhtml colours
 '(mumamo-background-chunk-major ((((class color) (background dark)) (:background "#3e1259"))))
 '(mumamo-background-chunk-submode1 ((((class color) (background dark)) (:background "#3e1259"))))

 ;;ediff
 '(ediff-even-diff-A ((((class color) (background dark)) (:background "dark green"))))
 '(ediff-odd-diff-A ((((class color) (background dark)) (:background "dark green"))))
 '(ediff-odd-diff-B ((((class color) (background dark)) (:background "dark red"))))
 '(ediff-even-diff-B ((((class color) (background dark)) (:background "dark red"))))
; '(ediff-current-diff-B ((((class color)) (:background "white"))))
; '(ediff-even-diff-A ((((class color)) nil)))
; '(ediff-even-diff-B ((((class color)) nil)))
; '(ediff-fine-diff-A ((((class color)) (:background "cyan"))))
; '(ediff-fine-diff-B ((((class color)) (:background "cyan"))))
; '(ediff-odd-diff-A ((((class color)) nil)))
; '(ediff-odd-diff-B ((((class color)) nil)))
 )
