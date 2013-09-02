(require 'nyan-mode)
(setq nyan-wavy-trail t)
(setq nyan-bar-length 15)
(setq nyan-mode t)
(nyan-start-animation)

(defun arrow-right-xpm (color1 color2)
  "Return an XPM right arrow string representing."
  (format "/* XPM */
static char * arrow_right[] = {
\"12 18 2 1\",
\".	c %s\",
\" 	c %s\",
\".           \",
\"..          \",
\"...         \",
\"....        \",
\".....       \",
\"......      \",
\".......     \",
\"........    \",
\".........   \",
\".........   \",
\"........    \",
\".......     \",
\"......      \",
\".....       \",
\"....        \",
\"...         \",
\"..          \",
\".           \"};"  color1 color2))


(defun make-image-color (color1 color2)
  (create-image (arrow-right-xpm color1 color2) 'xpm t :ascent 'center))

(setq-default
 mode-line-format
 '(; Position, including warning for 80 columns
   (:eval (if nyan-mode
              (list (nyan-create))
              "%p"))
   ; emacsclient [default -- keep?]

   mode-line-client
   ; read-only or modified status
   (:eval
    (cond (buffer-read-only
           (concat
            (propertize "%3c " 'face 'mode-line-read-only-face)
            (propertize " " 'display (make-image-color
                                      (face-attribute
                                       'mode-line-read-only-face
                                       :background)
                                      (face-attribute
                                       'mode-line-folder-face
                                       :background)))))
          ((buffer-modified-p)
           (concat
            (propertize "%3c " 'face 'mode-line-modified-face)
            (propertize " " 'display (make-image-color
                                      (if (>= (save-excursion
                                                (end-of-line)
                                                (current-column)) 80)
                                          "red"
                                          (face-attribute
                                           'mode-line-modified-face
                                           :background))
                                      (face-attribute
                                       'mode-line-folder-face
                                       :background)))))
          (t (concat
              (propertize "%3c " 'face 'mode-line)
              (propertize " " 'display (make-image-color
                                        (face-attribute
                                         'mode-line
                                         :background)
                                        (face-attribute
                                         'mode-line-folder-face
                                         :background)))))))
   ; directory and buffer/file name
   (:eval  (concat
            (propertize
             (shorten-directory default-directory 20)
             'face 'mode-line-folder-face)
            (propertize " " 'display (make-image-color
                                      (face-attribute
                                       'mode-line-folder-face
                                       :background)
                                      (face-attribute
                                       'mode-line-filename-face
                                       :background)))))
   (:eval  (concat
            (propertize "%b" 'face 'mode-line-filename-face)
            (propertize " " 'display (make-image-color
                                      (face-attribute
                                       'mode-line-filename-face
                                       :background)
                                      (face-attribute
                                       'mode-line
                                       :background)))))
   ; narrow [default -- keep?]
   " %n "
   ; mode indicators: vc, recursive edit, major mode, minor modes,
   ; process, global
   (vc-mode vc-mode)
   (elscreen-display-screen-number (" " elscreen-e21-mode-line-string))
   mode-line-modes
   " "
   (:propertize mode-line-process
                face mode-line-process-face)
   (global-mode-string global-mode-string)
   mode-line-mule-info))
;; Helper function
(defun shorten-directory (dir max-length)
  "Show up to `max-length' characters of a directory name `dir'."
  (let ((path (reverse (split-string (abbreviate-file-name dir) "/")))
        (output ""))
    (when (and path (equal "" (car path)))
      (setq path (cdr path)))
    (while (and path (< (length output) (- max-length 4)))
      (setq output (concat (car path) "/" output))
      (setq path (cdr path)))
    (when path
      (setq output (concat ".../" output)))
    output))

;; Extra mode line faces
(make-face 'mode-line-read-only-face)
(make-face 'mode-line-modified-face)
(make-face 'mode-line-folder-face)
(make-face 'mode-line-filename-face)
(make-face 'mode-line-position-face)
(make-face 'mode-line-mode-face)
(make-face 'mode-line-minor-mode-face)
(make-face 'mode-line-process-face)
(make-face 'mode-line-80col-face)

(set-face-attribute 'mode-line nil
    :foreground "gray60" :background "gray20"
    :box '(:line-width 1 :color "gray20" :style nil) 
    :inverse-video nil)
(set-face-attribute 'mode-line-inactive nil
    :foreground "gray80" :background "gray40"
    :inverse-video nil
    :box '(:line-width 1 :color "gray40" :style nil))
(set-face-attribute 'mode-line-read-only-face nil
    :inherit 'mode-line-face
    :background "green"
    :foreground "blue")
(set-face-attribute 'mode-line-modified-face nil
    :inherit 'mode-line-face
    :background "yellow"
    :foreground "#c82829")
(set-face-attribute 'mode-line-folder-face nil
    :inherit 'mode-line-face
    :foreground "aquamarine"
    :background "gray35"
    :weight 'bold)
(set-face-attribute 'mode-line-filename-face nil
    :inherit 'mode-line-face
    :foreground "#eab700"
    :background "#055"
    :weight 'bold)
(set-face-attribute 'mode-line-position-face nil
    :inherit 'mode-line-face
    :family "Menlo" :height 100)
(set-face-attribute 'mode-line-mode-face nil
    :inherit 'mode-line-face
    :foreground "gray80")
(set-face-attribute 'mode-line-minor-mode-face nil
    :inherit 'mode-line-mode-face
    :foreground "gray40"
    :height 110)
(set-face-attribute 'mode-line-process-face nil
    :inherit 'mode-line-face
    :foreground "#718c00")
(set-face-attribute 'mode-line-80col-face nil
    :inherit 'mode-line-position-face
    :foreground "black" :background "#eab700")

(provide 'modeline-tweak)
