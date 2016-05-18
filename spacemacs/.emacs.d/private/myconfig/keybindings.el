(evil-leader/set-key
	"ou" (lambda () (interactive)
         (start-process-shell-command
          "urxvt shell"
          nil
          (concat "urxvt -cd "
                  (file-name-directory (or buffer-file-name "~/")))))
  "op" (lambda () (interactive)
         (ido-find-file-in-dir "~/.emacs.d/private/"))
  "os" (lambda (named) (interactive "P")
         (if (not named)
             (eshell 'Z)
           (let ((name (concat "*eshell " (read-string "Buffer name: ") "*")))
             (if (string= name "*eshell *")
                 (eshell)
               (if (get-buffer name)
                   (switch-to-buffer name)
                 (eshell 'Z)
                 (rename-buffer name))))))
  "ow" 'delete-other-windows
  "of" (lambda () (interactive)
         (make-frame)
         (delete-other-windows)))

(evil-leader/set-key-for-mode 'racket-mode
  "ms$" 'jpath/racket-evil-send-last-sexp-eol)

(eval-after-load "lang/racket/packages.el"
  '(evil-leader/set-key-for-mode 'racket-mode
     "mse" 'jpath/racket-evil-send-last-sexp
     "mee" 'jpath/racket-evil-send-last-sexp))

(define-key evil-normal-state-map (kbd "C-a") 'evil-numbers/inc-at-pt)
(define-key evil-normal-state-map (kbd "C-m") 'evil-numbers/dec-at-pt)
(define-key evil-normal-state-map (kbd "g C-a")
  'evil-numbers/inc-at-pt-incremental)
(define-key evil-normal-state-map (kbd "g C-m")
  'evil-numbers/dec-at-pt-incremental)
