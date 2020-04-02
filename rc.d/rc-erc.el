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

(provide 'rc-erc)
