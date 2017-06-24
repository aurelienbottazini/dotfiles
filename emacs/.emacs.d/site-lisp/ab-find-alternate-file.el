;;; package --- summary
;;; Commentary:
;;; Code:

(defun ab-find-alternate-file ()
  "Find alternate file."
  (interactive)
  (let* (
         (root-dir (locate-dominating-file "./" ".git"))
         (spec-dir (concat root-dir "test/"))
         (src-dir (concat root-dir "src/"))
         (unit-test-dir (concat spec-dir "unit/"))
         (unit-test-specs-dir (concat unit-test-dir "specs/"))
         (e2e-test-dir (concat spec-dir "webdriver/specs/"))

         (vue-filename (concat (car (split-string (buffer-name) ".spec.js")) ".vue"))
         (spec-filename (concat (file-name-sans-extension (buffer-name)) ".spec.js"))

         (file-relative-name-from-src-dir (file-relative-name (buffer-file-name) src-dir))
         (file-relative-path (concat (car (split-string file-relative-name-from-src-dir (buffer-name)))))

         (spec-relative-name-from-spec-dir (file-relative-name (buffer-file-name) unit-test-specs-dir))
         (spec-relative-path (concat (car (split-string spec-relative-name-from-spec-dir (buffer-name)))))

         (e2e-relative-name-from-spec-dir (file-relative-name (buffer-file-name) e2e-test-dir))
         (e2e-relative-path (concat (car (split-string spec-relative-name-from-spec-dir (buffer-name)))))
         )
    (cond
     ((string-suffix-p ".page.vue" (buffer-name))
      (find-file (concat e2e-test-dir file-relative-path spec-filename)))
     ((string-suffix-p ".page.spec.js" (buffer-name))
      (find-file (concat src-dir e2e-relative-path vue-filename)))
     ((string-suffix-p ".spec.js" (buffer-name))
      (find-file (concat src-dir spec-relative-path vue-filename)))
     ((string-suffix-p ".vue" (buffer-name))
      (find-file (concat unit-test-specs-dir file-relative-path spec-filename)))
     ((string-suffix-p ".js" (buffer-name))
      (find-file (concat unit-test-specs-dir file-relative-path spec-filename)))
     (t (message "could not match file")))))

(provide 'ab-find-alternate-file)
;;; ab-find-alternate-file ends here
