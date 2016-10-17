;;
;; Package management
;;

(require 'package)
(package-initialize)

(add-to-list 'package-archives
             '("melpa" . "http://melpa.org/packages/"))

(when (not package-archive-contents)
  (package-refresh-contents))

;; Auto-installation of use-package
(unless (package-installed-p 'use-package)
  (package-install 'use-package))

(require 'use-package)

;; Packages without custom config
(use-package php-mode :ensure t)
(use-package lua-mode :ensure t)
(use-package yaml-mode :ensure t)
(use-package markdown-mode :ensure t)
(use-package hy-mode :ensure t)
(use-package ahg :ensure t)
(use-package magit :ensure t)
(use-package less-css-mode :ensure t)
(use-package go-mode :ensure t)

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
  :mode (("\\.volt" . jinja2-mode)
	 ("\\.twig" . jinja2-mode)))

(use-package web-mode
  :ensure t
  :mode (("\\.jsx" . web-mode)))

(provide 'rc-packages)
