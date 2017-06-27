(use-package paredit
  :diminish paredit-mode
  :config
    (add-hook 'emacs-lisp-mode-hook #'paredit-mode)
    (add-hook 'clojure-mode-hook #'paredit-mode))


(provide 'init-lisp)
