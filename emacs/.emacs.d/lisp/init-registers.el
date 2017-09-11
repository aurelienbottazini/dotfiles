(dolist
    (r `(
         (?c (file . "~/projects/training-heaven/src/training.clj"))
         (?e (file . ,(concat user-emacs-directory "init.el")))
         (?j (file . "~/projects/training-heaven/src/training.js"))
         (?r (file . "~/projects/training-heaven/src/training.rb"))
	 ))
  (set-register (car r) (cadr r)))

(provide 'init-registers)
