;; 
;; Tramp config
;; 

(require 'tramp)
(setq tramp-default-method "scp")
(setq password-cache-expiry nil)

(provide 'rc-tramp)
