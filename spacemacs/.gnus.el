(setq
 gnus-select-method '(nnimap "Mail"
                             (nnimap-stream shell)
                             (nnimap-shell-program
                              "/usr/lib/dovecot/imap -c ~/.dovecotrc")
                             )
 user-mail-address "jan@jpath.de"
 message-send-mail-function 'smtpmail-send-it
 smtpmail-default-smtp-server "localhost"
 gnus-message-archive-method '(nnimap "Mail")
 gnus-message-archive-group "sent"
 gnus-posting-styles '(((header "to" "mail@jpath.de")
                        (address "mail@jpath.de"))
                       ((header "to" "jan.path@stu.uni-kiel.de")
                        (address "jan.path@stu.uni-kiel.de"))
                       ((header "to" "jan@jpath.de")
                        (address "jan@jpath.de"))))
