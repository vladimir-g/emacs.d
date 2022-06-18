;; 
;; Completion config
;; 

(require 'icomplete)

(fido-mode t)
(fido-vertical-mode t)

(defun original-find-file ()
  "Call old-style find-file without fido."
  (interactive)
  (unwind-protect
      (progn
        (fido-mode -1)
        (message "hello")
        (call-interactively 'find-file))
    (fido-mode 1)))

(global-set-key (kbd "C-c f") 'original-find-file)

(provide 'rc-complete)
