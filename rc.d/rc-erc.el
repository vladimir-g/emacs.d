;; Custom ERC configuration
(require 'erc)

(add-to-list 'erc-modules 'notifications)

(define-key erc-mode-map (kbd "RET") nil)
(define-key erc-mode-map (kbd "<C-return>") 'erc-send-current-line)
(define-key erc-mode-map (kbd "C-j") 'erc-send-current-line)

;; Paths
(let ((default-directory user-emacs-directory))
  (setq erc-log-channels-directory (expand-file-name "irc-logs/")))

;; Logging
(if (not (file-exists-p erc-log-channels-directory))
    (mkdir erc-log-channels-directory t))

(setq erc-save-buffer-on-part t
      erc-save-queries-on-quit t)
      ;; erc-log-write-after-send t
;; erc-log-write-after-insert t)

(provide 'rc-erc)
