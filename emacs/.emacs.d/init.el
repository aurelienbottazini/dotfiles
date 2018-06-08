;; Load the rest of the packages
(package-initialize t)
(require 'cl)
(require 'org)
(require 'ob-tangle)
(setq vc-follow-symlinks t)
(org-babel-load-file (expand-file-name "~/.emacs.d/Aurelien.org"))
