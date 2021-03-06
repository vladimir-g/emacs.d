;; 
;; Ido-mode config
;; 

(require 'ido)
(ido-mode t)
(ido-everywhere t)
(setq ido-enable-flex-matching t)
(setq ido-enable-tramp-completion nil)
(setq ido-use-filename-at-point nil)
(setq ido-show-dot-for-dired t)
(setq ido-enable-last-directory-history nil)
;; Show buffer even it's opened somewhere
(setq ido-default-file-method 'selected-window)
(setq ido-default-buffer-method 'selected-window)
(add-to-list 'ido-work-directory-list-ignore-regexps tramp-file-name-regexp)

;; Ignore buffers
(setq ido-ignore-buffers '("\\` " "magit-.+"))

;; Preventing auto-searches unless called explicitly
(setq ido-auto-merge-work-directories-length -1)

;; Custom keybindings
(add-hook 'ido-setup-hook 'ido-my-keys)

(defun ido-my-keys ()
 "Add my keybindings for ido."
 (define-key ido-file-dir-completion-map (kbd "C-c C-s")
   (lambda() 
     (interactive)
     (ido-initiate-auto-merge (current-buffer)))))

(provide 'rc-ido)
