(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(blink-matching-paren (quote jump-offscreen))
 '(company-minimum-prefix-length 2)
 '(custom-safe-themes
   (quote
    ("0809c08440b51a39c77ec5529f89af83ab256a9d48107b088d40098ce322c7d8" "e1ef2d5b8091f4953fe17b4ca3dd143d476c106e221d92ded38614266cea3c8b" "585942bb24cab2d4b2f74977ac3ba6ddbd888e3776b9d2f993c5704aa8bb4739" "8f97d5ec8a774485296e366fdde6ff5589cf9e319a584b845b6f7fa788c9fa9a" default)))
 '(deft-new-file-format "%Y-%m-%dT%H:%M")
 '(deft-use-filename-as-title t t)
 '(deft-use-filter-string-for-filename t t)
 '(display-line-numbers nil)
 '(display-line-numbers-type (quote visual))
 '(dumb-jump-force-searcher (quote ag))
 '(dumb-jump-mode t)
 '(electric-pair-mode nil)
 '(electric-quote-string t)
 '(frame-background-mode (quote light))
 '(global-evil-search-highlight-persist t)
 '(indicate-buffer-boundaries (quote left))
 '(indicate-empty-lines nil)
 '(ispell-highlight-face (quote flyspell-incorrect))
 '(ispell-program-name "/usr/bin/hunspell")
 '(ivy-preferred-re-builders
   (quote
    ((ivy--regex-plus . "ivy")
     (ivy--regex-ignore-order . "order")
     (ivy--regex-fuzzy . "fuzzy"))))
 '(js2-highlight-level 3)
 '(lsp-prefer-flymake :none)
 '(lsp-ui-doc-enable nil)
 '(lsp-ui-doc-use-webkit nil)
 '(lsp-ui-sideline-enable nil)
 '(magit-auto-revert-mode t)
 '(magit-commit-show-diff nil)
 '(menu-bar-mode nil)
 '(org-agenda-files
   (quote
    ("~/Dropbox/org/refile-beorg.org" "~/Dropbox/org/GTD.org")))
 '(org-bullets-bullet-list (quote ("⭐" "◾" "◽")))
 '(org-html-doctype "html5")
 '(org-html-head-include-default-style nil)
 '(org-html-head-include-scripts nil)
 '(org-html-html5-fancy t)
 '(org-html-indent t)
 '(org-html-validation-link nil)
 '(org-log-into-drawer t)
 '(org-modules
   (quote
    (org-bbdb org-bibtex org-docview org-gnus org-habit org-info org-irc org-mhe org-rmail org-w3m)))
 '(org-startup-folded nil)
 '(package-selected-packages
   (quote
    (leuven leuven-theme prettier company-statistics writeroom-mode go-mode org ob-clojurescript writegood-mode writegood osx-dictionary powerthesaurus all-the-icons-dired-mode all-the-icons-dired all-the-icons evil-iedit-state ivy dired-rsync docker xref-js2 posframe js2-refactor ruby-refactor parinfer ace-windows tide forge key-chord synonymous define-word htmlize esup inf-ruby ruby-additional counsel-etags rust-mode find-file-in-project noflet lsp-ui lsp-css company-lsp lsp-javascript-typescript lsp-mode lsp-ruby js-comint skewer-mode nodejs-repl slime-js slime markdown-mode palimpsest-mode palimpsest palimpset-mode paredit 0xc evil-fringe-mark evil-fringe-marks enh-ruby-mode 0blayout avy org-bullets web-beautify graphql-mode haskell-mode flycheck drag-stuff col-highlight crosshairs rg eacl highlight-indentation evil-multiedit coverlay coverage coverage-mode evil-collection eyebrowse telephone-line magithub git-timemachine dash-at-point diminish yaml-mode lispyville x-clip xclip evil-mc multiple-cursors evil-lispy lispy windresize dumb-jump expand-region origami company-dict ac-js2 auto-complete indium less-css-mode sass-mode scss-mode dockerfile-mode emmet-mode yatemplate yasnippet company deft cider clojure-mode which-key wgrep rainbow-mode rspec-mode ruby-end ruby-interpolation bundler paredit-everywhere ivy-hydra hydra counsel-projectile ace-window iedit emamux typescript-mode coffee-mode json-mode context-coloring prettier-js import-js js2-mode web-mode diff-hl fullframe evil-magit git-link magit highlight-parentheses projectile evil-search-highlight-persist evil-matchit evil-indent-plus evil-visualstar evil-commentary evil-surround evil-numbers evil exec-path-from-shell counsel use-package)))
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
                   (\,@ ffip-prune-patterns))))
           (setq prettier-js-command "/home/auray/work/doximity-client-vue/node_modules/.bin/prettier"))
     (compilation-scroll-output
      (quote first-error))
     (compilation-scroll-output t)
     (ffip-project-root . "/home/auray/work/doximity-client-vue/")
     (eval progn
           (require
            (quote find-file-in-project))
           (setq ffip-prune-patterns
                 (\`
                  ("vendor/*"
                   (\,@ ffip-prune-patterns)))))
     (ffip-project-root . "/home/aurelienbottazini/work/doximity-client-vue/")
     (alternative-files-rules
      ("src/\\(.*\\).vue" "test/unit/specs/\\1.spec.js")
      ("test/unit/specs/\\(.*\\).spec.js" "src/\\1.vue")
      ("src/\\(.*\\).js" "test/unit/specs/\\1.spec.js")
      ("test/unit/specs/\\(.*\\).spec.js" "src/\\1.js"))
     (eval add-hook
           (quote after-save-hook)
           (lambda nil
             (org-html-export-to-html t))
           t t)
     (eval progn
           (require
            (quote find-file-in-project))
           (setq ffip-prune-patterns
                 (\`
                  ("*/public/packs*/*"
                   (\,@ ffip-prune-patterns)))))
     (ffip-find-options . "-not -size +64k -not -iwholename './target/*'")
     (ffip-find-options . "-not -size +64k -not -iwholename './target/debug/*'")
     (org-confirm-babel-evaluate))))
 '(scroll-bar-mode nil)
 '(show-paren-when-point-in-periphery t)
 '(show-paren-when-point-inside-paren t)
 '(swiper-goto-start-of-match t)
 '(tool-bar-mode nil)
 '(truncate-partial-width-windows nil)
 '(vc-follow-symlinks t)
 '(web-mode-code-indent-offset 0 t)
 '(web-mode-css-indent-offset 0 t))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:inherit nil :stipple nil :inverse-video nil :box nil :strike-through nil :overline nil :underline nil :slant normal :weight book :height 140 :family "OperatorMono"))))
 '(bold ((t (:weight normal))))
 '(custom-variable-tag ((t (:foreground "blue1" :weight normal))))
 '(error ((t (:foreground "Red1" :weight normal))))
 '(font-lock-comment-face ((t (:foreground "#adaeb0" :slant italic))))
 '(font-lock-warning-face ((t (:inherit error))))
 '(magit-blame-heading ((t (:inherit magit-blame-highlight :slant normal :weight normal))))
 '(magit-diff-file-heading ((t (:weight normal))))
 '(magit-filename ((t (:weight normal))))
 '(magit-section-secondary-heading ((t (:weight normal))))
 '(mode-line-buffer-id ((t (:foreground "black" :slant italic :weight normal))))
 '(org-block ((t (:inherit shadow :background "#f1f2f1"))))
 '(org-document-title ((t (:foreground "midnight blue" :weight normal :height 1.6))))
 '(org-level-1 ((t (:inherit outline-1 :overline nil :slant italic :height 1.6)))))
