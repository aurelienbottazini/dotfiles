(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(blink-matching-paren (quote jump))
 '(coffee-tab-width 2)
 '(company-backends
   (quote
    (company-files
     (company-dabbrev-code company-yasnippet company-tern)
     company-capf)))
 '(company-minimum-prefix-length 2)
 '(context-coloring-javascript-block-scopes t)
 '(context-coloring-syntactic-comments t)
 '(context-coloring-syntactic-strings t)
 '(fill-column 80)
 '(hl-paren-attributes
   (list
    (quote
     (:weight bold))
    (quote
     (:weight bold))
    (quote
     (:weight bold))
    (quote
     (:weight bold))))
 '(hl-paren-colors (quote ("firebrick1" "darkgreen" "purple" "brown")))
 '(neo-window-width 75)
 '(overflow-newline-into-fringe t)
 '(package-selected-packages
   (quote
    (palimpsest palimpsest-mode palimpset-mode writeroom-mode evil-numbers smart-cursor-color evil-multiedit ert-modeline all-the-icons diff-hl flycheck-pos-tip flycheck-pos-tip-mode smex linum-relative relative-line-number relative-line-numbers smart-parens paredit-everywhere smartparens xterm-color xterm tidy wgrep web-mode-hook undo-tree markdown-mode evil-lispy ivy-hydra evil-snipe aggressive-indent aggressive-indent-mode highlight-indent-guides sass-mode rainbow-mode less-css-mode scss-mode drag-stuff move-text web-beautify yatemplate fullframe web-mode vue-mode context-coloring-mode highlight-parentheses highlight-parenthesis company-tern company evil-magit find-file-in-project neotree tern-auto-complete auto-complete exec-path-from-shell highlight-thing highlight-symbol context-coloring typescript-mode highlight-indentation coffee-mode json-mode babel-repl tern js2-refactor import-js js2-mode yasnippet synosaurus writegood-mode langtool which-key cider clojure-mode-extra-font-locking clojure-mode flycheck dockerfile-mode emmet-mode rspec-mode ruby-end ruby-interpolation bundler yaml-mode paredit magit counsel-projectile emamux dumb-jump origami windresize hlinum expand-region ag git-link evil-leader projectile evil-search-highlight-persist fill-column-indicator evil-matchit evil-indent-plus evil-visualstar evil-commentary evil-surround counsel ivy evil use-package)))
 '(projectile-completion-system (quote ivy))
 '(projectile-indexing-method (quote alien))
 '(projectile-other-file-alist
   (quote
    (("cpp" "h" "hpp" "ipp")
     ("ipp" "h" "hpp" "cpp")
     ("hpp" "h" "ipp" "cpp" "cc")
     ("cxx" "h" "hxx" "ixx")
     ("ixx" "h" "hxx" "cxx")
     ("hxx" "h" "ixx" "cxx")
     ("c" "h")
     ("m" "h")
     ("mm" "h")
     ("h" "c" "cc" "cpp" "ipp" "hpp" "cxx" "ixx" "hxx" "m" "mm")
     ("cc" "h" "hh" "hpp")
     ("hh" "cc")
     ("vert" "frag")
     ("frag" "vert")
     (nil "lock" "gpg")
     ("lock" "")
     ("gpg" "")
     ("vue" "spec.js")
     ("spec.js" "vue" "js" "page.vue")
     ("page.vue" "spec.js")))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(context-coloring-level-0-face ((t (:foreground "#0000af"))))
 '(context-coloring-level-1-face ((t (:foreground "#008700"))))
 '(context-coloring-level-2-face ((t (:foreground "#af0000"))))
 '(context-coloring-level-3-face ((t (:foreground "#8700d7"))))
 '(ertml-failing-face ((t (:inherit error :foreground "firebrick"))))
 '(font-lock-comment-face ((t (:foreground "grey" :slant italic))))
 '(font-lock-function-name-face ((t (:foreground "Blue1" :weight bold))))
 '(font-lock-string-face ((t (:foreground "forest green" :slant italic))))
 '(fringe ((t (:background "#ededed"))))
 '(highlight-thing ((t (:background "#d7d7ff" :foreground "purple4" :weight bold))))
 '(hl-line ((t (:background "#fffae1"))))
 '(isearch ((t (:background "yellow" :slant italic :weight bold))))
 '(ivy-current-match ((t (:background "#d7d7ff" :foreground "black"))))
 '(ivy-minibuffer-match-face-2 ((t (:background "#ffff00" :weight bold))))
 '(ivy-prompt-match ((t (:background "#fffae2"))))
 '(lazy-highlight ((t (:background "#ffff00"))))
 '(linum ((t (:inherit (shadow default) :background "#ededed" :width normal))))
 '(linum-relative-current-face ((t (:inherit linum :foreground "black" :background "#fffae1" :weight bold))))
 '(mmm-default-submode-face ((t (:background "#f4f4f4"))))
 '(mode-line ((t (:background "#87afff" :foreground "#2b2b2b" :box (:line-width 2 :color "#87afff")))))
 '(mode-line-buffer-id ((t (:foreground "#2b2b2b" :slant italic :weight bold))))
 '(mode-line-inactive ((t (:inherit mode-line :background "#ededed" :foreground "#2b2b2b" :box (:line-width 2 :color "#e4e4e4") :weight light))))
 '(outline-1 ((t (:inherit font-lock-function-name-face :weight bold :height 1.2))))
 '(region ((t (:background "#ffd787"))))
 '(vertical-border ((t (:background "#d0d0d0" :foreground "#d0d0d0")))))
