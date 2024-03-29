;; 
;; Tramp config
;; 

(require 'tramp)
(setq tramp-default-method "scp")
(setq password-cache-expiry nil)
(setq auth-source-save-behavior nil)

(setq tramp-auto-save-directory "/tmp")
(setq tramp-allow-unsafe-temporary-files t)

(provide 'rc-tramp)
