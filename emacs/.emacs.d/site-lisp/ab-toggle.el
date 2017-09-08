;;; ab-toggle.el ---                                 -*- lexical-binding: t; -*-
;;; Commentary:

;; Copyright (C) 2017  Aurélien Bottazini

;; Author: Aurélien Bottazini <aurelienbottazini@Aureliens-MBP>

;;; Code:

(defun ab-replace-it ()
  "Replace it with it.only and it.only with describe."
  (interactive)
  (save-excursion (progn
                    (re-search-backward "^[\s]*it(")
                    (search-forward "it(")
                    (replace-match "it.only(")
                    )))

(defun ab-replace-it-only ()
  "Replace it with it.only and it.only with describe."
  (interactive)
  (save-excursion (progn
                    (re-search-backward "^[\s]*it.only(")
                    (search-forward "it.only(")
                    (replace-match "it(")
                    )))

(defun ab-replace-describe ()
  "Replace describe with describe.only and describe.only with describe."
  (interactive)
  (save-excursion (progn
                    (re-search-backward "^[\s]*describe(")
                    (search-forward "describe(")
                    (replace-match "describe.only(")
                    )))

(defun ab-replace-describe-only ()
  "Replace describe with describe.only and describe.only with describe."
  (interactive)
  (save-excursion (progn
                    (re-search-backward "^[\s]*describe.only(")
                    (search-forward "describe.only(")
                    (replace-match "describe(")
                    )))
(provide 'ab-toggle)
;;; ab-toggle.el ends here
