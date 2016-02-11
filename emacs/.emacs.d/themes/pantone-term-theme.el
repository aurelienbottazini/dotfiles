;;; pantone-theme.el --- Color Theme based on Tron universe.

;; Author: Aurélien Bottazini <aurelienbottazini.com>

;;; Commentary:

;; In your init file:
;; (load-theme 'pantone)
;;
;; You can also add:
;; (pantone-mode-line)
;; To get a custom mode-line with additional colors
;;

;;; Code:
(deftheme pantone-term
  "Theme based on Tron universe. Colors are inspired / taken from the movies.
More information on Tron: https://en.wikipedia.org/wiki/Tron")

(let (
      (background (if (window-system) "#f1f2f1" nil))
      (background1 (if (window-system) "#e9eae8" "brightblack"))
      (background-term (if (window-system) "#332f21" "black"))

      (foreground (if (window-system) "#212822" "black"))
      (comments (if (window-system) "#616568" "black"))
      (comments-delimiters (if (window-system) "#3d3c38" "black"))

      (blue (if (window-system) "#23249e" "blue"))
      (yellow (if (window-system) "#ffe863" "yellow"))
      (red (if (window-system) "#da0039" "red"))
      (green (if (window-system) "#005c4d" "green"))
      (violet (if (window-system) "#600b92" "violet"))
      (orange (if (window-system) "#e6a547" "orange"))

      (rose (if (window-system) "#dc4388" "brighttred"))
      (brightyellow (if (window-system) "#fbf59b" "brightyellow")))
  (custom-theme-set-faces
   'pantone

   `(default ((t (:background ,background-term :foreground ,background))))
   )

  (custom-theme-set-variables
   'pantone

;;    `(ansi-color-names-vector
;;      ;; black, red, green, yellow, blue, magenta, cyan, white
;;      [,base00 ,red ,green ,yellow ,blue ,magenta ,cyan ,base04])
;;    `(ansi-term-color-vector
;;      ;; black, red, green, yellow, blue, magenta, cyan, white
;;      [unspecified ,base00 ,red ,green ,yellow ,blue ,magenta ,cyan ,base04]))

   )
)


;;;###autoload
(when load-file-name
  (add-to-list 'custom-theme-load-path
               (file-name-as-directory (file-name-directory load-file-name))))

(provide-theme 'pantone-term)
;;; pantone-term-theme.el ends here
