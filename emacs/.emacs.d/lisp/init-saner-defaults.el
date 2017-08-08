(setq inhibit-startup-message t)
(setq initial-scratch-message "")

(setq delete-by-moving-to-trash t)
(setq-default indent-tabs-mode nil)
(add-hook 'before-save-hook 'delete-trailing-whitespace)

(setq tags-add-tables nil)
(setq vc-follow-symlinks t)

(electric-pair-mode 1)

(prefer-coding-system 'utf-8)
(modify-coding-system-alist 'process "\\*compilation\\*\\'"   'utf-8)

;; ediff in same frame
(setq ediff-window-setup-function 'ediff-setup-windows-plain)

(setq backup-by-copying t      ; don't clobber symlinks
      backup-directory-alist
      '((".*" . "~/.local/share/emacs-saves"))    ; don't litter my fs tree
      delete-old-versions t
      kept-new-versions 6
      kept-old-versions 2
      auto-save-default t ;files starting with # are generated by autosave
      auto-save-timeout 60 ; number of seconds before auto-saving
      auto-save-interval 200 ; number of keystrokes before auto-saves
      version-control t) ; use versioned backups

(setq auto-save-file-name-transforms
      `((".*" ,"~/.local/share/emacs-saves" t)))

(defalias 'yes-or-no-p 'y-or-n-p)

;; if file has no change, just load any changes
;; coming from an external process
(global-auto-revert-mode 1)

;; sentences end with one space after point
(setq sentence-end-double-space nil)

;;; replace selected text when typing
(pending-delete-mode 1)

;; show end of buffer on left fringe
(setq default-indicate-empty-lines t)

(recentf-mode 1)

(when *is-a-mac*
  (setq mac-command-modifier 'meta)
  (setq mac-option-modifier 'none)
  (setq mac-right-control-modifier 'hyper)
  (setq mac-right-option-modifier 'none)
  (setq mac-right-command-modifier 'super)
  ;;(setq ns-function-modifier 'hyper)
  (setq default-input-method "MacOSX"))

(setq abbrev-file-name
      (concat user-emacs-directory "abbrev_defs"))
(setq save-abbrevs t)
(setq default-abbrev-mode t)

(setenv "NODE_PATH"
        (concat
         (getenv "HOME") "/node_modules" ":"
         (getenv "NODE_PATH")
         ))

(use-package exec-path-from-shell
  :config
  (exec-path-from-shell-initialize))

(add-hook 'dired-mode-hook 'dired-hide-details-mode)

(provide 'init-saner-defaults)
