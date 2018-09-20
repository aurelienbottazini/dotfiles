(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(coffee-tab-width 2)
 '(company-minimum-prefix-length 2)
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
 '(display-line-numbers (quote relative))
 '(display-line-numbers-type (quote visual))
 '(dumb-jump-force-searcher (quote ag))
 '(dumb-jump-mode t)
 '(flycheck-indication-mode nil)
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
    ("~/Dropbox/org/refile-beorg.org" "~/Dropbox/org/inbox.org" "~/Dropbox/org/GTD.org")))
 '(org-bullets-bullet-list (quote ("⭐" "◾" "◽")))
 '(org-log-into-drawer t)
 '(org-modules
   (quote
    (org-bbdb org-bibtex org-docview org-gnus org-habit org-info org-irc org-mhe org-rmail org-w3m)))
 '(package-selected-packages
   (quote
    (js-comint skewer-mode nodejs-repl slime-js slime markdown-mode palimpsest-mode palimpsest palimpset-mode paredit 0xc evil-fringe-mark evil-fringe-marks enh-ruby-mode 0blayout avy org-bullets web-beautify graphql-mode haskell-mode flycheck drag-stuff col-highlight crosshairs rg eacl highlight-indentation evil-multiedit coverlay coverage coverage-mode evil-collection eyebrowse telephone-line magithub git-timemachine dash-at-point diminish yaml-mode lispyville x-clip xclip evil-mc multiple-cursors evil-lispy lispy windresize dumb-jump expand-region origami company-dict ac-js2 auto-complete indium less-css-mode sass-mode scss-mode dockerfile-mode emmet-mode yatemplate yasnippet company deft cider clojure-mode which-key wgrep rainbow-mode minimal-theme rspec-mode ruby-end ruby-interpolation bundler paredit-everywhere spacemacs-theme ivy-hydra hydra counsel-projectile ace-window iedit emamux typescript-mode coffee-mode json-mode context-coloring prettier-js import-js js2-mode web-mode diff-hl fullframe evil-magit git-link magit highlight-parentheses projectile evil-search-highlight-persist evil-matchit evil-indent-plus evil-visualstar evil-commentary evil-surround evil-numbers evil exec-path-from-shell counsel use-package)))
 '(prettier-js-command
   "/Users/aurelienbottazini/.config/yarn/global/node_modules/.bin/prettier")
 '(projectile-tags-command "git ls-files | /usr/local/bin/ctags -e -L -")
 '(ruby-align-to-stmt-keywords t)
 '(ruby-deep-indent-paren-style nil)
 '(show-paren-when-point-in-periphery t)
 '(show-paren-when-point-inside-paren t)
 '(truncate-partial-width-windows nil)
 '(web-mode-code-indent-offset 0 t)
 '(web-mode-css-indent-offset 0 t))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:inherit nil :stipple nil :background "white" :foreground "#000000" :inverse-video nil :box nil :strike-through nil :overline nil :underline nil :slant normal :weight semi-light :height 111 :width normal :foundry "H&Co" :family "Operator Mono"))))
 '(bold ((t (:weight normal))))
 '(bold-italic ((t (:slant italic :weight normal))))
 '(context-coloring-level-1-face ((t (:foreground "#4c4e56"))))
 '(context-coloring-level-2-face ((t (:foreground "#3a499c"))))
 '(context-coloring-level-3-face ((t (:foreground "#bc3e44"))))
 '(context-coloring-level-4-face ((t (:foreground "#34855b"))))
 '(context-coloring-level-5-face ((t (:foreground "#885a61"))))
 '(context-coloring-level-6-face ((t (:foreground "#65428a"))))
 '(context-coloring-level-7-face ((t (:foreground "#4982cf"))))
 '(cursor ((t (:background "#f56d9e"))))
 '(custom-variable-tag ((t (:foreground "blue1" :weight normal))))
 '(diff-hl-change ((t (:background "#adcff1" :foreground "#3a499c"))))
 '(diff-hl-delete ((t (:background "#ffcfd8" :foreground "#bc3e44"))))
 '(diff-hl-insert ((t (:background "#e4f4e9" :foreground "#546758"))))
 '(error ((t (:foreground "#f65058" :weight normal))))
 '(evil-search-highlight-persist-highlight-face ((t (:background "#fff166"))))
 '(flycheck-info ((t (:background "#ffcfd8"))))
 '(flycheck-warning ((t (:background "#ffcfd8"))))
 '(font-lock-comment-face ((t (:foreground "#939598" :slant italic))))
 '(font-lock-constant-face ((t (:foreground "#69615f"))))
 '(font-lock-function-name-face ((t (:weight normal))))
 '(font-lock-keyword-face ((t (:foreground "#4c4e56" :weight normal))))
 '(font-lock-string-face ((t (:slant italic))))
 '(font-lock-type-face ((t nil)))
 '(font-lock-variable-name-face ((t nil)))
 '(fringe ((t (:background "#f1f2f1"))))
 '(haskell-keyword-face ((t (:inherit font-lock-keyword-face))))
 '(hl-line ((t (:background "#f1f2f1"))))
 '(iedit-occurrence ((t (:background "#ffaaff"))))
 '(isearch ((t (:background "#fccf61" :foreground "#4c4e56"))))
 '(line-number ((t (:background "#f1f2f1" :foreground "#939598"))))
 '(line-number-current-line ((t (:background "#f1f2f1" :foreground "black"))))
 '(linum ((t (:background "#dad9d6" :foreground "#4c4e56"))))
 '(magit-branch-current ((t (:inherit magit-branch-local :box 1 :weight normal))))
 '(magit-branch-local ((t (:foreground "SkyBlue4" :weight normal))))
 '(magit-branch-remote ((t (:foreground "DarkOliveGreen4" :weight normal))))
 '(magit-branch-remote-head ((t (:inherit magit-branch-remote :box 1 :weight normal))))
 '(magit-diff-file-heading ((t (:weight normal))))
 '(magit-section-heading ((t (:foreground "DarkGoldenrod4" :weight normal))))
 '(magit-section-highlight ((t (:background "grey95"))))
 '(magit-section-secondary-heading ((t (:weight normal))))
 '(magit-signature-bad ((t (:foreground "red" :weight normal))))
 '(magit-tag ((t (:foreground "Goldenrod4" :weight normal))))
 '(mode-line ((t (:background "#fccf61"))))
 '(mode-line-buffer-id ((t (:slant italic :weight normal))))
 '(mode-line-emphasis ((t (:weight normal))))
 '(mode-line-inactive ((t (:background "#dad9d6" :foreground "#4c4e56"))))
 '(mu4e-attach-number-face ((t (:inherit font-lock-variable-name-face :weight normal))))
 '(mu4e-context-face ((t (:inherit mu4e-title-face :weight normal))))
 '(mu4e-flagged-face ((t (:inherit font-lock-constant-face :weight normal))))
 '(mu4e-header-highlight-face ((t (:inherit region :underline t :weight normal))))
 '(mu4e-header-key-face ((t (:inherit message-header-name :weight normal))))
 '(mu4e-modeline-face ((t (:inherit font-lock-string-face :weight normal))))
 '(mu4e-region-code ((t (:background "#e4f4e9"))))
 '(mu4e-title-face ((t (:inherit font-lock-type-face :weight normal))))
 '(mu4e-unread-face ((t (:inherit font-lock-keyword-face :weight normal))))
 '(mu4e-url-number-face ((t (:inherit font-lock-constant-face :weight normal))))
 '(mu4e-warning-face ((t (:inherit font-lock-warning-face :slant normal :weight normal))))
 '(org-agenda-date-today ((t (:inherit org-agenda-date :slant italic :weight normal))))
 '(org-agenda-date-weekend ((t (:inherit org-agenda-date :weight normal))))
 '(org-agenda-structure ((t (:foreground "#4982cf"))))
 '(org-block ((t (:background "#f1f2f1"))))
 '(org-column-title ((t (:background "grey90" :underline t :weight normal))))
 '(org-date ((t (:foreground "#65428a" :underline t :slant italic))))
 '(org-document-title ((t (:foreground "midnight blue" :weight normal))))
 '(org-done ((t (:foreground "#34855b" :weight normal))))
 '(org-drawer ((t (:foreground "#3a499c"))))
 '(org-footnote ((t (:foreground "#65428a" :underline t))))
 '(org-level-1 ((t (:inherit outline-1 :foreground "#bc3e44" :height 1.3))))
 '(org-level-2 ((t (:inherit outline-2 :height 1.0))))
 '(org-level-3 ((t (:inherit outline-3))))
 '(org-list-dt ((t (:weight normal))))
 '(org-sexp-date ((t (:foreground "#65428a"))))
 '(org-tag ((t (:background "#c5f2e6" :weight normal))))
 '(org-todo ((t (:foreground "#f65058" :weight normal))))
 '(outline-2 ((t (:inherit font-lock-variable-name-face :foreground "#3a499c"))))
 '(region ((t (:background "#adcff1"))))
 '(secondary-selection ((t (:background "#fff166"))))
 '(show-paren-match ((t (:background "#97d88a" :foreground "#4c4e56"))))
 '(show-paren-mismatch ((t (:background "#f65058"))))
 '(whitespace-indentation ((t (:background "#f79b2f" :foreground "black"))))
 '(whitespace-space-after-tab ((t (:background "#fccf61" :foreground "black"))))
 '(whitespace-space-before-tab ((t (:background "#f79b2f" :foreground "black"))))
 '(whitespace-tab ((t (:background "#f65058" :foreground "black")))))
