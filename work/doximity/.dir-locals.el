;;; Directory Local Variables
;;; For more information see (info "(emacs) Directory Variables")

((nil
  (eval . (progn
            (require 'find-file-in-project)
            (setq ffip-prune-patterns `("*/public/packs*/*" ,@ffip-prune-patterns))
         ))
  (alternative-files-rules
   ("packs/\\(.*\\).vue" "__tests__/\\1.spec.js")
   ("__tests__/\\(.*\\).spec.js" "packs/\\1.vue")
   ("packs/\\(.*\\).js" "__tests__/\\1.spec.js")
   ("__tests__/\\(.*\\).spec.js" "packs/\\1.js"))
  (ffip-project-root . "/home/aurelienbottazini/work/doximity/")))
