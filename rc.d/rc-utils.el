;; 
;; Additional utilities for config file work
;; 


(defun rc-byte-recompile ()
  "Recompile rc files directory."
  (interactive)
  (byte-recompile-directory rc-dir-path 0))

(provide 'rc-utils)
