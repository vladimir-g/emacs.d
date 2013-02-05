;; 
;; Ido-mode config
;; 

(require 'ido)
(ido-mode t)
(ido-everywhere t)
(setq ido-enable-flex-matching t)
(setq ido-enable-tramp-completion nil)
(setq ido-use-filename-at-point 'guess)
(setq ido-show-dot-for-dired t)

(provide 'rc-ido)
