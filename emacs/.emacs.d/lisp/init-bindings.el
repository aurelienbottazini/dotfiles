(defadvice terminal-init-xterm (after map-S-up-escape-sequence
activate)
  (define-key input-decode-map "\e[1;40" (kbd "C-("))
  (define-key input-decode-map "\e[1;41" (kbd "C-)"))

  (define-key input-decode-map "\e[1;123" (kbd "C-{"))
  (define-key input-decode-map "\e[1;125" (kbd "C-}"))
  )

(defvar my-keys-minor-mode-map (make-keymap) "my-keys-minor-mode keymap.")
(define-minor-mode my-keys-minor-mode
  "A minor mode so that my key settings override annoying major modes."
  t " my-keys" 'my-keys-minor-mode-map)
(my-keys-minor-mode 1)

    (defadvice load (after give-my-keybindings-priority)
      "Try to ensure that my keybindings always have priority."
      (if (not (eq (car (car minor-mode-map-alist)) 'my-keys-minor-mode))
          (let ((mykeys (assq 'my-keys-minor-mode minor-mode-map-alist)))
            (assq-delete-all 'my-keys-minor-mode minor-mode-map-alist)
            (add-to-list 'minor-mode-map-alist mykeys))))
  (ad-activate 'load)

(diminish 'my-keys-minor-mode)

(use-package drag-stuff
  :diminish drag-stuff-mode
  :bind (:map my-keys-minor-mode-map
              ("M-p" . drag-stuff-up)
              ("M-n" . drag-stuff-down)
              ("M-<right>" . drag-stuff-right)
              ("M-<left>" . drag-stuff-left))
  :config
  (drag-stuff-global-mode))

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
(define-key my-keys-minor-mode-map (kbd "C-h") 'tmux-move-left)
(define-key my-keys-minor-mode-map (kbd "C-j") 'tmux-move-down)
(define-key my-keys-minor-mode-map (kbd "C-k") 'tmux-move-up)
(define-key my-keys-minor-mode-map (kbd "C-l") 'tmux-move-right)
(define-key my-keys-minor-mode-map (kbd "C-w") 'backward-kill-word)
(define-key my-keys-minor-mode-map (kbd "<f5>") 'toggle-frame-fullscreen)
(use-package iedit
  :bind (:map my-keys-minor-mode-map
              ("<f6>". iedit-mode)))

(define-key my-keys-minor-mode-map (kbd "C-x o") 'ace-window)
(use-package ivy
  :diminish ivy-mode
  :bind (:map my-keys-minor-mode-map
              ("C-x b" . ivy-switch-buffer))
  :bind (:map my-leader-map
              ("b" . ivy-switch-buffer)
              ("f" . counsel-projectile-rg)
              ("F" . counsel-rg)
              ("<SPC>" . avy-goto-word-1))
  :config
  (ivy-mode 1)
  (use-package ivy-hydra))


(use-package counsel-projectile
  :config
  (define-key evil-normal-state-map (kbd "C-p") 'counsel-projectile-find-file)
  )

(use-package projectile
  :init
  (setq projectile-enable-caching t)
  :bind (:map my-leader-map
              ("p" . projectile-commander))
  :init
  (use-package counsel-projectile))
(use-package counsel
  :bind (:map my-keys-minor-mode-map
              ("C-s" . swiper)
              ("M-x" . counsel-M-x)
              ("C-x C-f" . counsel-find-file))
  :bind (:map my-leader-map
              ("W" . swiper-multi)
              ("h" . counsel-recentf)
              ("i" . counsel-imenu)
              ("m" . counsel-bookmark)
              ("y" . counsel-yank-pop)
              ("w" . swiper))
  :config
  ;; with smex installed, counsel place recently used commands at the top
  (use-package smex))

(use-package windresize
  :bind (:map evil-normal-state-map
              ("C-w r" . windresize))
  )

(use-package dumb-jump
  :bind (:map evil-normal-state-map
              ("gd" . dumb-jump-go)
              ("gD" . dumb-jump-go-other-window)
              )
  :init
  (setq dumb-jump-selector 'ivy)
  (setq dumb-jump-force-searcher 'rg)
  )


(use-package origami
  :bind (:map evil-normal-state-map
              ("zh" . origami-close-all-nodes)
              ("zc" . origami-close-node)
              ("zo" . origami-open-node)
              ("zv" . origami-open-all-nodes))
  :config
  (global-origami-mode)
  )

(use-package expand-region
  :bind (:map my-leader-map
              ("n" . er/expand-region)))

(use-package context-coloring
  :bind (:map my-leader-map
              ("oc" . context-coloring-mode)))

(use-package neotree
  :bind (:map my-leader-map
              ("1" . neotree-find-project-root))
  :init
  (setq neo-smart-open t)
  :config
  (use-package all-the-icons
    :config
    (setq neo-theme (if (display-graphic-p) 'icons 'arrow)))
  (evil-define-key 'normal neotree-mode-map (kbd "TAB") 'neotree-enter)
  (evil-define-key 'normal neotree-mode-map (kbd "q") 'neotree-hide)
  (evil-define-key 'normal neotree-mode-map (kbd "RET") 'neotree-enter)
  (defun neotree-find-project-root ()
    (interactive)
    (if (neo-global--window-exists-p)
        (neotree-hide)
      (let ((origin-buffer-file-name (buffer-file-name)))
        (neotree-find (projectile-project-root))
        (neotree-find origin-buffer-file-name))))
  )
(provide 'init-bindings)
