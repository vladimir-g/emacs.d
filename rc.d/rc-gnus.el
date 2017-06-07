;; Gnus for email and more

;; This config file must be required from ~/.emacs.d/gnus.el where
;; accounts config is located

;; Example of private gnus config in ~/.emacs.d/gnus.el
;; (setq gnus-select-method '(nnnil ""))
;; (setq gnus-secondary-select-methods
;;       '((nnimap "email@domain.tld"
;;                 (nnimap-address "localhost")
;;                 (nnimap-stream plain)
;;                 (nnir-search-engine imap)
;;                 (nnimap-server-port 143))
;;         (nnimap "another@domain.tld"
;;                 (nnimap-address "localhost")
;;                 (nnimap-stream plain)
;;                 (nnir-search-engine imap)
;;                 (nnimap-server-port 143))))

;; (setq gnus-parameters
;;       '(("email@domain.tld"
;;          (gcc-self t)
;;          (posting-style
;;           (name "John Smith")
;;           (address "email@domain.tld")
;;           (signature "Fancy quote")))
;;         ("another@domain.tld"
;;          (gcc-self . "nnimap+another@domain.tld:[Gmail]/Sent Mail")
;;          (expiry-target "nnimap+another@domain.tld:[Gmail]/Trash")
;;          (expiry-wait 'immediate)
;;          (posting-style
;;           (name "Anonymous")
;;           (address "another@domain.tld")
;;           (signature "Another quote")))))


(setq sendmail-program "msmtp")
(setq message-send-mail-function 'message-send-mail-with-sendmail)
(setq gnus-gcc-mark-as-read t)
;; (setq gnus-permanently-visible-groups ".*")

(setq gnus-thread-sort-functions
      '(gnus-thread-sort-by-number
        gnus-thread-sort-by-most-recent-date)) 

(setq gnus-summary-thread-gathering-function
      'gnus-gather-threads-by-references)

;; (setq gnus-demon-timestep 1)
;; (gnus-demon-add-handler 'gnus-demon-scan-news 30 5)

(add-hook 'gnus-group-mode-hook 'gnus-topic-mode)

(setq gnus-notifications-minimum-level 4)
(setq gnus-notifications-use-gravatar nil)
(setq gnus-notifications-use-google-contacts nil)
(add-hook 'gnus-after-getting-new-news-hook 'gnus-notifications)

(setq gnus-user-date-format-alist '((t . "%d.%m.%y %H:%M")))
(setq gnus-summary-line-format "%[%U%R%z%] %&user-date; │%* %(%-20,20f%) │%B%S\n")

(setq message-citation-line-function 'message-insert-formatted-citation-line)
(setq message-citation-line-format "On %d.%m.%Y %H:%M, %f wrote:\n")

(when window-system                     ; do I need it?
  (setq gnus-sum-thread-tree-indent "  ")
  (setq gnus-sum-thread-tree-root "● ")
  (setq gnus-sum-thread-tree-false-root "◎ ")
  (setq gnus-sum-thread-tree-single-indent "◯ ")
  (setq gnus-sum-thread-tree-vertical        "│")
  (setq gnus-sum-thread-tree-leaf-with-other "├─► ")
  (setq gnus-sum-thread-tree-single-leaf "╰─► "))

(provide 'rc-gnus)
