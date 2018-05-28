;; Load the rest of the packages
(package-initialize t)
(require 'cl)
(require 'org)
(require 'ob-tangle)
(org-babel-load-file (expand-file-name "~/.emacs.d/Aurelien.org"))
