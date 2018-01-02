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

  (setq company-backends '(company-files (company-dabbrev-code company-yasnippet)))
  )

(provide 'init-completion)
