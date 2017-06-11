(when (executable-find "hunspell")
  (setq-default ispell-program-name "hunspell")
  (setq ispell-really-hunspell t)
  ;; making sure I load the correctly dictionary for hunspell
  (setq ispell-dictionary "en_US_aurelien"))

 (setq flyspell-prog-text-faces '(font-lock-comment-face font-lock-doc-face))

(use-package langtool
 :config
(setq langtool-language-tool-jar "/usr/local/Cellar/languagetool/2.8/libexec/languagetool-commandline.jar"
      langtool-mother-tongue "en"
      ;; rules: https://www.languagetool.org/languages/
      langtool-disabled-rules '("WHITESPACE_RULE"
                                "EN_UNPAIRED_BRACKETS"
                                "COMMA_PARENTHESIS_WHITESPACE")))


(use-package writegood-mode)

(use-package synosaurus)

(provide 'init-spellcheck)
