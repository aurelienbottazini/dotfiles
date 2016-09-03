(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ag-highlight-search t)
 '(ansi-color-names-vector
   ["#3F3F3F" "#CC9393" "#7F9F7F" "#F0DFAF" "#8CD0D3" "#DC8CC3" "#93E0E3" "#DCDCCC"])
 '(blink-cursor-mode nil)
 '(blink-matching-paren t)
 '(coffee-tab-width 2)
 '(column-highlight-mode nil)
 '(column-number-mode t)
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
 '(elscreen-display-tab t)
 '(elscreen-tab-display-control nil)
 '(elscreen-tab-display-kill-screen nil)
 '(emamux:use-nearest-pane nil)
 '(emmet-indent-after-insert t)
 '(emmet-move-cursor-after-expanding t)
 '(emmet-move-cursor-between-quotes t)
 '(emojify-display-style (quote unicode) t)
 '(evil-toggle-key "C-c e")
 '(exec-path-from-shell-arguments (quote ("-l")))
 '(fci-rule-color "#383838")
 '(flycheck-indication-mode (quote left-fringe))
 '(flycheck-ruby-executable "/usr/local/var/rbenv/shims/ruby")
 '(flycheck-ruby-rubocop-executable "/usr/local/var/rbenv/shims/rubocop")
 '(global-emojify-mode t t)
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
 '(helm-grep-file-path-style (quote absolute))
 '(helm-grep-ignored-directories
   (quote
    ("SCCS" "RCS" "CVS" "MCVS" ".svn" ".git" ".hg" ".bzr" "_MTN" "_darcs" "{arch}" ".gvfs" "node_modules" "vendor")))
 '(helm-grep-ignored-files
   (quote
    (".#*" "*.o" "*~" "*.bin" "*.lbin" "*.so" "*.a" "*.ln" "*.blg" "*.bbl" "*.elc" "*.lof" "*.glo" "*.idx" "*.lot" "*.fmt" "*.tfm" "*.class" "*.fas" "*.lib" "*.mem" "*.x86f" "*.sparcf" "*.dfsl" "*.pfsl" "*.d64fsl" "*.p64fsl" "*.lx64fsl" "*.lx32fsl" "*.dx64fsl" "*.dx32fsl" "*.fx64fsl" "*.fx32fsl" "*.sx64fsl" "*.sx32fsl" "*.wx64fsl" "*.wx32fsl" "*.fasl" "*.ufsl" "*.fsl" "*.dxl" "*.lo" "*.la" "*.gmo" "*.mo" "*.toc" "*.aux" "*.cp" "*.fn" "*.ky" "*.pg" "*.tp" "*.vr" "*.cps" "*.fns" "*.kys" "*.pgs" "*.tps" "*.vrs" "*.pyc" "*.pyo" "GTAGS" "GPATH" "GRTAGS")))
 '(helm-gtags-highlight-candidate t)
 '(helm-gtags-use-input-at-cursor t)
 '(ido-enable-flex-matching t)
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
 '(nrepl-message-colors
   (quote
    ("#CC9393" "#DFAF8F" "#F0DFAF" "#7F9F7F" "#BFEBBF" "#93E0E3" "#94BFF3" "#DC8CC3")))
 '(org-agenda-files (quote ("~/Dropbox/org/gtd.org")))
 '(org-babel-js-cmd "org-babel-node --presets es2015,react,stage-2")
 '(org-bullets-bullet-list (quote ("•" "†" "‡")))
 '(org-hide-leading-stars t)
 '(org-indent-mode-turns-off-org-adapt-indentation nil)
 '(package-selected-packages
   (quote
    (leuven-theme dumb-jump flycheck-pos-tip-mode flycheck-status-emoji flycheck-pos-tip flycheck evil-leader pbcopy expand-region neo-tree wgrep column-highlight-mode column-highlight elscreen zenburn-theme zoom-window yatemplate yaml-mode writeroom-mode writegood-mode wrap-region windresize which-key web-mode web-beautify use-package typescript-mode synosaurus smart-mode-line-powerline-theme scss-mode sass-mode ruby-interpolation rspec-mode relative-line-numbers rainbow-mode rainbow-identifiers rainbow-delimiters projectile-rails project-explorer palimpsest org-bullets ob-typescript neotree markdown-mode load-theme-buffer-local less-css-mode langtool key-chord json-mode js3-mode js2-refactor htmlize highlight-indentation helm-swoop helm-projectile helm-mu helm-gtags helm-ag guide-key git-link ggtags flycheck-typescript-tslint fish-mode fill-column-indicator exec-path-from-shell evil-visualstar evil-surround evil-search-highlight-persist evil-org evil-multiedit evil-matchit evil-magit evil-indent-plus evil-commentary enh-ruby-mode emmet-mode dockerfile-mode deft company-tern coffee-mode bundler babel-repl avy all-ext ag)))
 '(pdf-view-midnight-colors (quote ("#DCDCCC" . "#383838")))
 '(ruby-deep-arglist nil)
 '(send-mail-function (quote smtpmail-send-it))
 '(show-paren-mode t)
 '(show-paren-style (quote parenthesis))
 '(sml/mode-width (quote right))
 '(sml/name-width 44)
 '(sml/vc-mode-show-backend nil)
 '(smtpmail-smtp-server "mail.messagingengine.com")
 '(smtpmail-smtp-service 587)
 '(temporary-file-directory "~/emacs_tmp/")
 '(tool-bar-mode nil)
 '(typescript-indent-level 2)
 '(vc-annotate-background "#2B2B2B")
 '(vc-annotate-color-map
   (quote
    ((20 . "#BC8383")
     (40 . "#CC9393")
     (60 . "#DFAF8F")
     (80 . "#D0BF8F")
     (100 . "#E0CF9F")
     (120 . "#F0DFAF")
     (140 . "#5F7F5F")
     (160 . "#7F9F7F")
     (180 . "#8FB28F")
     (200 . "#9FC59F")
     (220 . "#AFD8AF")
     (240 . "#BFEBBF")
     (260 . "#93E0E3")
     (280 . "#6CA0A3")
     (300 . "#7CB8BB")
     (320 . "#8CD0D3")
     (340 . "#94BFF3")
     (360 . "#DC8CC3"))))
 '(vc-annotate-very-old-color "#DC8CC3")
 '(visual-line-fringe-indicators (quote (left-curly-arrow right-curly-arrow)))
 '(web-mode-code-indent-offset 2)
 '(web-mode-css-indent-offset 2)
 '(web-mode-markup-indent-offset 2)
 '(zoom-window-mode-line-color "#4c7073")
 '(zoom-window-use-elscreen nil))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(col-highlight ((t (:inherit hl-line))))
 '(elscreen-tab-background-face ((t (:background "#4f4f4f" :foreground "#dcdcdc"))))
 '(elscreen-tab-current-screen-face ((t (:background "#6f6f6f" :foreground "#dcdcdc" :weight bold))))
 '(elscreen-tab-other-screen-face ((t (:background "#4f4f4f" :foreground "#dcdcdc"))))
 '(evil-search-highlight-persist-highlight-face ((t (:background "#dc8cc3" :foreground "#2b2b2b"))))
 '(flycheck-error ((t (:foreground "#dfaf8f" :underline (:color foreground-color :style wave) :weight bold))))
 '(font-lock-comment-face ((t (:slant italic))))
 '(font-lock-string-face ((t (:foreground "#CC9393" :slant italic))))
 '(highlight-indentation-current-column-face ((t (:background "#383838"))))
 '(highlight-indentation-face ((t (:background "#494949"))))
 '(hl-line ((t (:background "#525252"))))
 '(mode-line ((t (:background "#5f5f5f" :foreground "#dcdccc" :inverse-video nil :box (:line-width -1 :style released-button) :height 1.0))))
 '(mode-line-inactive ((t (:background "#494949" :foreground "#5F7F5F" :inverse-video nil :box (:line-width -1 :style released-button)))))
 '(region ((t (:background "#f3e4bd" :foreground "#303030"))))
 '(relative-line-numbers-current-line ((t (:inherit relative-line-numbers :foreground "#94bff3" :weight semi-light))))
 '(term ((t (:inherit default :background "#3f3f3f" :foreground "#d9d9d6"))))
 '(variable-pitch ((t (:height 1.2)))))
