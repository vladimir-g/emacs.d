;; Config file directory
(defvar emacs-home "~/.emacs.d/")
;; Packages directory
(defvar home-site-lisp (concat
                        emacs-home "site-lisp/"))
(add-to-list 'load-path emacs-home)
(add-to-list 'load-path home-site-lisp)

;; Load modules
(require 'php-mode)
(require 'quack)
(require 'mercurial)
(require 'revbufs)
(require 'web-vcs)

;; My custom configuration

;; Indent
(load-library "my-indent")
;; Look and feel
(load-library "my-look-n-feel")
;; CEDET
(load-library "my-cedet")
;; Tramp
(load-library "my-tramp")
;; W3m
(load-library "my-w3m")
;; Ropemacs
(load-library "my-python")
;; Lisp
(load-library "my-lisp")
;; nXhtml
(load-library "my-nxhtml")
;; Lua mode
(load-library "my-lua")
;; TeX
(load-library "my-tex")
;; Buffers
(load-library "my-buffers")


;; Custom file
(setq custom-file (concat 
                   emacs-home "init-custom.el"))
(load custom-file 'noerror)
