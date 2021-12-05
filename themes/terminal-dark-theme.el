;;; terminal-dark-theme.el --- Old-style terminal-like theme

(deftheme terminal-dark
  "Old-style terminal theme with green text and dark background.")

(let ((class '((class color) (min-colors 89)))
      (dark-bg "#060606") (dark-bg-1 "#222") (black "black")
      (green "green") (green-fg "#00D600") (gray "gray") (brown-4 "brown4")
      (deep-green "#48481b")
      (deep-blue "#405060") (yellow "yellow")
      (pale-turquoise-4 "PaleTurquoise4")
      (light-gray "LightGray") (deep-gray "#373737") (dark-green "DarkGreen")
      (dark-cyan "DarkCyan") (dim-gray "DimGray")
      (light-cyan "#d7ffff")
      (pale-violet-red-2 "PaleVioletRed2")
      (dark-slate-gray "DarkSlateGray")
      (cadet-blue-1 "CadetBlue1")       ;FG KW
      (cadet-blue-2 "CadetBlue")        ;FG comment
      (gray-1 "#7a7a79")
      (gray-2 "#626262")
      (light-brown "burlywood")
      (light-brown-2 "#ffd7af")
      (dark-brown "#626213")
      (gold "gold")
      (butter-1 "#fce94f") (butter-2 "#edd400") (butter-3 "#c4a000")
      (orange-1 "#fcaf3e") (orange-2 "#f57900")
      (choc-2 "#c17d11") (choc-3 "#8f5902")
      (cham-0 "#b4fa70") (cham-1 "#8ae234") (cham-2 "#73d216")
      (blue-0 "#8cc4ff") (blue-1 "#729fcf") (blue-2 "#3465a4")
      (blue-3 "#204a87") (blue-4 "#7d7dfb") (blue-5 "#afffff")
      (blue-6 "#729fcf") (blue-7 "#3465a4")
      (plum-0 "#e6a8df") (plum-1 "#ad7fa8") (plum-2 "#75507b")
      (plum-3 "#5c3566")
      (red-0 "#ff4b4b") (red-1 "#ef2929")  (red-3 "#a40000")
      (alum-1 "#eeeeec") (alum-4 "#888a85") (alum-5 "#555753")
      (alum-5.5 "#41423f") (alum-6 "#2e3436") (alum-7 "#212526"))

  (custom-theme-set-faces
   'terminal-dark
   ;; Different settings for different terminals.
   `(default ((((class color) (min-colors 4096))
	       (:foreground ,green-fg :background ,dark-bg))
	      (((class color) (min-colors 256))
	       (:foreground ,green-fg :background ,dark-bg-1))
	      (,class
	       (:foreground ,green-fg :background ,black))))
   `(cursor ((,class (:background ,green))))
   ;; Highlighting faces
   `(fringe ((,class (:background ,deep-blue))))
   `(highlight ((,class (:foreground ,light-gray :background ,dark-green))))
   `(region ((,class (:background ,dark-cyan))))
   `(secondary-selection ((,class (:foreground ,green :background ,deep-gray))))
   `(isearch ((,class (:background ,pale-violet-red-2 :foreground ,brown-4))))
   `(lazy-highlight ((,class (:background ,pale-turquoise-4))))
   `(trailing-whitespace ((,class (:background ,deep-blue)))) 
   `(diff-header ((,class (:background ,gray-1))))
   `(diff-file-header ((,class (:background ,dark-slate-gray))))
   ;; Mode line faces
   `(mode-line ((,class
		 (:box (:line-width -1 :style released-button)
		       :background ,gray :foreground ,black))))
   `(mode-line-inactive ((,class
			  (:box (:line-width -1 :style released-button)
			        :background ,dim-gray :foreground ,light-gray))))
   ;; Escape and prompt faces
   `(minibuffer-prompt ((,class (:foreground ,cham-0))))
   `(escape-glyph ((,class (:foreground ,butter-3))))
   `(error ((,class (:foreground ,red-0))))
   `(warning ((,class (:foreground ,yellow))))
   `(success ((,class (:foreground ,cham-1))))
   ;; Font lock faces
   `(font-lock-builtin-face ((,class (:foreground ,light-cyan))))
   `(font-lock-comment-face ((,class (:italic t :foreground ,cadet-blue-2 :slant italic))))
   `(font-lock-constant-face ((,class (:foreground ,gold))))
   `(font-lock-function-name-face ((,class (:bold t :foreground ,blue-5 :weight bold))))
   `(font-lock-keyword-face ((,class (:bold t :foreground ,blue-4 :weight bold))))
   `(font-lock-string-face ((,class (:foreground ,light-brown))))
   `(font-lock-type-face ((,class (:foreground ,cadet-blue-1))))
   `(font-lock-variable-name-face ((,class (:foreground ,light-brown))))
   ;; Button and link faces
   `(link ((,class (:underline t :foreground ,blue-6))))
   `(link-visited ((,class (:underline t :foreground ,blue-7))))
   ;; Gnus faces
   `(gnus-group-news-1 ((,class (:foreground ,plum-1))))
   `(gnus-group-news-1-low ((,class (:foreground ,plum-2))))
   `(gnus-group-news-2 ((,class (:foreground ,blue-1))))
   `(gnus-group-news-2-low ((,class (:foreground ,blue-2))))
   `(gnus-group-news-3 ((,class (:foreground ,cham-1))))
   `(gnus-group-news-3-low ((,class (:foreground ,cham-2))))
   `(gnus-group-news-4 ((,class (:foreground ,plum-0))))
   `(gnus-group-news-4-low ((,class (:foreground ,choc-2))))
   `(gnus-group-news-5 ((,class (:foreground ,orange-1))))
   `(gnus-group-news-5-low ((,class (:foreground ,orange-2))))
   `(gnus-group-news-low ((,class (:foreground ,butter-2))))
   `(gnus-group-mail-1 ((,class (:foreground ,plum-1))))
   `(gnus-group-mail-1-low ((,class (:foreground ,plum-2))))
   `(gnus-group-mail-2 ((,class (:foreground ,blue-1))))
   `(gnus-group-mail-2-low ((,class (:foreground ,blue-2))))
   `(gnus-group-mail-3 ((,class (:foreground ,cham-1))))
   `(gnus-group-mail-3-low ((,class (:foreground ,cham-2))))
   `(gnus-group-mail-low ((,class (:foreground ,butter-2))))
   `(gnus-header-content ((,class (:weight normal :foreground ,butter-3))))
   `(gnus-header-from ((,class (:foreground ,butter-2))))
   `(gnus-header-subject ((,class (:foreground ,cham-1))))
   `(gnus-header-name ((,class (:foreground ,blue-1))))
   `(gnus-header-newsgroups ((,class (:foreground ,choc-2))))
   ;; Message faces
   `(message-header-name ((,class (:foreground ,blue-1))))
   `(message-header-cc ((,class (:foreground ,butter-3))))
   `(message-header-other ((,class (:foreground ,choc-2))))
   `(message-header-subject ((,class (:foreground ,cham-1))))
   `(message-header-to ((,class (:foreground ,butter-2))))
   `(message-cited-text ((,class (:foreground ,cham-1))))
   `(message-separator ((,class (:foreground ,plum-1))))
   ;; SMerge faces
   `(smerge-refined-change ((,class (:background ,blue-3))))
   ;; Ediff faces
   `(ediff-current-diff-A ((,class (:background ,alum-5))))
   `(ediff-fine-diff-A ((,class (:background ,blue-3))))
   `(ediff-even-diff-A ((,class (:background ,alum-5.5))))
   `(ediff-odd-diff-A ((,class (:background ,alum-5.5))))
   `(ediff-current-diff-B ((,class (:background ,alum-5))))
   `(ediff-fine-diff-B ((,class (:background ,choc-3))))
   `(ediff-even-diff-B ((,class (:background ,alum-5.5))))
   `(ediff-odd-diff-B ((,class (:background ,alum-5.5))))
   `(ediff-current-diff-C ((,class (:background ,deep-green))))
   `(ediff-fine-diff-C ((,class (:background ,dark-brown))))
   `(ediff-odd-diff-C ((,class (:background ,alum-5.5))))
   `(ediff-even-diff-C ((,class (:background ,gray-2))))
   ;; Flyspell faces
   `(flyspell-duplicate ((,class (:underline ,orange-1))))
   `(flyspell-incorrect ((,class (:underline ,red-1))))
   ;; ERC faces
   `(erc-input-face ((t (:foreground ,blue-1))))
   `(erc-my-nick-face ((t (:foreground ,blue-1))))
   ;; Semantic faces
   `(semantic-decoration-on-includes ((,class (:underline ,alum-4))))
   `(semantic-decoration-on-private-members-face
     ((,class (:background ,plum-3))))
   `(semantic-decoration-on-protected-members-face
     ((,class (:background ,choc-3))))
   `(semantic-decoration-on-unknown-includes
     ((,class (:background ,red-3))))
   `(semantic-decoration-on-unparsed-includes
     ((,class (:background ,alum-5.5))))
   `(semantic-tag-boundary-face ((,class (:overline ,blue-1))))
   `(semantic-unmatched-syntax-face ((,class (:underline ,red-1)))))

  (custom-theme-set-variables
   'terminal-dark
   `(ansi-color-names-vector [,alum-7 ,red-0 ,cham-0 ,butter-1
			              ,blue-1 ,plum-1 ,blue-0 ,alum-1])))

(provide-theme 'terminal-dark)

;;; terminal-dark-theme.el ends here
