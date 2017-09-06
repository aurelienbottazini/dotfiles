(use-package evil
  :init
  (setq evil-toggle-key "C-`")
  (setq evil-mode-line-format nil)
  :config
  (evil-mode 1)
  (use-package evil-surround
    :config
    (global-evil-surround-mode 1))

  (use-package evil-commentary
    :diminish evil-commentary-mode
    :config
    (evil-commentary-mode))

  (use-package evil-visualstar
    :config
    (global-evil-visualstar-mode t))

  (use-package evil-indent-plus
    :config
    (evil-indent-plus-default-bindings))
  (use-package evil-matchit
    :config
    (global-evil-matchit-mode 1))
  (use-package evil-search-highlight-persist
    :config
    (global-evil-search-highlight-persist t))
  ;; (use-package evil-leader
  (defun browse-lodash-docs ()
    (interactive)
    (browse-url "https://lodash.com/docs"))
  (defun browse-ramdajs-docs ()
    (interactive)
    (browse-url "http://ramdajs.com/docs"))


  (bind-keys :map evil-normal-state-map :prefix-map my-leader-map :prefix "SPC")
  (define-key my-leader-map (kbd "2") 'shell-command)

  (define-key my-leader-map (kbd "e") 'dired-jump)
  (require 'ab-in-project)
  (define-key my-leader-map (kbd "k") 'ab-compile-in-project)
  (define-key my-leader-map (kbd "dl") 'browse-lodash-docs)
  (define-key my-leader-map (kbd "dr") 'browse-ramdajs-docs)
  (define-key my-leader-map (kbd "oh") 'evil-search-highlight-persist-remove-all)
  (define-key my-leader-map (kbd "ol") 'linum-mode)
  (define-key my-leader-map (kbd "r") 'jump-to-register)
  (define-key my-leader-map (kbd "S") 'ab-eshell-in-project)
  (require 'ab-find-alternate-file)
  (define-key my-leader-map (kbd "t") 'ab-find-alternate-file)
  (define-key my-leader-map (kbd "u") 'universal-argument)

  (define-key evil-normal-state-map (kbd "M-a") 'mark-whole-buffer)
  (define-key evil-normal-state-map (kbd "g t") 'other-frame)

  (define-key evil-normal-state-map (kbd "C-u") 'evil-scroll-page-up)

  (define-key evil-normal-state-map (kbd "j") 'evil-next-visual-line)
  (define-key evil-normal-state-map (kbd "k") 'evil-previous-visual-line)

  (define-key evil-normal-state-map (kbd "[s") 'flycheck-previous-error)
  (define-key evil-normal-state-map (kbd "]s") 'flycheck-next-error)
  (define-key evil-normal-state-map (kbd "[e") 'previous-error)
  (define-key evil-normal-state-map (kbd "]e") 'next-error)
  (define-key evil-normal-state-map (kbd "[p") 'evilmi-jump-items)
  (define-key evil-normal-state-map (kbd "]p") 'evilmi-jump-items)
  (winner-mode 1)
  (define-key evil-normal-state-map (kbd "]w") 'winner-redo)
  (define-key evil-normal-state-map (kbd "[w") 'winner-undo)
  (define-key evil-normal-state-map (kbd "C-w t") 'make-frame-command)
  (define-key evil-normal-state-map (kbd "C-w x") 'delete-frame)
  (defun my-expand-lines ()
    (interactive)
    (let ((hippie-expand-try-functions-list
           '(try-expand-line)))
      (call-interactively 'hippie-expand)))

  (define-key evil-insert-state-map (kbd "C-x C-l") 'my-expand-lines)

  (evil-ex-define-cmd "W" 'evil-write-all)
  (setq evil-normal-state-cursor '("#2b2b2b" box))
  (setq evil-emacs-state-cursor  '("#ffafff" box))
  (setq evil-visual-state-cursor '("#ffd787" box))
  (setq evil-insert-state-cursor '("#2b2b2b" bar))
  (setq evil-motion-state-cursor '("#afd8af" box))

  (lexical-let ((default-color (cons (face-background 'mode-line)
                                     (face-foreground 'mode-line))))
    (add-hook 'post-command-hook
              (lambda ()
                (let ((color (cond ((minibufferp) default-color)
                                   ((evil-emacs-state-p)  '("#ffafff" . "#2b2b2b"))
                                   ((evil-visual-state-p) '("#ffd787" . "#2b2b2b"))
                                   ((evil-insert-state-p)  '("#ffff00" . "#2b2b2b"))
                                   ((buffer-modified-p)   '("#f38220" . "#2b2b2b"))
                                   (t default-color)))
                      )

                  (set-face-attribute 'mode-line nil :box `(:line-width 2 :color ,(car color)))
                  (set-face-background 'mode-line (car color))
                  (set-face-foreground 'mode-line-buffer-id (cdr color))
                  (set-face-foreground 'mode-line (cdr color))))))
  )

(provide 'init-evil)
