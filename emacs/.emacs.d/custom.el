(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(coffee-tab-width 2)
 '(company-dict-enable-fuzzy t)
 '(company-minimum-prefix-length 2)
 '(company-require-match nil)
 '(context-coloring-syntactic-comments nil)
 '(context-coloring-syntactic-strings nil)
 '(coverlay-mode t)
 '(coverlay:tested-line-background-color "#e4f4e9")
 '(coverlay:untested-line-background-color "#ffcfd8")
 '(custom-safe-themes
   (quote
    ("cc0dbb53a10215b696d391a90de635ba1699072745bf653b53774706999208e3" "3e335d794ed3030fefd0dbd7ff2d3555e29481fe4bbb0106ea11c660d6001767" "fa2b58bb98b62c3b8cf3b6f02f058ef7827a8e497125de0254f56e373abee088" default)))
 '(deft-new-file-format "%Y-%m-%dT%H:%M")
 '(deft-use-filename-as-title t)
 '(deft-use-filter-string-for-filename t)
 '(display-line-numbers nil)
 '(display-line-numbers-type (quote visual))
 '(dumb-jump-force-searcher (quote ag))
 '(dumb-jump-mode t)
 '(emamux:default-orientation (quote vertical))
 '(emamux:use-nearest-pane t)
 '(flycheck-disabled-checkers (quote (c/c++-gcc)))
 '(flycheck-indication-mode nil)
 '(global-flycheck-mode t)
 '(indicate-buffer-boundaries (quote left))
 '(indicate-empty-lines nil)
 '(ispell-program-name "/usr/bin/hunspell")
 '(ivy-preferred-re-builders
   (quote
    ((ivy--regex-plus . "ivy")
     (ivy--regex-ignore-order . "order")
     (ivy--regex-fuzzy . "fuzzy"))))
 '(mu4e-update-interval 900)
 '(mu4e-use-fancy-chars t)
 '(org-agenda-files
   (quote
    ("~/Dropbox/org/refile-beorg.org" "~/Dropbox/org/GTD.org")))
 '(org-bullets-bullet-list (quote ("⭐" "◾" "◽")))
 '(org-html-doctype "html5")
 '(org-html-head-include-default-style nil)
 '(org-html-head-include-scripts nil)
 '(org-html-html5-fancy t)
 '(org-html-indent t)
 '(org-log-into-drawer t)
 '(org-modules
   (quote
    (org-bbdb org-bibtex org-docview org-gnus org-habit org-info org-irc org-mhe org-rmail org-w3m)))
 '(package-selected-packages
   (quote
    (ruby-additional counsel-etags rust-mode find-file-in-project noflet lsp-ui lsp-css company-lsp lsp-javascript-typescript lsp-mode lsp-ruby js-comint skewer-mode nodejs-repl slime-js slime markdown-mode palimpsest-mode palimpsest palimpset-mode paredit 0xc evil-fringe-mark evil-fringe-marks enh-ruby-mode 0blayout avy org-bullets web-beautify graphql-mode haskell-mode flycheck drag-stuff col-highlight crosshairs rg eacl highlight-indentation evil-multiedit coverlay coverage coverage-mode evil-collection eyebrowse telephone-line magithub git-timemachine dash-at-point diminish yaml-mode lispyville x-clip xclip evil-mc multiple-cursors evil-lispy lispy windresize dumb-jump expand-region origami company-dict ac-js2 auto-complete indium less-css-mode sass-mode scss-mode dockerfile-mode emmet-mode yatemplate yasnippet company deft cider clojure-mode which-key wgrep rainbow-mode minimal-theme rspec-mode ruby-end ruby-interpolation bundler paredit-everywhere spacemacs-theme ivy-hydra hydra counsel-projectile ace-window iedit emamux typescript-mode coffee-mode json-mode context-coloring prettier-js import-js js2-mode web-mode diff-hl fullframe evil-magit git-link magit highlight-parentheses projectile evil-search-highlight-persist evil-matchit evil-indent-plus evil-visualstar evil-commentary evil-surround evil-numbers evil exec-path-from-shell counsel use-package)))
 '(projectile-tags-command "git ls-files | /usr/local/bin/ctags -e -L -")
 '(ruby-align-chained-calls t)
 '(ruby-align-to-stmt-keywords t)
 '(ruby-deep-arglist t)
 '(ruby-deep-indent-paren (quote (40 91 93 123 125)))
 '(ruby-deep-indent-paren-style (quote space))
 '(safe-local-variable-values
   (quote
    ((eval progn
           (require
            (quote find-file-in-project))
           (setq ffip-prune-patterns
                 (\`
                  ("*/public/packs*/*"
                   (\,@ ffip-prune-patterns)))))
     (ffip-find-options . "-not -size +64k -not -iwholename './target/*'")
     (ffip-find-options . "-not -size +64k -not -iwholename './target/debug/*'")
     (org-confirm-babel-evaluate))))
 '(show-paren-when-point-in-periphery t)
 '(show-paren-when-point-inside-paren t)
 '(truncate-partial-width-windows nil)
 '(web-mode-code-indent-offset 0)
 '(web-mode-css-indent-offset 0))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:inherit nil :stipple nil :background "#f1f2f1" :foreground "#000000" :inverse-video nil :box nil :strike-through nil :overline nil :underline nil :slant normal :weight normal :height 120 :width normal :foundry "default" :family "default"))))
 '(bold ((t (:weight bold))))
 '(bold-italic ((t (:slant italic :weight bold))))
 '(context-coloring-level-1-face ((t (:foreground "#3a499c"))))
 '(context-coloring-level-2-face ((t (:foreground "#546758"))))
 '(context-coloring-level-3-face ((t (:foreground "#bc3e44"))))
 '(context-coloring-level-4-face ((t (:foreground "#4982cf"))))
 '(context-coloring-level-5-face ((t (:foreground "#885a61"))))
 '(context-coloring-level-6-face ((t (:foreground "#65428a"))))
 '(context-coloring-level-7-face ((t (:foreground "#4c4e56"))))
 '(cursor ((t (:background "#f56d9e"))))
 '(custom-variable-tag ((t (:foreground "blue1" :weight bold))))
 '(diff-hl-change ((t (:background "#adcff1" :foreground "#3a499c"))))
 '(diff-hl-delete ((t (:background "#ffcfd8" :foreground "#bc3e44"))))
 '(diff-hl-insert ((t (:background "#e4f4e9" :foreground "#546758"))))
 '(error ((t (:foreground "#f65058" :weight bold))))
 '(evil-search-highlight-persist-highlight-face ((t (:background "#fccf61"))))
 '(flycheck-info ((t (:background "#ffcfd8"))))
 '(flycheck-warning ((t (:background "#ffcfd8"))))
 '(font-lock-comment-face ((t (:foreground "#939598" :slant italic))))
 '(font-lock-constant-face ((t (:foreground "#69615f"))))
 '(font-lock-function-name-face ((t (:weight bold))))
 '(font-lock-keyword-face ((t (:foreground "#4c4e56" :weight bold))))
 '(font-lock-string-face ((t (:slant italic))))
 '(font-lock-type-face ((t nil)))
 '(font-lock-variable-name-face ((t nil)))
 '(fringe ((t (:background "#dad9d6"))))
 '(haskell-keyword-face ((t (:inherit font-lock-keyword-face))))
 '(hl-line ((t (:background "#dad9d6"))))
 '(iedit-occurrence ((t (:background "#ffaaff"))))
 '(isearch ((t (:background "#fccf61" :foreground "#4c4e56"))))
 '(line-number ((t (:background "#dad9d6" :foreground "#939598"))))
 '(line-number-current-line ((t (:background "#dad9d6" :foreground "black"))))
 '(link ((t (:foreground "RoyalBlue3" :underline t :slant italic))))
 '(linum ((t (:background "#dad9d6" :foreground "#4c4e56"))))
 '(magit-branch-current ((t (:inherit magit-branch-local :box 1 :weight bold))))
 '(magit-branch-local ((t (:foreground "SkyBlue4" :weight bold))))
 '(magit-branch-remote ((t (:foreground "DarkOliveGreen4" :weight bold))))
 '(magit-branch-remote-head ((t (:inherit magit-branch-remote :box 1 :weight bold))))
 '(magit-diff-file-heading ((t (:weight bold))))
 '(magit-section-heading ((t (:foreground "DarkGoldenrod4" :weight bold))))
 '(magit-section-highlight ((t (:background "grey95"))))
 '(magit-section-secondary-heading ((t (:weight bold))))
 '(magit-signature-bad ((t (:foreground "red" :weight bold))))
 '(magit-tag ((t (:foreground "Goldenrod4" :weight bold))))
 '(mode-line ((t (:background "#fccf61"))))
 '(mode-line-buffer-id ((t (:slant italic :weight bold))))
 '(mode-line-emphasis ((t (:weight bold))))
 '(mode-line-inactive ((t (:background "#dad9d6" :foreground "#4c4e56"))))
 '(mu4e-attach-number-face ((t (:inherit font-lock-variable-name-face :weight bold))))
 '(mu4e-context-face ((t (:inherit mu4e-title-face :weight bold))))
 '(mu4e-flagged-face ((t (:inherit font-lock-constant-face :weight bold))))
 '(mu4e-header-highlight-face ((t (:inherit region :underline t :weight bold))))
 '(mu4e-header-key-face ((t (:inherit message-header-name :weight bold))))
 '(mu4e-modeline-face ((t (:inherit font-lock-string-face :weight bold))))
 '(mu4e-region-code ((t (:background "#e4f4e9"))))
 '(mu4e-title-face ((t (:inherit font-lock-type-face :weight bold))))
 '(mu4e-unread-face ((t (:inherit font-lock-keyword-face :weight bold))))
 '(mu4e-url-number-face ((t (:inherit font-lock-constant-face :weight bold))))
 '(mu4e-warning-face ((t (:inherit font-lock-warning-face :slant italic :weight bold))))
 '(org-agenda-date-today ((t (:inherit org-agenda-date :slant italic :weight bold))))
 '(org-agenda-date-weekend ((t (:inherit org-agenda-date :weight bold))))
 '(org-agenda-structure ((t (:foreground "#4982cf"))))
 '(org-block ((t (:background "#dad9d6"))))
 '(org-column-title ((t (:background "grey90" :underline t :weight bold))))
 '(org-date ((t (:foreground "#65428a" :underline t :slant italic))))
 '(org-document-title ((t (:foreground "midnight blue" :weight bold))))
 '(org-done ((t (:foreground "#34855b" :weight bold))))
 '(org-drawer ((t (:foreground "#3a499c"))))
 '(org-footnote ((t (:foreground "#65428a" :underline t))))
 '(org-level-1 ((t (:inherit outline-1 :foreground "#bc3e44" :height 1.3))))
 '(org-level-2 ((t (:inherit outline-2 :height 1.0))))
 '(org-level-3 ((t (:inherit outline-3))))
 '(org-list-dt ((t (:weight normal))))
 '(org-sexp-date ((t (:foreground "#65428a"))))
 '(org-tag ((t (:background "#c5f2e6" :weight bold))))
 '(org-todo ((t (:background "#fccf61" :foreground "black" :slant italic :weight bold))))
 '(outline-2 ((t (:inherit font-lock-variable-name-face :foreground "#3a499c"))))
 '(region ((t (:background "#adcff1"))))
 '(secondary-selection ((t (:background "#fff166"))))
 '(show-paren-match ((t (:background "#97d88a" :foreground "#4c4e56"))))
 '(show-paren-mismatch ((t (:background "#f65058"))))
 '(whitespace-indentation ((t (:background "#f79b2f" :foreground "black"))))
 '(whitespace-space-after-tab ((t (:background "#fccf61" :foreground "black"))))
 '(whitespace-space-before-tab ((t (:background "#f79b2f" :foreground "black"))))
 '(whitespace-tab ((t (:background "#f65058" :foreground "black")))))
