(use-package emmet-mode
  :mode "\\.vue\\'"
  :mode "\\.html\\'"
  :mode "\\.htm\\'"
  :mode "\\.css\\'"
  :mode "\\.scss\\'"
  :mode "\\.sass\\'"
  :mode "\\.jsx\\'"
  :diminish emmet-mode
  :config
  (progn
    (evil-define-key 'insert emmet-mode-keymap (kbd "C-j") 'emmet-expand-line)
    (evil-define-key 'emacs emmet-mode-keymap (kbd "C-j") 'emmet-expand-line))

  (add-hook 'css-mode-hook
            (lambda ()
              (emmet-mode)
              (setq emmet-expand-jsx-className? nil)
              ))

  (add-hook 'sgml-mode-hook
            (lambda ()
              (emmet-mode)
              (setq emmet-expand-jsx-className? nil)
              ))


  )

(provide 'init-emmet)
