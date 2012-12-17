;; 
;; Tramp config
;; 

(require 'tramp)
(setq tramp-default-method "scp")
(setq password-cache-expiry nil)

(add-to-list 'tramp-default-proxies-alist
             '(nil "\\`root\\'" "/ssh:%h:"))
(add-to-list 'tramp-default-proxies-alist
             '((regexp-quote (system-name)) nil nil))

(provide 'rc-tramp)