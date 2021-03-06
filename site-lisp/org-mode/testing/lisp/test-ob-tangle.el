;;; test-ob-tangle.el

;; Copyright (c) 2010-2012 Eric Schulte
;; Authors: Eric Schulte

;; Released under the GNU General Public License version 3
;; see: http://www.gnu.org/licenses/gpl-3.0.html

;;;; Comments:

;; Template test file for Org-mode tests


;;; Code:
(let ((load-path (cons (expand-file-name
			".." (file-name-directory
			      (or load-file-name buffer-file-name)))
		       load-path)))
  (require 'org-test)
  (require 'org-test-ob-consts))


;;; Tests

;; TODO
;; (ert-deftest ob-tangle/noweb-on-tangle ()
;;   "Noweb header arguments tangle correctly.
;; - yes      expand on both export and tangle
;; - no       expand on neither export or tangle
;; - tangle   expand on only tangle not export"
;;   (let ((target-file (make-temp-file "ob-tangle-test-")))
;;     (org-test-at-id "eb1f6498-5bd9-45e0-9c56-50717053e7b7"
;;       (org-narrow-to-subtree)
;;       (org-babel-tangle target-file))
;;     (let ((tang (with-temp-buffer
;; 		  (insert-file-contents target-file)
;; 		  (buffer-string))))
;;       (flet ((exp-p (arg)
;; 		    (and
;; 		     (string-match
;; 		      (format "noweb-%s-start\\([^\000]*\\)noweb-%s-end" arg arg)
;; 		      tang)
;; 		     (string-match "expanded" (match-string 1 tang)))))
;; 	(should (exp-p "yes"))
;; 	(should-not (exp-p "no"))
;; 	(should (exp-p "tangle"))))))

(ert-deftest ob-tangle/no-excessive-id-insertion-on-tangle ()
  "Don't add IDs to headings without tangling code blocks."
  (org-test-at-id "ef06fd7f-012b-4fde-87a2-2ae91504ea7e"
    (org-babel-next-src-block)
    (org-narrow-to-subtree)
    (org-babel-tangle)
    (should (null (org-id-get)))))

(ert-deftest ob-tangle/continued-code-blocks-w-noweb-ref ()
  "Test that the :noweb-ref header argument is used correctly."
  (org-test-at-id "54d68d4b-1544-4745-85ab-4f03b3cbd8a0"
    (let ((tangled
	   "df|sed '1d'|awk '{print $5 \" \" $6}'|sort -n |tail -1|awk '{print $2}'"))
      (org-narrow-to-subtree)
      (org-babel-tangle)
      (with-temp-buffer
	(insert-file-contents "babel.sh")
	(goto-char (point-min))
	(should (re-search-forward (regexp-quote tangled) nil t)))
      (delete-file "babel.sh"))))

(ert-deftest ob-tangle/expand-headers-as-noweb-references ()
  "Test that references to headers are expanded during noweb expansion."
  (org-test-at-id "2409e8ba-7b5f-4678-8888-e48aa02d8cb4"
    (org-babel-next-src-block 2)
    (let ((expanded (org-babel-expand-noweb-references)))
      (should (string-match (regexp-quote "simple") expanded))
      (should (string-match (regexp-quote "length 14") expanded)))))

(provide 'test-ob-tangle)

;;; test-ob-tangle.el ends here
