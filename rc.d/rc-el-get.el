;; 
;; Config for el-get
;; 

;; Install and init
(unless (require 'el-get nil 'noerror)
  (with-current-buffer
      (url-retrieve-synchronously
       "https://raw.github.com/dimitri/el-get/master/el-get-install.el")
    (let (el-get-master-branch)
      (goto-char (point-max))
      (eval-print-last-sexp))))

(add-to-list 'el-get-recipe-path 
             (expand-file-name "recipes" user-emacs-directory))

;; Customized sources
(setq el-get-sources
      '((:name slime
               :before (progn 
                        (setq inferior-lisp-program "sbcl")
                        (slime-setup '(slime-fancy
                                       slime-asdf 
                                       slime-banner))
                        (setq slime-complete-symbol*-fancy t)
                        (setq slime-complete-symbol-function
                              'slime-fuzzy-complete-symbol)))
        (:name mmm-mode
               :after (progn
                        (setq mmm-submode-decoration-level 0)
                        (setq mmm-global-mode 'maybe)))))

;; Packages with default settings or with init files
(defvar my-packages)
(setq my-packages
      '(el-get
        php-mode-improved 
        yaml-mode 
        lua-mode
        go-mode
        revbufs
        web-mode
        jinja2-mode
        python
        mmm-mako
        ahg
        org-mode
        quack))

(when (el-get-executable-find "cvs")
  (progn
    (add-to-list 'el-get-sources 
                 '(:name auctex
                         :after (progn
                                  (setq TeX-PDF-mode t))))
    (add-to-list 'el-get-sources 
                 '(:name emacs-w3m
                         :after (progn
                                  (setq w3m-use-cookies t)
                                  (setq w3m-cookie-accept-bad-cookies t))))))

(setq my-packages
      (append
       (mapcar 'el-get-source-name el-get-sources)
       my-packages))

(provide 'rc-el-get)
