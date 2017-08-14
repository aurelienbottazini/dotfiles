(global-set-key (kbd "C-M-u") #'paredit-backward-up)
(global-set-key (kbd "C-M-n") #'paredit-forward-up)
;; This one's surpisingly useful for writing prose.
(global-set-key "\M-S"
  #'paredit-splice-sexp-killing-backward)
(global-set-key "\M-R" #'paredit-raise-sexp)
(global-set-key "\M-(" #'paredit-wrap-round)
(global-set-key "\M-[" #'paredit-wrap-square)
(global-set-key "\M-{" #'paredit-wrap-curly)

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

(use-package ivy
  :diminish ivy-mode
  :bind (:map my-keys-minor-mode-map
              ("C-x b" . ivy-switch-buffer))
  :bind (:map my-leader-map
              ("b" . ivy-switch-buffer)
              ("f" . counsel-projectile-rg)
              ("F" . counsel-rg)
              ("<SPC>" . avy-goto-char-timer))
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
              ("M-x" . counsel-M-x)
              ("C-x C-f" . counsel-find-file))
  :bind (:map my-leader-map
              ("S" . swiper-multi)
              ("h" . counsel-recentf)
              ("i" . counsel-imenu)
              ("m" . counsel-bookmark)
              ("y" . counsel-yank-pop)
              ("w" . swiper))
  :config)

(use-package windresize
  :bind (:map evil-normal-state-map
              ("C-w r" . windresize))
  )

(use-package dumb-jump
  :bind (:map evil-normal-state-map
              ("gd" . dumb-jump-go)
              ("[d" . dumb-jump-go)
              ("]d" . dumb-jump-go-other-window))
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
