(evil-leader/set-key-for-mode 'scheme-mode
  "mee" 'jpath/geiser-evil-eval-last-sexp
  "me$" 'jpath/geiser-evil-eval-last-sexp-eol
  "med" 'geiser-eval-definition
  "meb" 'geiser-eval-buffer
  "mer" 'geiser-eval-region
  "m,"  'lisp-state-toggle-lisp-state
  "mr"  'geiser-mode-switch-to-repl
  "md"  'geiser-doc-symbol-at-point
  "m("  'geiser-squarify
  )
