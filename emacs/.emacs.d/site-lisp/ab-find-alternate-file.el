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
         (true-buffer-name (car (last (split-string (buffer-file-name) "/"))))

         (vue-filename (concat (car (split-string (buffer-name) ".spec.js")) ".vue"))
         (js-filename (concat (car (split-string (buffer-name) ".spec.js")) ".js"))
         (spec-filename (concat (file-name-sans-extension (buffer-name)) ".spec.js"))

         (file-relative-name-from-src-dir (file-relative-name (buffer-name) src-dir))
         (file-relative-path (concat (car (split-string file-relative-name-from-src-dir true-buffer-name))))

         (spec-relative-name-from-spec-dir (file-relative-name (buffer-name) unit-test-specs-dir))
         (spec-relative-path (concat (car (split-string spec-relative-name-from-spec-dir (buffer-name)))))

         (e2e-relative-name-from-spec-dir (file-relative-name (buffer-name) e2e-test-dir))
         (e2e-relative-path (concat (car (split-string spec-relative-name-from-spec-dir (buffer-name)))))
         )
    (cond
     ((string-suffix-p ".page.vue" true-buffer-name)
      (find-file (concat e2e-test-dir file-relative-path spec-filename)))
     ((string-suffix-p ".page.spec.js" true-buffer-name)
      (find-file (concat src-dir e2e-relative-path vue-filename)))
     ((string-suffix-p ".spec.js" true-buffer-name)
      (cond
       ((file-exists-p (concat src-dir spec-relative-path vue-filename)) (find-file (concat src-dir spec-relative-path vue-filename)))
       ((file-exists-p (concat src-dir spec-relative-path js-filename)) (find-file (concat src-dir spec-relative-path js-filename)))
       (t (find-file (concat src-dir spec-relative-path js-filename)))
       ))
     ((string-suffix-p ".vue" true-buffer-name)
      (find-file (concat unit-test-specs-dir file-relative-path spec-filename)))
     ((string-suffix-p ".js" true-buffer-name)
      (find-file (concat unit-test-specs-dir file-relative-path spec-filename)))
     (t (message "could not match file")))))

(split-string "foo/bar/file.spec.js" "/")

(provide 'ab-find-alternate-file)
;;; ab-find-alternate-file ends here
