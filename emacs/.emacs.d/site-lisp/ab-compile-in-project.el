;;; ab-compile-in-project.el --- Look for a .git dir and launch compile command from that directory  -*- lexical-binding: t; -*-

;; Copyright (C) 2017  Aurélien Bottazini

(defun ab-compile-in-project ()
  "Launch compile command setting .git dir as root"
  (interactive)
  (let ((default-directory (locate-dominating-file "." ".git")))
    (call-interactively #'compile)))

(provide 'ab-compile-in-project)
