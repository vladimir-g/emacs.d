;; All about look and feel

;; Fonts
(set-frame-font "DejaVu Sans Mono-10")
(add-to-list 'default-frame-alist '(set-frame-font "DejaVu Sans Mono-10"))

;; Color themes
(if window-system
  ;; X Window emacs
  (progn
    (require 'color-theme)
    (color-theme-initialize)
    (add-to-list 'load-path (concat 
                             emacs-home "color-theme"))
    (load-library "color-theme-terminal-dark")
    (color-theme-terminal-dark))
  (progn
    ;; Terminal emacs
    (xterm-mouse-mode t)))


;; UI
(tool-bar-mode -1)
(menu-bar-mode -1)
(scroll-bar-mode -1)
(setq visible-bell t)
(show-paren-mode t)
(column-number-mode t)
