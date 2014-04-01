(:name stylus-mode
       :website "https://github.com/brianc/jade-mode"
       :description "Mode for stylus css preprocessor"
       :type github
       :pkgname "brianc/jade-mode"
       :depends sws-mode
       :prepare (autoload 'stylus-mode "stylus-mode.el")
       :post-init (add-to-list 'auto-mode-alist '("\\.styl$" . stylus-mode)))
