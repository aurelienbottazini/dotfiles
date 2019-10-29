;;;  -*- lexical-binding: t; -*-
(defun aurayb-make-narrow-indirect-vue (atag-string amode-fn)
  (lambda ()
    "Creates an indirect buffer for a .vue file component and narrows it to the region
 inside atag-string and set amode-fn as the mode file.
If the indirect buffer already exists just switch to it.
If already in the indirect buffer, switches bach to base-buffer."
    (interactive)
    (save-mark-and-excursion
      (let* ((indirect-vue-buffer-name (concat atag-string "->" (buffer-name)))
             (indirect-vue-buffer (get-buffer indirect-vue-buffer-name)))
        (cond
         ((buffer-base-buffer) (progn (pop-to-buffer-same-window (buffer-base-buffer))
                                      (font-lock-fontify-buffer)))
         (indirect-vue-buffer (progn
                                (pop-to-buffer-same-window indirect-vue-buffer)
                                (font-lock-fontify-buffer)))
         (t (progn
              (pop-to-buffer-same-window (make-indirect-buffer (buffer-name)  indirect-vue-buffer-name nil))
              (goto-char (point-max))
              (narrow-to-region (re-search-backward (concat "</" atag-string ">"))
                                (progn (re-search-backward (concat "<" atag-string ".*>"))
                                       (next-line)
                                       (point)))
              (funcall amode-fn)
              )))))))

(provide 'aurayb-narrow-indirect-vue)
