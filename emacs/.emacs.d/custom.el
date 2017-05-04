(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ac-auto-start 1)
 '(ag-highlight-search t)
 '(ansi-color-faces-vector
   [default default default italic underline success warning error])
 '(blink-cursor-mode nil)
 '(blink-matching-paren t)
 '(coffee-tab-width 2)
 '(column-highlight-mode nil)
 '(column-number-mode t)
 '(company-auto-complete t)
 '(company-idle-delay nil)
 '(company-minimum-prefix-length 0)
 '(context-coloring-syntactic-comments t)
 '(context-coloring-syntactic-strings nil)
 '(crosshairs-mode nil)
 '(custom-safe-themes
   (quote
    ("8db4b03b9ae654d4a57804286eb3e332725c84d7cdab38463cb6b97d5762ad26" "4aee8551b53a43a883cb0b7f3255d6859d766b6c5e14bcb01bed572fcbef4328" default)))
 '(deft-directory "/Users/aurelienbottazini/Dropbox/org")
 '(deft-recursive t)
 '(deft-use-filename-as-title t)
 '(ediff-window-setup-function (quote ediff-setup-windows-plain))
 '(electric-pair-mode nil)
 '(elm-format-on-save t)
 '(emamux:use-nearest-pane t)
 '(emmet-indent-after-insert t)
 '(emmet-move-cursor-after-expanding t)
 '(emmet-move-cursor-between-quotes t)
 '(evil-mode-line-format (quote (after)))
 '(evil-toggle-key "C-c e")
 '(exec-path-from-shell-arguments (quote ("-l")))
 '(fill-column 80)
 '(flycheck-disabled-checkers (quote (emacs-lisp-checkdoc)))
 '(flycheck-indication-mode (quote left-fringe))
 '(flycheck-ruby-executable "/Users/aurelienbottazini/.rbenv/shims/ruby")
 '(flycheck-ruby-rubocop-executable "/Users/aurelienbottazini/.rbenv/shims/rubocop")
 '(grep-command "grep  -nH -e")
 '(grep-find-command (quote ("find . -type f -exec grep  -nH -e  {} +" . 35)))
 '(grep-find-ignored-directories
   (quote
    ("SCCS" "RCS" "CVS" "MCVS" ".src" ".svn" ".git" ".hg" ".bzr" "_MTN" "_darcs" "{arch}" "node_modules" "vendor")))
 '(grep-find-ignored-files
   (quote
    (".#*" "*.o" "*~" "*.bin" "*.lbin" "*.so" "*.a" "*.ln" "*.blg" "*.bbl" "*.elc" "*.lof" "*.glo" "*.idx" "*.lot" "*.fmt" "*.tfm" "*.class" "*.fas" "*.lib" "*.mem" "*.x86f" "*.sparcf" "*.dfsl" "*.pfsl" "*.d64fsl" "*.p64fsl" "*.lx64fsl" "*.lx32fsl" "*.dx64fsl" "*.dx32fsl" "*.fx64fsl" "*.fx32fsl" "*.sx64fsl" "*.sx32fsl" "*.wx64fsl" "*.wx32fsl" "*.fasl" "*.ufsl" "*.fsl" "*.dxl" "*.lo" "*.la" "*.gmo" "*.mo" "*.toc" "*.aux" "*.cp" "*.fn" "*.ky" "*.pg" "*.tp" "*.vr" "*.cps" "*.fns" "*.kys" "*.pgs" "*.tps" "*.vrs" "*.pyc" "*.pyo" "GTAGS" "GPATH" "GRTAGS")))
 '(grep-find-template
   "find <D> <X> -type f <F> -exec grep <C> -nH -e <R> \\{\\} +")
 '(hl-sexp-background-color "#efebe9")
 '(ido-enable-flex-matching t)
 '(indicate-buffer-boundaries (quote left))
 '(js-indent-level 2)
 '(js-switch-indent-offset 2)
 '(js2-basic-offset 2)
 '(js2-bounce-indent-p t)
 '(js2-indent-switch-body t)
 '(js2-mode-show-parse-errors nil)
 '(js2-mode-show-strict-warnings nil)
 '(js2r-prefered-quote-type 2)
 '(jscs-command "jscs")
 '(json-reformat:indent-width 2)
 '(less-css-compile-at-save t)
 '(linum-relative-current-symbol "" t)
 '(magit-git-executable "/usr/local/bin/git")
 '(neo-window-fixed-size nil)
 '(neo-window-width 50)
 '(org-agenda-files (quote ("~/Dropbox/org/gtd.org")))
 '(org-babel-js-cmd "org-babel-node --presets es2015,react,stage-2")
 '(org-bullets-bullet-list (quote ("•" "†" "‡")))
 '(org-confirm-babel-evaluate nil)
 '(org-hide-leading-stars t)
 '(org-indent-mode-turns-off-org-adapt-indentation nil)
 '(package-selected-packages
   (quote
    (cider clojure-mode-extra-font-locking clojure-mode restclient synosaurus writegood-mode langtool dumb-jump emamux projectile expand-region git-link evil-leader key-chord multiple-cursors emojify emacs-emojify counsel ivy persp-mode fill-column-indicator all-the-icons neotree switch-window highlight-indent-guides highlight-ident-guides highlight-ident dired-subtree slim-mode 0blayout import-js aggressive-indent column-enforce-mode tern-auto-complete auto-complete ruby-end vue-mode hlinum evil-smartparens smartparens helm-gtags company-restclient company-tern helm-projectile helm ag writeroom-mode palimpsest evil-magit magit paredit rainbow-mode origami windresize counsel-projectile which-key flycheck cypher-mode elm-mode dockerfile-mode haml-mode rspec-mode ruby-interpolation bundler enh-ruby-mode yaml-mode typescript-mode highlight-indentation coffee-mode json-mode babel-repl tern js2-refactor markdown-mode fish-mode less-css-mode litable web-mode emmet-mode relative-line-numbers js2-mode diff-hl web-beautify evil-matchit evil-search-highlight-persist evil-indent-plus evil-visualstar evil-commentary evil-surround evil-multiedit htmlize org-bullets smooth-scrolling exec-path-from-shell use-package)))
 '(prettier-target-mode "js2-mode")
 '(projectile-completion-system (quote ivy))
 '(projectile-enable-caching t)
 '(projectile-tags-backend (quote ggtags))
 '(projectile-tags-command "git ls-files | gtags --gtagslabel pygments")
 '(rainbow-html-colors-major-mode-list
   (quote
    (html-mode css-mode php-mode nxml-mode xml-modei scss-mode web-mode)))
 '(ruby-deep-arglist nil)
 '(safe-local-variable-values
   (quote
    ((eval when
           (require
            (quote rainbow-mode)
            nil t)
           (rainbow-mode 1)))))
 '(send-mail-function (quote smtpmail-send-it))
 '(sgml-attribute-offset 2)
 '(sgml-basic-offset 0)
 '(show-paren-mode t)
 '(show-paren-style (quote parenthesis))
 '(sml/mode-width (quote right))
 '(sml/name-width 44)
 '(sml/vc-mode-show-backend nil)
 '(temporary-file-directory "~/emacs_tmp/")
 '(tool-bar-mode nil)
 '(typescript-indent-level 2)
 '(visible-cursor t)
 '(visual-line-fringe-indicators (quote (left-curly-arrow right-curly-arrow)))
 '(vue-modes
   (quote
    ((:type template :name nil :mode web-mode)
     (:type template :name html :mode html-mode)
     (:type template :name jade :mode jade-mode)
     (:type template :name pug :mode pug-mode)
     (:type script :name nil :mode js2-mode)
     (:type script :name js :mode js2-mode)
     (:type script :name es6 :mode js2-mode)
     (:type script :name babel :mode js2-mode)
     (:type script :name coffee :mode coffee-mode)
     (:type script :name typescript :mode typescript-mode)
     (:type style :name nil :mode css-mode)
     (:type style :name css :mode css-mode)
     (:type style :name stylus :mode stylus-mode)
     (:type style :name less :mode less-css-mode)
     (:type style :name scss :mode scss-mode)
     (:type style :name sass :mode sass-mode))))
 '(web-mode-code-indent-offset 2)
 '(web-mode-css-indent-offset 2)
 '(web-mode-enable-auto-indentation nil)
 '(web-mode-enable-auto-quoting nil)
 '(web-mode-markup-indent-offset 2))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
