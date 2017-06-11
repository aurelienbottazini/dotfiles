(use-package web-mode
  :mode "\\.html\\'"
  :config
  (add-hook 'web-mode-hook #'emmet-mode)
  )

(provide 'init-html)
