;; Config file directory
(let ((default-directory user-emacs-directory))
  (setq rc-dir-path (expand-file-name "rc.d")
        el-get-top-path (expand-file-name "el-get")
        el-get-dir-path (expand-file-name "el-get/el-get")
        home-site-lisp-path (expand-file-name "site-lisp")))

;; Add directories to load path
(setq load-directories
      '(rc-dir-path
        el-get-dir-path
        home-site-lisp-path))

(dolist (name load-directories)
  (add-to-list 'load-path (eval name)))

;; Custom file
(setq custom-file (expand-file-name "init-custom.el" user-emacs-directory))
(load custom-file 'noerror)

;; el-get stuff
(require 'rc-el-get)
(el-get-cleanup my-packages)
(el-get 'sync my-packages)

;; My custom configuration

;; Indent
(setq-default indent-tabs-mode nil)

;; Enable narrow-to-region
(put 'narrow-to-region 'disabled nil)

;; Enable dired in same buffer
(put 'dired-find-alternate-file 'disabled nil)
(setq dired-dwim-target t)

;; Utilities for config file
(require 'rc-utils)

;; Load rc files
(require 'rc-look-and-feel)
(require 'rc-tramp)
(require 'rc-ido)
(require 'rc-ediff)
(require 'rc-uniquify)
(require 'rc-c)
(require 'rc-erc)

;; Additional packages
(require 'python)
