;; Lisp

;; SLIME
(setq inferior-lisp-program "/usr/bin/sbcl")
(add-to-list 'load-path "/usr/share/emacs/site-lisp/slime/")

(add-hook 'lisp-mode-hook (lambda ()
                            (cond ((not (featurep 'slime))
                                   (require 'slime)
                                   (normal-mode)))))

(eval-after-load "slime"
  '(progn
     (add-to-list 'load-path "/usr/share/emacs/site-lisp/slime/contrib/")
     (slime-setup '(slime-fancy slime-asdf slime-banner))
     (setq slime-complete-symbol*-fancy t)
     (setq slime-complete-symbol-function 'slime-fuzzy-complete-symbol)))
