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
(setq use-package-always-ensure t)

;; Packages without custom config
(use-package lua-mode)
(use-package yaml-mode)
(use-package markdown-mode)
(use-package hy-mode)
(use-package ahg)
(use-package magit)
(use-package less-css-mode)
(use-package go-mode)

;; Packages with custom config
(use-package w3m
  :config
  (setq w3m-use-cookies t
	w3m-cookie-accept-bad-cookies t)
  (defun w3m-markup-urls-nobreak () nil))

(use-package slime
  :init
  (setq inferior-lisp-program "sbcl")
  (slime-setup '(slime-fancy
		 slime-asdf 
		 slime-banner)))

(use-package auctex
  :defer t
  :init
  (require 'tex)
  :config
  (setq TeX-PDF-mode t))

(use-package jinja2-mode
  :mode (("\\.volt" . jinja2-mode)
	 ("\\.twig" . jinja2-mode)))

(use-package web-mode
  :mode (("\\.jsx" . web-mode))
  :config
  ;; Disable auto indent because it is fucking slow
  (setq web-mode-enable-auto-indentation nil))

(use-package php-mode
  :init
  (add-hook 'php-mode-hook 'php-enable-psr2-coding-style))

(use-package bbdb
  :config
  (bbdb-initialize 'gnus 'message)
  (bbdb-mua-auto-update-init 'gnus 'message)
  (setq bbdb-mua-update-interactive-p '(query . create))
  (setq bbdb-mua-pop-up nil)
  (setq bbdb-message-all-addresses t))

(provide 'rc-packages)
