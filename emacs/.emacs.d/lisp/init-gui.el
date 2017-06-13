(when window-system
  (set-default-font "-*-PragmataPro Mono-normal-normal-normal-*-14-*-*-*-m-0-iso10646-1"))

(setq ring-bell-function 'ignore)

(global-hl-line-mode)

(blink-cursor-mode 0)
(column-number-mode)
;; (global-linum-mode)
(setq linum-format "%3d ")

;; file path in frame title
(setq frame-title-format
      '((:eval (if (buffer-file-name)
                   (abbreviate-file-name (buffer-file-name))
                 "%b"))))


(if (fboundp 'tool-bar-mode) (tool-bar-mode -1))
(if (fboundp 'scroll-bar-mode) (scroll-bar-mode -1))
(if (fboundp 'menu-bar-mode) (menu-bar-mode -1))

(use-package fill-column-indicator
:config
  (add-hook 'prog-mode-hook 'fci-mode)
  (add-hook 'customize-mode-hook '(fci-mode nil))
  )

(use-package which-key
 :diminish which-key-mode
 :config
 (which-key-mode))

(use-package highlight-thing
  :diminish highlight-thing-mode
  :config
  (global-highlight-thing-mode))

(use-package diminish
  :config
  (diminish 'abbrev-mode)
  )

(use-package highlight-parentheses

  :diminish highlight-parentheses-mode
  :config
  (global-highlight-parentheses-mode t))

(use-package rainbow-mode
  :config
  (add-hook 'scss-mode-hook 'rainbow-mode)
  (add-hook 'css-mode-hook 'rainbow-mode)
  (add-hook 'web-mode-hook 'rainbow-mode)
  (add-hook 'less-mode-hook 'rainbow-mode)
  (add-hook 'html-mode-hook 'rainbow-mode)
  )

(provide 'init-gui)
