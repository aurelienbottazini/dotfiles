(define-derived-mode dox-dc-mode tabulated-list-mode "dox-dc"
  "Dox-dc mode"
  (let ((columns [("Dox Containers" 100)])
        (rows (nbutlast (mapcar (lambda (x) `(nil [,x]))
                                (mapcar (lambda (y) (car (if y (split-string y "_1"))))
                                        (mapcar (lambda (x) (cadr (split-string x "dox-compose_")))
                                                (split-string (shell-command-to-string "dox-dc ps | awk 'FNR > 2 {print $1}'") "\n")))
                                ))))
    (setq tabulated-list-format columns)
    (setq tabulated-list-entries rows)
    (tabulated-list-init-header)
    (tabulated-list-print)))

(defun dox-dc ()
  (interactive)
  (switch-to-buffer "*dox-dc*")
  (dox-dc-mode))

(defun dox-dc-get-logs (&optional args)
  (interactive (list (transient-args 'dox-dc-log-transient)))
  (let ((process "*dox-dc*")
        (buffer "*dox-dc-logs*")
        (container (aref (tabulated-list-get-entry) 0)))
    (if (member "-f" args)
        (apply #'start-process `(,process ,buffer "dox-dc" "logs" ,@args ,container))
      (apply #'call-process `("dox-dc" nil ,buffer nil "logs" ,@args ,container)))
    (switch-to-buffer buffer)))

(define-infix-argument dox-dc-log-transient:--tail ()
  :description "Tail"
  :class 'transient-option
  :shortarg "-T"
  :argument "--tail=")

(define-transient-command dox-dc-log-transient ()
  "doc-dc transient"
  ["Arguments"
   ("-f" "Follow" "-f")
   ("-t" "Timestamps" "-t")
   (dox-dc-log-transient:--tail)]
  ["Actions"
   ("l" "Log" dox-dc-get-logs)])

(defvar dox-dc-mode-map
  (let ((map (make-sparse-keymap)))
    (define-key map (kbd "l") 'dox-dc-log-transient)
    map))

(provide 'dox-dc)
