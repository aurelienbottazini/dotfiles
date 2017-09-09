(use-package flycheck
  :diminish flycheck-mode
  :config
  (setq flycheck-indication-mode nil)
  (add-hook 'after-init-hook #'global-flycheck-mode)
  (flycheck-add-mode 'javascript-eslint 'web-mode)
  (use-package flycheck-pos-tip
    :config
    ;; (with-eval-after-load 'flycheck
    ;;   (flycheck-pos-tip-mode))
    )

  (defun my/use-eslint-from-node-modules ()
    (let* ((root (locate-dominating-file
		  (or (buffer-file-name) default-directory)
		  "node_modules"))
	   (eslint (and root
			(expand-file-name "node_modules/eslint/bin/eslint.js"
					  root))))
      (when (and eslint (file-executable-p eslint))
	(setq-local flycheck-javascript-eslint-executable eslint))))
  (add-hook 'flycheck-mode-hook #'my/use-eslint-from-node-modules)
  )


(provide 'init-flycheck)
;;; init-flycheck.el ends here
