;;; package --- Summary
;;; Commentary:
;;; Emacs init file
;;; Code:
(defun require-package (package &optional min-version)
  "Ask elpa to install given PACKAGE."
  (unless (package-installed-p package min-version)
    (package-install package)))

(setq package-archives
      '(
	("org"         . "http://orgmode.org/elpa/")
	("melpa"       . "http://melpa.milkbox.net/packages/")
	("gnu"         . "http://elpa.gnu.org/packages/")))
(setq package-user-dir (concat user-emacs-directory "elpa"))
(package-initialize)
(unless package-archive-contents
  (package-refresh-contents))

(require-package 'use-package)
(require 'use-package)
(setq use-package-always-ensure t)

(package-initialize)

(let ((file-name-handler-alist nil))
  (setq ad-redefinition-action 'accept)
  (setq exec-path-from-shell-check-startup-files nil)

  (setq x-select-enable-clipboard t
      x-select-enable-primary t)
  (defconst aurelienbottazini/initial-gc-cons-threshold gc-cons-threshold
    "Initial value of `gc-cons-threshold' at start-up time.")
  (setq gc-cons-threshold (* 128 1024 1024))
  (add-hook 'after-init-hook
            (lambda ()
              (setq
               gc-cons-threshold aurelienbottazini/initial-gc-cons-threshold)))

  (require 'cl)
  (setq custom-file (concat user-emacs-directory "custom.el"))
  (load custom-file)

  (add-to-list 'load-path (expand-file-name "lisp" user-emacs-directory))
  (require 'init-benchmarking) ;; Measure startup time

  (let ((default-directory  "~/.emacs.d/site-lisp/"))
    (normal-top-level-add-to-load-path '("."))
    (normal-top-level-add-subdirs-to-load-path))

  (setq *is-a-windows* (eq system-type 'windows-nt))
  (setq *is-a-mac* (eq system-type 'darwin))

  ;;copy paste from/to terminal emacs from/to osx clipboard
  (when *is-a-mac*
    (progn
      (defun copy-from-osx ()
        (shell-command-to-string "pbpaste"))
      (defun paste-to-osx (text &optional push)
        (let ((process-connection-type nil))
          (let ((proc (start-process "pbcopy" "*Messages*" "pbcopy")))
            (process-send-string proc text)
            (process-send-eof proc))))

      (setq interprogram-cut-function 'paste-to-osx)
      (setq interprogram-paste-function 'copy-from-osx)))

  (use-package drag-stuff
   :diminish drag-stuff-mode
   :config
   (drag-stuff-global-mode)
   (drag-stuff-define-keys))

 (use-package undo-tree
   :diminish undo-tree-mode)

  (require 'init-gui)
  (require 'init-saner-defaults)
  (require 'init-registers)
  (require 'init-evil)
  (require 'init-dired)
  (require 'init-projects)
  (require 'init-bindings)
  (require 'init-git)
  (require 'init-emmet)
  (require 'init-flycheck)
  (require 'init-spellcheck)
  (require 'init-snippets)
  (require 'init-completion)
  (require 'init-templates)

  (require 'init-docker)
  (require 'init-lisp)
  (require 'init-ruby)
  (require 'init-javascript)
  (require 'init-clojure)
  (require 'init-markdown)
  (require 'init-css)
  (require 'init-html)
  )


  (put 'narrow-to-region 'disabled nil)
  (provide 'init)
;;; init.el ends here
