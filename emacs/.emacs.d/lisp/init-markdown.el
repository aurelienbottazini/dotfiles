(use-package markdown-mode
  :mode "\\.md\\'"
  :config
  (add-hook 'markdown-mode-hook 'auto-fill-mode)
  )

(provide 'init-markdown)
