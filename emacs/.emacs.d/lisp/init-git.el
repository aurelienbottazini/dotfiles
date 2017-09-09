(use-package magit
  :bind (:map my-leader-map
              ("gb" . magit-blame)
              ("gs" . magit-status)
              ("gh" . magit-log-buffer-file))
  :config
  (use-package git-link
    :bind (:map my-leader-map
                ("gl" . git-link)))
  (use-package evil-magit)
  (use-package fullframe
    :config
    (fullframe magit-status magit-mode-quit-window))

  (use-package diff-hl
    :config
    (add-hook 'prog-mode-hook 'diff-hl-mode)
    (add-hook 'magit-post-refresh-hook 'diff-hl-magit-post-refresh)
    )

  )

(vc-mode-line t)

(provide 'init-git)
