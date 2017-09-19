;;; package --- Summary
;;; Commentary:
;;; Emacs init file
;;; Code:

(defun sort-lines-nocase ()
  "Sort selected lines ignoring case."
  (interactive)
  (let ((sort-fold-case t))
    (call-interactively 'sort-lines)))

(defun sudo ()
  "Use TRAMP to `sudo' the current buffer"
  (interactive)
  (when buffer-file-name
    (find-alternate-file
     (concat "/sudo:root@localhost:"
             buffer-file-name))))

(defun require-package (package &optional min-version)
  "Ask elpa to install given PACKAGE. You can specify a MIN-VERSION for your PACKAGE."
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

  (defvar exec-path-from-shell-check-startup-files)
  (setq exec-path-from-shell-check-startup-files nil)

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

  (defvar *is-a-windows*)
  (setq *is-a-windows* (eq system-type 'windows-nt))

  (defvar *is-a-mac*)
  (setq *is-a-mac* (eq system-type 'darwin))

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

(if (fboundp 'mac-auto-operator-composition-mode)
    (mac-auto-operator-composition-mode))

(put 'narrow-to-region 'disabled nil)
(provide 'init)
;;; init.el ends here
