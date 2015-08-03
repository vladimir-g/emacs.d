;;
;; Package management
;;

(require 'package)
(package-initialize)

(add-to-list 'package-archives
             '("melpa" . "http://melpa.org/packages/"))

;; Auto-installation of use-package
(if (not (package-installed-p 'use-package))
    (progn
      (package-refresh-contents)
      (package-install 'use-package)))

(require 'use-package)

;; Packages without custom config
(defun ensure-packages (packages)
  (dolist (p packages)
    (use-package package
      :ensure t)))

(ensure-packages '(php-mode
                   lua-mode
                   yaml-mode
                   web-mode
                   markdown-mode
                   hy-mode
                   ahg
                   magit
                   less-css-mode))

;; Packages with custom config
(use-package w3m
  :ensure t
  :config
  (setq w3m-use-cookies t
	w3m-cookie-accept-bad-cookies t)
  (defun w3m-markup-urls-nobreak () nil))

(use-package slime
  :ensure t
  :init
  (setq inferior-lisp-program "sbcl")
  (slime-setup '(slime-fancy
		 slime-asdf 
		 slime-banner)))

(use-package auctex
  :ensure t
  :defer t
  :init
  (require 'tex)
  :config
  (setq TeX-PDF-mode t))

(use-package jinja2-mode
  :ensure
  :mode (("\\.volt'" . jinja2-mode)
	 ("\\.twig'" . jinja2-mode)))

(provide 'rc-packages)
