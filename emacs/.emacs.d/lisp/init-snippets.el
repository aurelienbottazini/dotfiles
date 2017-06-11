(use-package yasnippet
  :bind (:map my-leader-map
              ("vs" . yas-describe-tables))
 :diminish yas-minor-mode
 :config
 (setq yas-snippet-dirs
       '("~/.emacs.d/snippets"))
 (yas-global-mode 1)
 (add-hook 'term-mode-hook (lambda()
                             (yas-minor-mode -1)))
 )

(provide 'init-snippets)
