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

(defun x-urgency-hint (frame arg &optional source)
  "Set urgency hint (for XWindow). From
  http://www.emacswiki.org/emacs/JabberEl"
  (let* ((wm-hints (append (x-window-property 
			    "WM_HINTS" frame "WM_HINTS" source nil t) nil))
	 (flags (car wm-hints)))
    (setcar wm-hints
	    (if arg
		(logior flags #x100)
	      (logand flags (lognot #x100))))
    (x-change-window-property "WM_HINTS" wm-hints frame "WM_HINTS" 32 t)))

(provide 'rc-utils)
