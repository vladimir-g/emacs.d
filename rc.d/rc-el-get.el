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
      (eval-print-last-sexp)))
  (el-get-elpa-build-local-recipes))

(add-to-list 'el-get-recipe-path 
             (expand-file-name "recipes" user-emacs-directory))

;; Customized sources
(setq el-get-sources
      '(;; (:name slime
      ;;          :before (progn 
      ;;                    (setq inferior-lisp-program "sbcl")
      ;;                    (slime-setup '(slime-fancy
      ;;                                   slime-asdf 
      ;;                                   slime-banner))
      ;;                    (setq slime-complete-symbol*-fancy t)
      ;;                    (setq slime-complete-symbol-function
      ;;                          'slime-fuzzy-complete-symbol)))
        (:name jinja2-mode
               :after (progn
                        (add-to-list 'auto-mode-alist '("\\.volt$" . jinja2-mode))
                        (add-to-list 'auto-mode-alist '("\\.twig$" . jinja2-mode))))
        (:name auctex
               :after (progn
                        (setq TeX-PDF-mode t)))
        (:name mmm-mode
               :after (progn
                        (setq mmm-submode-decoration-level 0)
                        (setq mmm-global-mode 'maybe)))))

;; Packages with default settings or with init files
(defvar my-packages)
(setq my-packages
      '(el-get
        php-mode
        magit
        yaml-mode 
        lua-mode
        go-mode
        revbufs
        web-mode
        markdown-mode
        hy-mode
        ahg
        org-mode
        less-css-mode
        sws-mode
        stylus-mode
        quack))

(when (el-get-executable-find "cvs")
  (progn
    (add-to-list 'el-get-sources 
                 '(:name emacs-w3m
                         :after (progn
                                  (setq w3m-use-cookies t)
                                  (setq w3m-cookie-accept-bad-cookies t)
                                  (defun w3m-markup-urls-nobreak () nil))))))

(setq my-packages
      (append
       (mapcar 'el-get-source-name el-get-sources)
       my-packages))

(provide 'rc-el-get)
