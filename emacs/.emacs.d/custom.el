(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ag-highlight-search t)
 '(ansi-color-faces-vector
   [default default default italic underline success warning error])
 '(blink-cursor-mode nil)
 '(blink-matching-paren t)
 '(coffee-tab-width 2)
 '(column-highlight-mode nil)
 '(column-number-mode t)
 '(company-backends (quote ((company-tern company-dabbrev-code company-files))))
 '(company-idle-delay 0.2)
 '(crosshairs-mode nil)
 '(custom-safe-themes
   (quote
    ("8db4b03b9ae654d4a57804286eb3e332725c84d7cdab38463cb6b97d5762ad26" "4aee8551b53a43a883cb0b7f3255d6859d766b6c5e14bcb01bed572fcbef4328" default)))
 '(deft-directory "/Users/aurelienbottazini/Dropbox/org")
 '(deft-recursive t)
 '(deft-use-filename-as-title t)
 '(ediff-window-setup-function (quote ediff-setup-windows-plain))
 '(electric-pair-mode nil)
 '(emamux:use-nearest-pane nil)
 '(emmet-indent-after-insert t)
 '(emmet-move-cursor-after-expanding t)
 '(emmet-move-cursor-between-quotes t)
 '(evil-mode-line-format (quote (after)))
 '(evil-toggle-key "C-c e")
 '(exec-path-from-shell-arguments (quote ("-l")))
 '(flycheck-indication-mode (quote left-fringe))
 '(flycheck-ruby-executable "/usr/local/var/rbenv/shims/ruby")
 '(flycheck-ruby-rubocop-executable "/usr/local/var/rbenv/shims/rubocop")
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
    (evil-paredit-mode evil-paredit paredit magit helm-ag all-the-icons diff-hl counsel-projectile unicode-fonts smart-mode-line-powerline airline-themes counsel swoop find-file-in-project zenburn color-theme-sanityinc-tomorrow cypher-mode hyde origami twilight-anti-bright-theme mu4e context-coloring leuven-theme dumb-jump flycheck-pos-tip-mode flycheck-status-emoji flycheck-pos-tip flycheck evil-leader pbcopy expand-region neo-tree wgrep column-highlight-mode column-highlight elscreen zenburn-theme zoom-window yatemplate yaml-mode writeroom-mode writegood-mode wrap-region windresize which-key web-mode web-beautify use-package typescript-mode synosaurus smart-mode-line-powerline-theme scss-mode sass-mode ruby-interpolation rspec-mode relative-line-numbers rainbow-mode rainbow-identifiers rainbow-delimiters projectile-rails project-explorer palimpsest org-bullets ob-typescript neotree markdown-mode load-theme-buffer-local less-css-mode langtool key-chord json-mode js3-mode js2-refactor htmlize highlight-indentation helm-swoop helm-projectile helm-gtags guide-key git-link ggtags flycheck-typescript-tslint fish-mode fill-column-indicator exec-path-from-shell evil-visualstar evil-surround evil-search-highlight-persist evil-org evil-multiedit evil-matchit evil-magit evil-indent-plus evil-commentary enh-ruby-mode emmet-mode dockerfile-mode deft company-tern coffee-mode bundler babel-repl avy all-ext ag)))
 '(powerline-default-separator (quote utf-8))
 '(powerline-utf-8-separator-left 2039)
 '(powerline-utf-8-separator-right 2039)
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
 '(web-mode-code-indent-offset 2)
 '(web-mode-css-indent-offset 2)
 '(web-mode-markup-indent-offset 2))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(col-highlight ((t (:inherit hl-line))))
 '(hl-line ((t (:background "#4f4f4f"))))
 '(mode-line ((t (:background "#656555" :foreground "#dcdcc" :box (:line-width -1 :style released-button)))))
 '(mode-line-buffer-id ((t (:slant italic :weight bold))))
 '(mode-line-inactive ((t (:background "#4f4f4f" :foreground "#5F7F5F" :box (:line-width -1 :style released-button)))))
 '(region ((t (:background "#94bff3" :foreground "#2b2b2b"))))
 '(relative-line-numbers ((t (:inherit linum :background "#494949"))))
 '(relative-line-numbers-current-line ((t (:inherit relative-line-numbers :background "#94BFF3" :foreground "#2b2b2b")))))
