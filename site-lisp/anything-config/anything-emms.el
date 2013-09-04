(require 'emms)
(require 'emms-source-file)
(require 'emms-playlist-mode)
(require 'emms-extension)
(require 'anything)

;;; Code:

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; Variable ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(defvar anything-c-source-emms-playlist
  '((name . "EMMS Playlist")
    (init . (lambda ()
              (when (and emms-playlist-buffer
                         (bufferp emms-playlist-buffer))
                (anything-candidate-buffer (get-buffer emms-playlist-buffer)))))
    (candidates-in-buffer)
    (get-line . buffer-substring)
    (action . (("Play" . (lambda (candidate)
                           (save-excursion
                             (with-current-emms-playlist
                               (goto-char (point-min))
                               (search-forward candidate)
                               (emms-playlist-mode-play-smart)))))
               ("Edit Tag" . (lambda (candidate)
                               (save-excursion
                                 (with-current-emms-playlist
                                   (goto-char (point-min))
                                   (search-forward candidate)
                                   (forward-line -1)
                                   (emms-tag-editor-edit)))))
               ("Jump to file" . (lambda (candidate)
                                   (save-excursion
                                     (with-current-emms-playlist
                                       (goto-char (point-min))
                                       (search-forward candidate)
                                       (emms-jump-to-file)))))
               ("Switch to playlist" . (lambda (candidate)
                                         (emms-playlist-mode-go)))))))

(defvar anything-c-source-emms-directory
  '((name . "EMMS directory")
    (init . (anything-emms-directory-init))
    (candidates-in-buffer)
    (action . (("Play directory" . (lambda (candidate)
                                     (emms-play-directory-tree candidate)))
               ("Add directory" . (lambda (candidate)
                                    (emms-add-directory-tree candidate)))))))

(defvar anything-c-source-emms-file
  '((name . "EMMS file")
    (init . (anything-emms-file-init))
    (candidates-in-buffer)
    (action . (("Add and Play file" . (lambda (candidate)
                                        (emms-add-file candidate)
                                        (with-current-emms-playlist
                                          (goto-char (point-max))
                                          (forward-line -1)
                                          (emms-playlist-mode-play-smart))))
               ("Play file" . (lambda (candidate)
                                (emms-play-file candidate)))
               ("Add file" . (lambda (candidate)
                               (emms-add-file candidate)))))))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; Interactive Functions ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(defun anything-emms-playlist ()
  "Play EMMS playlist with `anything'."
  (interactive)
  (anything 'anything-c-source-emms-playlist))

(defun anything-emms-directory ()
  "Play EMMS directory with `anything'."
  (interactive)
  (anything 'anything-c-source-emms-directory))

(defun anything-emms-file ()
  "Play EMMS file with `anything'."
  (interactive)
  (anything 'anything-c-source-emms-file))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; Utilities Functions ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(defun anything-emms-directory-init ()
  "Init `anything-c-source-emms-directory'."
  (let ((anything-buffer (anything-candidate-buffer 'global)))
    (with-current-buffer anything-buffer
      (anything-emms-directory-list emms-source-file-default-directory))))

(defun anything-emms-directory-list (dirs)
  "Generate directory list under DIRS."
  (dolist (file (directory-files dirs t))
    (if (file-directory-p file)
        (unless (string-match "^\\.\\.?$" (file-name-nondirectory file))
          (insert (format "%s\n" file))
          (anything-emms-directory-list file)))))

(defun anything-emms-file-init ()
  "Init `anything-c-source-emms-file'."
  (let ((anything-buffer (anything-candidate-buffer 'global)))
    (with-current-buffer anything-buffer
      (anything-emms-file-list emms-source-file-default-directory))))

(defun anything-emms-file-list (dirs)
  "Generate music file list under DIRS."
  (dolist (file (directory-files dirs t))
    (if (file-directory-p file)
        (unless (string-match "^\\.\\.?$" (file-name-nondirectory file))
          (anything-emms-file-list file))
      (if (string-match (emms-player-get (emms-player-for (emms-playlist-current-selected-track)) 'regex) file)
          (insert (format "%s\n" file))))))

(provide 'anything-emms)

;;; anything-emms.el ends here


;;; LocalWords:  emms dirs regex mplayer
