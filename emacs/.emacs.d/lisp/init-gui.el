;;; package --- init-gui
;;; Commentary:
;;; GUI adjustements
;;; Code:

(when window-system
  (set-frame-font "-*-PragmataPro-normal-normal-normal-*-14-*-*-*-m-0-iso10646-1"))

(use-package smart-cursor-color
  :config
  (smart-cursor-color-mode +1))

(setq ring-bell-function 'ignore)

(electric-indent-mode t)
(electric-pair-mode t)
;; (electric-layout-mode t)
;; (setq electric-layout-rules '((?\{ . around) (?\} . around)))

(global-hl-line-mode)
(blink-cursor-mode 0)
(column-number-mode)

(defvar linum-format)
(setq linum-format "%3d")
(global-visual-line-mode)

;; file path in frame title
(setq frame-title-format
      '((:eval (if (buffer-file-name)
                   (abbreviate-file-name (buffer-file-name))
                 "%b"))))


(if (fboundp 'tool-bar-mode) (tool-bar-mode -1))
(if (fboundp 'scroll-bar-mode) (scroll-bar-mode -1))
(if (fboundp 'menu-bar-mode) (menu-bar-mode -1))

(use-package which-key
  :diminish which-key-mode
  :config
  (which-key-mode))

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

(use-package xterm-color
  :config
(setq compilation-environment '("TERM=xterm-256color"))

(add-hook 'compilation-start-hook
          (lambda (proc)
            ;; We need to differentiate between compilation-mode buffers
            ;; and running as part of comint (which at this point we assume
            ;; has been configured separately for xterm-color)
            (when (eq (process-filter proc) 'compilation-filter)
              ;; This is a process associated with a compilation-mode buffer.
              ;; We may call `xterm-color-filter' before its own filter function.
              (set-process-filter
               proc
               (lambda (proc string)
                 (funcall 'compilation-filter proc
                          (xterm-color-filter string)))))))
  )

(setq scroll-margin 1
      scroll-conservatively 0
      scroll-up-aggressively 0.01
      scroll-down-aggressively 0.01)
(setq-default scroll-up-aggressively 0.01
              scroll-down-aggressively 0.01)

 (use-package undo-tree
   :diminish undo-tree-mode
   :bind ("C-x u" . undo-tree-visualize)
   )

(provide 'init-gui)
