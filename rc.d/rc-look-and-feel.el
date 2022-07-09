;; 
;; Look and feel
;; 

(let ((font (if (string-prefix-p "thinkpad" system-name)
		"DejaVu Sans Mono-9"
	      "DejaVu Sans Mono-10")))
  (set-frame-font font)
  (add-to-list 'default-frame-alist (cons 'font font)))
    
(tool-bar-mode -1)
(menu-bar-mode -1)
(scroll-bar-mode -1)
(setq visible-bell t)
(show-paren-mode t)
(column-number-mode t)
(line-number-mode t)

;; Themes
(add-to-list 'custom-theme-load-path 
             (expand-file-name "themes" 
                               user-emacs-directory))

(load-theme 'terminal-dark t)

(provide 'rc-look-and-feel)

;; (add-hook 'after-make-frame-functions
;;   (lambda ()
;;     ;; we want some font only in GUI Emacs
;;     (when (display-graphics-p)
;;       (set-frame-font "DejaVu Sans Mono 28")))
;; Note that the after-make-frame-functions hook isn’t run for the initial frame, so it’s often necessary to also add frame-related hook functions like that above to after-init-hook.
