;; 
;; Config for el-get
;; 

;; Install and init
(unless (require 'el-get nil t)
  (with-current-buffer
      (url-retrieve-synchronously
       "https://raw.github.com/dimitri/el-get/master/el-get-install.el")
         (let (el-get-install-skip-emacswiki-recipes)
           (goto-char (point-max))
           (eval-print-last-sexp))))

(add-to-list 'el-get-recipe-path 
             (expand-file-name "recipes" user-emacs-directory))

;; Customized sources
(setq el-get-sources
      '((:name slime
               :features slime-autoloads
               :after (lambda ()
                        (setq inferior-lisp-program "sbcl")
                        (add-hook 'lisp-mode-hook (lambda ()
                            (cond ((not (featurep 'slime))
                                   (require 'slime)
                                   (normal-mode)))))
                        (eval-after-load "slime"
                          '(progn
                             (add-to-list 'load-path 
                                          (expand-file-name "slime/contrib"
                                                            el-get-top-path)
                             (slime-setup '(slime-fancy 
                                            slime-asdf 
                                            slime-banner))
                             (setq slime-complete-symbol*-fancy t)
                             (setq slime-complete-symbol-function
                                   'slime-fuzzy-complete-symbol))))))
        (:name python-mode
               :after (lambda ()
                        (add-hook 'python-mode-hook 
                                  '(lambda ()
                                     (require 'pymacs)
                                     (pymacs-load "ropemacs" "rope-")))))
        (:name nxhtml
               :after (lambda ()
                        (setq 
                         mumamo-background-colors nil
                         rng-nxml-auto-validate-flag nil)))))

;; Packages with default settings or with init files
(defvar my-packages)
(setq my-packages
      '(el-get
        php-mode-improved 
        yaml-mode 
        lua-mode
        pymacs
        jinja
        revbufs
        quack))

(when (el-get-executable-find "cvs")
  (progn
    (add-to-list 'my-packages 'auctex)
    (add-to-list 'el-get-sources 
                 '(:name emacs-w3m
                         :after (lambda ()
                                  (setq w3m-use-cookies t)
                                  (setq w3m-cookie-accept-bad-cookies t))))))

(setq my-packages
      (append
       (mapcar 'el-get-source-name el-get-sources)
       my-packages))

(provide 'rc-el-get)
