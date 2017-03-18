(defun custom-c++-mode-hook ()
  (c-set-style "stroustrup"))

(defun custom-c-mode-hook ()
  (c-set-style "k&r")
  (setq c-basic-offset 4))

(add-hook 'c++-mode-hook 'custom-c++-mode-hook)
(add-hook 'c-mode-hook 'custom-c++-mode-hook)

(provide 'rc-c)
