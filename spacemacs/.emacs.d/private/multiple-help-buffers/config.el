(defun help-buffer-advice (proposed)
  (if (not (string= proposed "*Help*"))
      proposed
    (or (car (remove-if-not ;Reuse help buffer of selected frame if present
              (apply-partially 'string-match "^\\*Help\\(-[1-9][0-9]*\\)?\\*$")
              (mapcar 'buffer-name
                      (mapcar 'window-buffer (window-list)))))
        (cl-labels ((iter (num) ;Find lowest free index for help buffer
                          (let ((buffer (get-buffer-create
                                         (if (= num 0)
                                             "*Help*"
                                           (concat "*Help-"
                                                   (number-to-string num)
                                                   "*")))))
                            (if (not (get-buffer-window buffer t))
                                (buffer-name buffer)
                              (iter (+ num 1))))))
          (iter 0)))))

(advice-add 'help-buffer :filter-return
            #'help-buffer-advice)

;; (add-hook 'after-init-hook
;;           ;; Recognise buffers with name "*Help-<num>*" as help pop-ups
;;           (lambda ()
;;             (set-variable 'popwin:special-display-config
;;                          (mapcar (lambda (seq)
;;                                    (if (not (string= "*Help*" (car seq)))
;;                                        seq
;;                                      (append '("^\\*Help\\(-[1-9][0-9]*\\)?\\*$"
;;                                                :regexp t)
;;                                              (cdr seq))))
;;                                  popwin:special-display-config))))
