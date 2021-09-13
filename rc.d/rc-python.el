;; Python customization

;; Add two spaces for inline comment to satisfy PEP 8
(add-hook 'python-mode-hook
  (lambda () (setq-local comment-inline-offset 2)))

;; Enable pyvenv-mode everywhere
(pyvenv-mode 1)

(provide 'rc-python)

