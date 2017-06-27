(use-package clojure-mode
  :mode "\\.clj\\'"
  :config
  (add-hook 'clojure-mode-hook #'paredit-mode)
  (add-hook 'clojure-mode-hook #'subword-mode)
  (add-hook 'clojure-mode-hook #'paredit-mode)
  (add-hook 'clojure-mode-hook #'subword-mode)
  (use-package clojure-mode-extra-font-locking)
  (use-package cider)

  (use-package aggressive-indent
    :config
    (add-hook 'clojure-mode-hook #'aggressive-indent-mode))
  )

(provide 'init-clojure)
