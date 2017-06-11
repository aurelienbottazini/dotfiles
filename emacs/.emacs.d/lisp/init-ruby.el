(use-package yaml-mode
  :mode "\\.ya?ml\\'"
  )

(use-package ruby-mode
  :mode "\\.rake\\'"
  :mode "Rakefile\\'"
  :mode "\\.gemspec\\'"
  :mode "\\.ru\\'"
  :mode "Gemfile\\'"
  :mode "Guardfile\\'" :mode "Capfile\\'"
  :mode "\\.cap\\'"
  :mode "\\.thor\\'"
  :mode "\\.rabl\\'"
  :mode "Thorfile\\'"
  :mode "Vagrantfile\\'"
  :mode "\\.jbuilder\\'"
  :mode "Podfile\\'"
  :mode "\\.podspec\\'"
  :mode "Puppetfile\\'"
  :mode "Berksfile\\'"
  :mode "Appraisals\\'"
  :mode "\\.rb$"
  :mode "ruby"
  :config

  (eval-after-load 'ruby-mode '(modify-syntax-entry ?: "." ruby-mode-syntax-table))
  (eval-after-load 'ruby-mode
    '(progn
       (defun ruby-mode-defaults ()
	 )))

  (add-hook 'ruby-mode-hook 'subword-mode)
  ;; I modify the syntax table to specify ":" as punctuation (and not part of a symbol)
  ;; make it easier to work with global gnu tags
  (define-category ?U "Uppercase")
  (define-category ?u "Lowercase")
  (modify-category-entry (cons ?A ?Z) ?U)
  (modify-category-entry (cons ?a ?z) ?u)
  (make-variable-buffer-local 'evil-cjk-word-separating-categories)
  (add-hook 'subword-mode-hook
	    (lambda ()
	      (if subword-mode
		  (push '(?u . ?U) evil-cjk-word-separating-categories)
		(setq evil-cjk-word-separating-categories
		      (default-value 'evil-cjk-word-separating-categories)))))

  (eval-after-load 'ruby-mode
    '(progn
       (evil-define-key 'normal ruby-mode-map
	 "[m" 'ruby-beginning-of-defun
	 "]m" 'ruby-end-of-defun
	 )))

  ;; (add-hook 'ruby-mode-hook
  ;; 	    (lambda ()
  ;; 	      (set (make-local-variable imenu-generic-expression)
  ;; 		   '(("Methods"  "^\\( *\\(def\\) +.+\\)"          1)
  ;; 		     ))))
					;

  (use-package bundler)

  (use-package ruby-interpolation)
  (use-package inf-ruby)

  (use-package ruby-end)
  (use-package rspec-mode)

  ;; Hitting M-; twice adds an xmpfilter comment. Hitting xmp keybinding will put the output in this comment
  (use-package rcodetools
    :load-path "/site-lisp/rcodetools.el"
    :pin manual
    :ensure nil
    :config
    (evil-leader/set-key-for-mode 'ruby-mode "x"  'xmp))
  )


(provide 'init-ruby)
