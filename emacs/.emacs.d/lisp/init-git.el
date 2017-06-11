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
  )

(vc-mode-line t)

(provide 'init-git)
