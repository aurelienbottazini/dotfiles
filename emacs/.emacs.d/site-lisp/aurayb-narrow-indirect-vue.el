;;;  -*- lexical-binding: t; -*-
(defun aurayb-make-narrow-indirect-vue (atag-string amode-fn)
  (lambda ()
    (interactive)
    (save-mark-and-excursion
      (let* ((indirect-vue-buffer-name (concat atag-string "->" (buffer-name)))
             (indirect-vue-buffer (get-buffer indirect-vue-buffer-name)))
        (cond
         ((buffer-base-buffer) (pop-to-buffer-same-window (buffer-base-buffer)))
         (indirect-vue-buffer
          (pop-to-buffer-same-window indirect-vue-buffer))
         (t (progn
              (pop-to-buffer-same-window (make-indirect-buffer (buffer-name)  indirect-vue-buffer-name nil))
              (goto-char (point-max))
              (narrow-to-region (re-search-backward (concat "</" atag-string ">"))
                                (progn (re-search-backward (concat "<" atag-string ">"))
                                       (next-line)
                                       (point)))
              (funcall amode-fn)
              )))))))

(provide 'aurayb-narrow-indirect-vue)
