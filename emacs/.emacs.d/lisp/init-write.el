;; S-:
(when (executable-find "hunspell")
  (setq-default ispell-program-name "hunspell")
  (setq ispell-really-hunspell t)
  ;; making sure I load the correctly dictionary for hunspell
  (add-to-list 'ispell-local-dictionary-alist '("en_US_aurelien"
                                                "[[:alpha:]]"
                                                "[^[:alpha:]]"
                                                "[']"
                                                t
                                                ("-d" "en_US_aurelien")
                                                nil
                                                iso-8859-1))
  (setq ispell-dictionary "en_US_aurelien")
  (add-hook 'org-mode-hook 'ispell-minor-mode)
  )

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

(provide 'init-write)
