;; 
;; Additional utilities for config file work
;; 


(defun rc-byte-recompile ()
  "Recompile rc files directory."
  (interactive)
  (byte-recompile-directory rc-dir-path 0))

(defun unfill-paragraph ()
  "Takes a multi-line paragraph and makes it into a single line of text."
  (interactive)
  (let ((fill-column (point-max)))
    (fill-paragraph)))

(defun pretty-print-xml-region (begin end)
  "Pretty format XML markup in region.
The function inserts linebreaks to separate tags that have
nothing but whitespace between them.  It then indents the markup
by using nxml's indentation rules.
Taken from emacswiki."
  (interactive "r")
  (save-excursion
      (nxml-mode)
      (goto-char begin)
      (while (search-forward-regexp "\>[ \\t]*\<" nil t) 
        (backward-char) (insert "\n"))
      (indent-region begin end)))


(provide 'rc-utils)
