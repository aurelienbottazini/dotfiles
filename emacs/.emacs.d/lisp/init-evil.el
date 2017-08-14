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
  (define-key my-leader-map (kbd "k") 'compile)
  (define-key my-leader-map (kbd "dl") 'browse-lodash-docs)
  (define-key my-leader-map (kbd "dr") 'browse-ramdajs-docs)
  (define-key my-leader-map (kbd "oh") 'evil-search-highlight-persist-remove-all)
  (define-key my-leader-map (kbd "ol") 'linum-mode)
  (define-key my-leader-map (kbd "r") 'jump-to-register)
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

  (defun tmux-socket-command-string ()
    (interactive)
    (concat "tmux -S "
            (replace-regexp-in-string "\n\\'" ""
                                      (shell-command-to-string "echo $TMUX | sed -e 's/,.*//g'"))))

  (use-package emamux
    :bind (:map my-leader-map
                ("sc" . emamux:send-command)
                ("sl" . emamux:run-last-command)))
  (defun tmux-socket-command-string ()
    (interactive)
    (concat "tmux -S "
            (replace-regexp-in-string "\n\\'" ""
                                      (shell-command-to-string "echo $TMUX | sed -e 's/,.*//g'"))))


   (defun tmux-move-right ()
    (interactive)
    (condition-case nil
        (evil-window-right 1)
      (error (unless window-system (shell-command (concat (tmux-socket-command-string) " select-pane -R") nil)))))

  (defun tmux-move-left ()
    (interactive)
    (condition-case nil
        (evil-window-left 1)
      (error (unless window-system (shell-command (concat (tmux-socket-command-string) " select-pane -L") nil)))))

  (defun tmux-move-up ()
    (interactive)
    (condition-case nil
        (evil-window-up 1)
      (error (unless window-system (shell-command (concat (tmux-socket-command-string) " select-pane -U") nil)))))

  (defun tmux-move-down ()
    (interactive)
    (condition-case nil
        (evil-window-down 1)
      (error (unless window-system (shell-command (concat (tmux-socket-command-string) " select-pane -D") nil)))))
  (define-key evil-normal-state-map (kbd "C-h") 'tmux-move-left)
  (define-key evil-normal-state-map (kbd "C-j") 'tmux-move-down)
  (define-key evil-normal-state-map (kbd "C-k") 'tmux-move-up)
  (define-key evil-normal-state-map (kbd "C-l") 'tmux-move-right)
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
