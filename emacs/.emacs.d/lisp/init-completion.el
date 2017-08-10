(use-package company
  :diminish company-mode
  :init
  (add-hook 'after-init-hook 'global-company-mode)
  :config

  (let ((map company-active-map))
    (define-key map (kbd "C-n") 'company-select-next)
    (define-key map (kbd "C-p") 'company-select-previous)
    (define-key map (kbd "C-f") 'company-complete-selection)
    (define-key map (kbd "TAB") 'company-complete-selection)
    (define-key map (kbd "<tab>") 'company-complete-selection)

    )

  (use-package company-tern
    :diminish tern-mode
    )
  (setq company-backends '(company-files (company-capf company-dabbrev-code company-yasnippet company-tern)))
  )

(provide 'init-completion)
