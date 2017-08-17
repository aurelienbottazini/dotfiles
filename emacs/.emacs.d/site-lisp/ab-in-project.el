;;; ab-in-project.el --- Look for a .git dir and launch compile command from that directory  -*- lexical-binding: t; -*-
;;; Commentary:
;; Copyright (C) 2017  Aurélien Bottazini

;;; Code:
(defun ab-compile-in-project ()
  "Launch compile command setting .git dir as root."
  (interactive)
  (let ((default-directory (locate-dominating-file "." ".git")))
    (call-interactively #'compile)))

(defun ab-eshell-in-project ()
  "Launch eshell with default directory at root of project."
  (interactive)
  (let ((default-directory (locate-dominating-file "." ".git")))
    (call-interactively #'eshell)))

(provide 'ab-in-project)
;;; ab-in-project.el ends here
