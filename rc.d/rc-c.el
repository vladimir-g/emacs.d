(defun custom-c++-mode-hook ()
  (c-set-style "stroustrup"))

(add-hook 'c++-mode-hook 'custom-c++-mode-hook)

(provide 'rc-c)
