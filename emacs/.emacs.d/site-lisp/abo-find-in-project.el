;;; abo-find-in-project.el --- Utilities to navigate files in a project  -*- lexical-binding: t; -*-

;; Copyright (C) 2020  DESKTOP-2O67MQ6

;; Author: Aurélien Bottazini

(defun alternate-files-for-current-buffer ()
  (nbutlast
   (split-string
    (shell-command-to-string
     (concat
      "fd --hidden "
      (downcase (car (split-string (file-name-nondirectory buffer-file-name) "\\.")))
      " $(git rev-parse --show-toplevel) | rg -v "
      (file-name-nondirectory buffer-file-name)))
    "\n")
   1))

(defun abo-find-file-with-similar-name ()
  "Find file with similar name in project."
  (interactive)
  (let ((alternate-files (alternate-files-for-current-buffer)))
    (cond
     ((zerop (length alternate-files))
      (message "There's no alternate files"))
     ((equal 1 (length alternate-files))
      (find-file (car alternate-files)))
     (t (find-file (ido-completing-read
                    "Alternate files: "
                    alternate-files))))))

(provide 'abo-find-in-project)
