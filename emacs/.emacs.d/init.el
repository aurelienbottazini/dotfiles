;;;  -*- lexical-binding: t; -*-
;; Load the rest of the packages
(package-initialize t)
(require 'cl)
(require 'org)
(require 'ob-tangle)
(setq vc-follow-symlinks t)
(org-babel-load-file (expand-file-name "~/.emacs.d/Aurelien.org"))
(org-babel-load-file (expand-file-name "~/.emacs.d/search.org"))
(put 'magit-edit-line-commit 'disabled nil)
(put 'narrow-to-region 'disabled nil)
