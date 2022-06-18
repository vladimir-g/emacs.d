;; 
;; Completion config
;; 

(require 'icomplete)

(fido-mode t)
(fido-vertical-mode t)

(advice-add
 'find-file
 :around
 (lambda (original-fun &optional prefix)
   "Add PREFIX argument to call old-style find-file without fido."
   (interactive "P")
   (unwind-protect
       (progn
         (when prefix
           (fido-mode -1))
         (call-interactively original-fun))
     (when prefix (fido-mode 1)))))

(provide 'rc-complete)
