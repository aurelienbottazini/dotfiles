(use-package web-mode
  :mode "\\.vue\\'"
  :config
  (setq web-mode-markup-indent-offset 2)
  (setq web-mode-css-indent-offset 2)
  (setq web-mode-code-indent-offset 2)
  (setq web-mode-script-padding 2)
  (add-hook 'web-mode-hook '(lambda () (fci-mode -1)))
  )

(setq js-indent-level 2)

(use-package js2-mode
  :mode "\\.js\\'"
  :mode "\\.jsx\\'"
  :config
  ;;(require 'js2-imenu-extras)
  ;;(js2-imenu-extras-setup +1)
  (add-hook 'js2-mode-hook 'js2-imenu-extras-mode)
  (add-hook 'js2-mode-hook (lambda() (subword-mode t)
			     (diminish 'subword-mode)
			     ))

  (setq-default
   ;; js2-mode
   js2-basic-offset 2
   ;; web-mode
   css-indent-offset 2
   web-mode-markup-indent-offset 2
   web-mode-css-indent-offset 2
   web-mode-code-indent-offset 2
   web-mode-attr-indent-offset 2)

  (setq js2-highlight-level 3)
  (use-package import-js)


  (use-package js2-refactor
    :diminish js2-refactor-mode
    :config
    (js2r-add-keybindings-with-prefix "<f12>"))
  (add-hook 'js2-mode-hook 'js2-refactor-mode)


  (use-package babel-repl
    :config
    (require 'comint)
    (add-to-list 'comint-preoutput-filter-functions
		 (lambda (output)
		   (replace-regexp-in-string "\033\\[[0-9]+[A-Z]" "" output)))

    (setq babel-repl-cli-arguments '("--presets=es2015"
				     ;; "--eval=\"require('repl').start({replMode: require('repl').REPL_MODE_STRICT, ignoreUndefined: true})\""
				     ))
    (setq babel-repl-cli-program "org-babel-node")
    ;; (evil-leader/set-key-for-mode 'js2-mode "x" 'babel-repl-send-buffer)
    )

  (setq javascript-common-imenu-regex-list
	'(
	  ("Class" "class[ \t]+\\([a-zA-Z0-9_$.]+\\)[ \t]*" 1)
	  ("Describe" "describe('\\([a-zA-Z0-9_$./ ]+\\)'*" 1)
	  ("It" "it('\\([a-zA-Z0-9_$./ ]+\\)'*" 1)
	  ("Function" "function[ \t]+\\([a-zA-Z0-9_$.]+\\)[ \t]*(" 1)
	  ("Const" "const[ \t]+\\([a-zA-Z0-9_$.]+\\)[ \t]* =" 1)
	  ("Function" "^[ \t]*\\([a-zA-Z0-9_$.]+\\)[ \t]*=[ \t]*function[ \t]*(" 1)
	  ;; {{ es6 beginning
	  ("Function" "^[ \t]*\\([A-Za-z_$][A-Za-z0-9_$]+\\)[ \t]*([a-zA-Z0-9, ]*) *\{ *$" 1) ;; es6 fn1 () { }
	  ("Function" "^[ \t]*\\([A-Za-z_$][A-Za-z0-9_$]+\\)[ \t]*=[ \t]*(?[a-zA-Z0-9, ]*)?[ \t]*=>" 1) ;; es6 fn1 = (e) =>
	  ;; }}
	  ))

  (defun auray-js-imenu-make-index ()
    (save-excursion
      (imenu--generic-function javascript-common-imenu-regex-list)))

  (require 'prettier-js)
  (defun auray-js-mode-hook ()
    (tern-mode t)
    (set (make-local-variable 'company-backends)
           '((company-dabbrev-code company-yasnippet company-tern)))
    (add-hook 'before-save-hook 'prettier-before-save)

    (setq imenu-create-index-function 'auray-js-imenu-make-index)
    )
  )

(add-hook 'js-mode-hook 'auray-js-mode-hook)
(add-hook 'js2-mode-hook 'auray-js-mode-hook)

(add-to-list 'magic-mode-alist '("^import.*React.* from 'react'" . my-jsx-hook) )
(defun my-jsx-hook ()
  "My Hook for JSX Files"
  (interactive)
  (web-mode)
  (web-mode-set-content-type "jsx")
  (setq imenu-create-index-function 'auray-js-imenu-make-index)
  (flycheck-select-checker 'javascript-eslint)
  (emmet-mode)
  (setq emmet-expand-jsx-className? t)
  (tern-mode t))

(use-package context-coloring
  :diminish context-coloring-mode
  :config
  (add-to-list 'auto-mode-alist '("\\.js\\'" . js2-mode))
  (add-hook 'js2-mode-hook #'context-coloring-mode))

(use-package json-mode
  :mode "\\.json\\'"
  :mode "\\.eslintrc\\'"
  )

(use-package coffee-mode
  :mode "\\.coffee\\'"
  :config
  (use-package highlight-indentation)
  (add-hook 'coffee-mode-hook '(lambda () (highlight-indentation-mode)))
  (add-hook 'coffee-mode-hook '(lambda () (subword-mode +1)))
  (custom-set-variables '(coffee-tab-width 2)))

(use-package typescript-mode
  :mode "\\.ts\\'"
  )


(provide 'init-javascript)
