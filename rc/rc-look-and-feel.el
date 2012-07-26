;; 
;; Look and feel
;; 

(set-frame-font "DejaVu Sans Mono-10")
(add-to-list 'default-frame-alist '(set-frame-font "DejaVu Sans Mono-10"))
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

(load-theme 'terminal-dark)

(provide 'rc-look-and-feel)

