;; Python
(defun my-python-hook ()
  ;; Ropemacs
  (require 'pymacs)
  (pymacs-load "ropemacs" "rope-"))

(add-hook 'python-mode-hook 'my-python-hook)
