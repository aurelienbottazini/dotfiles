(defun imenu-setup ()
  (progn
    (setq imenu-case-fold-search nil)
    (setq imenu-auto-rescan t)
    (setq imenu-space-replacement " ")
    (setq css-indent-offset 2)
    (imenu-add-menubar-index)
    ))
(defun my-css-mode-setup ()
  (setq imenu-generic-expression
        '(("Selectors" "^[[:blank:]]*\\(.*[^ ]\\) *{" 1)))
  (imenu-setup))

(add-hook 'css-mode-hook 'my-css-mode-setup)

(use-package scss-mode
  :config
  (add-hook 'scss-mode-hook '(lambda ()
                               (setq imenu-generic-expression
                                     '(("Selectors" "^[[:blank:]]*\\(.*[^ ]\\) *{" 1)))
                               (imenu-setup))))

(use-package sass-mode
  :mode "\\.sass\\'"
  :config
  (add-hook 'sass-mode-hook
            '(lambda ()
               (setq imenu-generic-expression
                     '(("Imports" "@import\\(.*[^ ]\\)" 1)))
               (imenu-setup))
            )

  (use-package highlight-indent-guides
    :config
    (setq highlight-indent-guides-method 'character))
  (add-hook 'sass-mode-hook 'my-css-mode-setup)
  (add-hook 'sass-mode-hook 'highlight-indent-guides-mode))

(use-package less-css-mode
  :mode "\\.less\\'"
  )

(provide 'init-css)
