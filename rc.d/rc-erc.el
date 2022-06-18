;;
;; Custom ERC configuration
;;

(require 'erc)

(add-to-list 'erc-modules 'notifications 'hl-nicks)

(define-key erc-mode-map (kbd "RET") nil)
(define-key erc-mode-map (kbd "<C-return>") 'erc-send-current-line)
(define-key erc-mode-map (kbd "C-j") 'erc-send-current-line)

;; Urgency hints
(defun notify-wrapper (orig-fun &rest args)
  (let ((res (apply orig-fun args)))
    (x-urgency-hint (selected-frame) t)
    res))

;; (advice-add 'erc-notifications-notify :around #'notify-wrapper)

(defun erc-split-line (longline)
  "Split long lines with non-ascii characters properly. Works
only with utf-8 at this time, sorry."
  (let* ((target (erc-default-target))
         ;; (coding (erc-coding-system-for-target target)))
         (coding 'utf-8))
    (when (consp coding)
      (setq coding (cdr coding)))
    (if (< (length (encode-coding-string longline coding)))
           erc-split-line-length)
        (list longline)
      (let ((result "") (buf))
        ;; Create list of encoded strings
        (dolist (word (split-string longline " " nil))
          (let* ((w (concat word " "))  ;FIXME last word doesn't need
                                        ;a trailing space
                 (encoded (encode-coding-string w coding)))
            (when (> (+ (length result)
                        (length encoded))
                     erc-split-line-length)
              (setf buf (append buf (list result)))
              (setf result ""))
            (setf result (concat result encoded))))
        ;; Don't forget last element
        (setf buf (append buf (list result)))
        ;; Decode strings again
        (mapcar (lambda (e) (decode-coding-string e coding)) buf))))

(setq local-erc-settings (expand-file-name "erc.el" user-emacs-directory))
(load local-erc-settings 'noerror)

;; Example for local erc.el file
;; (add-hook 'erc-after-connect
;;     	  #'(lambda (SERVER NICK)
;;     	      (cond
;;     	       ((string-match "server\\.org" SERVER)
;;     		(erc-message "PRIVMSG" "user@server.org AUTH username password")
;;                 (erc-server-send "MODE username +x")))))

;; (defun connect-to-server ()
;;   (interactive)
;;   (erc-tls :server "server.org" :port 6697 :nick "username" :password "pass"))


(provide 'rc-erc)
