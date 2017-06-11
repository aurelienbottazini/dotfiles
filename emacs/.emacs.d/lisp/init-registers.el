(dolist
    (r `((?e (file . ,(concat user-emacs-directory "init.el")))
	 ))
  (set-register (car r) (cadr r)))

(provide 'init-registers)
