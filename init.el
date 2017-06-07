;; Config file directory

;; (package-initialize)

(let ((default-directory user-emacs-directory))
  (setq rc-dir-path (expand-file-name "rc.d")
        home-site-lisp-path (expand-file-name "site-lisp")))

;; Add directories to load path
(dolist (name '(rc-dir-path home-site-lisp-path))
  (add-to-list 'load-path (eval name)))

;; Custom file
(setq custom-file (expand-file-name "init-custom.el" user-emacs-directory))
(load custom-file 'noerror)

;; Utilities for config file
(require 'rc-utils)

;; Package.el
(require 'rc-packages)

;; Other rc files
(require 'rc-look-and-feel)
(require 'rc-tramp)
(require 'rc-ido)
(require 'rc-ediff)
(require 'rc-uniquify)
(require 'rc-c)
(require 'rc-erc)

;; Gnus init file (would load rc-gnus also)
(setq gnus-init-file (expand-file-name "gnus.el" user-emacs-directory))

;; Additional packages
(require 'python)


;; Additional config
;; Indent
(setq-default indent-tabs-mode nil)
(setq indent-tabs-mode nil)

;; Enable narrow-to-region
(put 'narrow-to-region 'disabled nil)

;; Dired customization
(put 'dired-find-alternate-file 'disabled nil)
(setq dired-dwim-target t)

