(use-package paredit
  :diminish paredit-mode
  :config
  (use-package evil-lispy
    :config
    (add-hook 'emacs-lisp-mode-hook #'evil-lispy-mode)
    (add-hook 'clojure-mode-hook #'evil-lispy-mode)))

(provide 'init-lisp)
