;; 
;; Ido-mode config
;; 

(require 'ido)
(ido-mode t)
(setq ido-enable-flex-matching t)
(setq ido-use-filename-at-point 'guess)
(setq ido-show-dot-for-dired t)

(provide 'rc-ido)
