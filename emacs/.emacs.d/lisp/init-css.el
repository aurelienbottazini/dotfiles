(defun my-css-mode-setup ()
  ;; todo adjust for sass
  (setq imenu-generic-expression
        '(("Selectors" "^[[:blank:]]*\\(.*[^ ]\\) *{" 1)))
  (setq imenu-case-fold-search nil)
  (setq imenu-auto-rescan t)
  (setq imenu-space-replacement " ")
  (setq css-indent-offset 2)
  (imenu-add-menubar-index))
(add-hook 'css-mode-hook 'my-css-mode-setup)

(use-package scss-mode
  :config
  (add-hook 'scss-mode-hook 'my-css-mode-setup))

(use-package sass-mode
  :mode "\\.sass\\'"
  :config
  (use-package highlight-indent-guides
    :config
    (setq highlight-indent-guides-method 'character))
  (add-hook 'sass-mode-hook 'my-css-mode-setup)
  (add-hook 'sass-mode-hook 'highlight-indent-guides-mode)
  )

(use-package less-css-mode
  :mode "\\.less\\'"
;;  (add-hook 'less-css-mode-hook 'my-css-mode-setup)
  )

(provide 'init-css)
