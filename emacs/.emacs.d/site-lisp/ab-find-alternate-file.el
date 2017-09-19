;;; package --- summary
;;; Commentary:
;;; Code:
(use-package s)

(defun ab-alternate-path (path)
  "Return an alternate PATH."
  (interactive)
  (cond
   ((string-match-p ".*/src/.*" path)
    (cond
     ((string-suffix-p ".js" path)
      (list (s-replace ".js" ".spec.js" (s-replace "/src/" "/test/unit/specs/" path))))
     ((string-suffix-p ".vue" path)
      (list (s-replace ".vue" ".spec.js" (s-replace "/src/" "/test/unit/specs/" path))))
     ))
   ((string-match-p ".*/test/unit/.*" path)
    (let ((goodPathBadFilename  (s-replace "/test/unit/specs/" "/src/" path)))
      (list (s-replace ".spec.js" ".js" goodPathBadFilename)
            (s-replace ".spec.js" ".vue" goodPathBadFilename))))
   ((string-match-p ".*/test/webdriver/.*" path)
    (list
     (let
         ((split-file-path (split-string path "test/webdriver/specs"))
          (package-name (car (split-string  (cadr (split-string path "/webdriver/specs/")) "/"))))
       (concat (car split-file-path)
               "src/packages/"
               package-name
               "/pages/"
               (s-replace ".spec.js" ".page.vue"
                          (s-replace ".page.spec.js" ".spec.js"
                                     (mapconcat 'identity  (cddr (split-string  (cadr split-file-path) "/")) "/")))
               ))
     ))
   (t (message "can not find an alternate path"))))

(ert-deftest ab-alternate-path ()
  "tests alternate-path"
  (should (equal (ab-alternate-path "foo/src/profiles/foo.js") '("foo/test/unit/specs/profiles/foo.spec.js")))
  (should (equal (ab-alternate-path "foo/src/profiles/foo.vue") '("foo/test/unit/specs/profiles/foo.spec.js")))
  (should (equal (ab-alternate-path "foo/test/unit/specs/profiles/foo.spec.js") '("foo/src/profiles/foo.js" "foo/src/profiles/foo.vue")))
  (should (equal (ab-alternate-path "foo/test/webdriver/specs/profiles/bar/foo.page.spec.js") '("foo/src/packages/profiles/pages/bar/foo.page.vue")))
  (should (equal (ab-alternate-path "foo/test/webdriver/specs/profiles/bar/foo.spec.js") '("foo/src/packages/profiles/pages/bar/foo.page.vue")))
  )


(split-string "foo/test/webdriver/specs/profiles/bar/foo.page.spec.js" "test/webdriver/specs")

(defun ab-find-alternate-file ()
  "Find alternate file for current buffer."
  (interactive)
  (ab-open-first-existing-file (ab-alternate-path (buffer-file-name))))

(defun ab-open-first-existing-file (aexp)
  "Open the first existing file from the given AEXP."
  (cond
   ((null (cadr aexp)) (progn
                         (message "Could not find file, so creating one")
                         (find-file (car aexp))))
   ((file-exists-p (car aexp)) (find-file (car aexp)))
   (t (ab-open-first-existing-file (cdr aexp)))))

(provide 'ab-find-alternate-file)
;;; ab-find-alternate-file ends here
