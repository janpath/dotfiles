(defun jpath/geiser-evil-eval-last-sexp (print-to-buffer-p)
  "Eval the previous sexp in the Geiser REPL.

With a prefix, print the result of the evaluation to the buffer."
  (interactive "P")
  (save-excursion
    (forward-char)
    (geiser-eval-last-sexp print-to-buffer-p)))

(defun jpath/geiser-evil-eval-last-sexp-eol (print-to-buffer-p)
  "Eval the previous sexp in the Geiser REPL.

With a prefix, print the result of the evaluation to the buffer."
  (interactive "P")
  (save-excursion
    (end-of-line)
    (geiser-eval-last-sexp print-to-buffer-p)))
