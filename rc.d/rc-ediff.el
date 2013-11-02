;; 
;; Ediff config
;; 

(setq ediff-window-setup-function 'ediff-setup-windows-plain)

(setq ediff-split-window-function (if (> (frame-width) 150)
                                      'split-window-horizontally
                                    'split-window-vertically))

(defun command-line-diff (switch)
  (let ((file1 (pop command-line-args-left))
        (file2 (pop command-line-args-left)))
    (ediff file1 file2)))
   
(add-to-list 'command-switch-alist '("-diff" . command-line-diff))

(provide 'rc-ediff)
