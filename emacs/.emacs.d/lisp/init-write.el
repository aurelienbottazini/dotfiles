(setq ispell-program-name "aspell")
(setq ispell-extra-args '("--sug-mode=ultra" "--lang=en_US"))

;; langtool check
(use-package langtool
 :init
(setq langtool-language-tool-jar "/usr/local/Cellar/languagetool/3.8/libexec/languagetool-commandline.jar"
      langtool-mother-tongue "en"
      ;; rules: https://www.languagetool.org/languages/
      langtool-disabled-rules '("WHITESPACE_RULE"
                                "EN_UNPAIRED_BRACKETS"
                                "COMMA_PARENTHESIS_WHITESPACE")))
(define-key my-keys-minor-mode-map (kbd "C-c w c") 'langtool-check)
(define-key my-keys-minor-mode-map (kbd "C-c w d") 'langtool-check-done)

(use-package writegood-mode)
(define-key my-keys-minor-mode-map (kbd "C-c w g") 'writegood-grade-level)
(define-key my-keys-minor-mode-map (kbd "C-c w r") 'writegood-reading-ease)

;; C-c s l	synosaurus-lookup
;; C-c s r	synosaurus-choose-and-replace
(use-package synosaurus)
(add-hook 'org-mode-hook 'synosaurus-mode)

;; distraction free mode
(use-package writeroom-mode)
(define-key my-keys-minor-mode-map (kbd "C-c w d") 'writeroom-mode)

;; C-c C-r: Send selected text to top or bottom of file
;; C-c C-q: Send selected text to trash file
(use-package palimpsest)
(define-key my-keys-minor-mode-map (kbd "C-c w b") 'palimpsest-move-region-to-bottom)
(define-key my-keys-minor-mode-map (kbd "C-c w t") 'palimpsest-move-region-to-trash)
(add-hook 'org-mode-hook 'palimpsest-mode)

(eval-after-load 'org-mode
  '(define-key org-mode-map (kbd "RET") #'newline-and-indent)
  )

(add-hook 'org-mode-hook (lambda () (auto-fill-mode 1)))
(setq org-src-fontify-natively t)
(provide 'init-write)
