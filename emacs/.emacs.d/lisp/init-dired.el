(add-hook 'dired-load-hook
          (lambda ()
            (load "dired-x")
            ;; Set dired-x global variables here.  For example:
            ;; (setq dired-guess-shell-gnutar "gtar")
            ;; (setq dired-x-hands-off-my-keys nil)
            (setq dired-dwim-target t)
            (setq dired-recursive-copies (quote always)) ; “always” means no asking
            (setq dired-recursive-deletes (quote top)) ; “top” means ask once
            ))
(setq ls-lisp-use-insert-directory-program t)
(setq insert-directory-program "gls")   ; --dired option not
                                        ; supported by ls, gnu ls
                                        ; seems better
(defun dired-finder-folder ()
  (interactive)
  (shell-command "open ."))
(add-hook 'dired-mode-hook 'auto-revert-mode)

(defun my-dired-mode-setup ()
  "to be run as hook for `dired-mode'."
  (dired-hide-details-mode 1))

(eval-after-load "dired"
  '(progn
     (define-key dired-mode-map (kbd "SPC") nil)
     ))
(add-hook 'dired-mode-hook 'my-dired-mode-setup)
  (eval-after-load
      "dired"
    '(lambda ()
       (progn
         (define-key dired-mode-map "-" 'dired-up-directory))))
(autoload 'dired-jump "dired-x"
  "Jump to Dired buffer corresponding to current buffer." t)



(provide 'init-dired)
