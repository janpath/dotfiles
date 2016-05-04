(defun jpath/racket-evil-send-last-sexp ()
  "Send the previous sexp to the Racket REPL."
  (interactive)
  (save-excursion
    (forward-char)
    (racket-send-last-sexp)))

(defun jpath/racket-evil-send-last-sexp-eol ()
  "Send the previous sexp to the Racket REPL."
  (interactive)
  (save-excursion
    (end-of-line)
    (racket-send-last-sexp)))

(eval-after-load "racket-repl"
  '(defun racket--repl-show-and-move-to-end ()
     "Make the Racket REPL visible, and move point to end.
Keep original window selected."
     (interactive)
     (display-buffer racket--repl-buffer-name)
     (save-selected-window
       (select-window (get-buffer-window racket--repl-buffer-name t))
       (comint-show-maximum-output))))
