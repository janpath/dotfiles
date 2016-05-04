;;; extensions.el --- i3-emacs Layer extensions File for Spacemacs
;;
;; Copyright (c) 2012-2014 Sylvain Benner
;; Copyright (c) 2014-2015 Sylvain Benner & Contributors
;;
;; Author: Sylvain Benner <sylvain.benner@gmail.com>
;; URL: https://github.com/syl20bnr/spacemacs
;;
;; This file is not part of GNU Emacs.
;;
;;; License: GPLv3

(defvar i3-emacs-pre-extensions
  '(i3-emacs
    ;; pre extension i3-emacss go here
    )
  "List of all extensions to load before the packages.")

(defvar i3-emacs-post-extensions
  '()
  "List of all extensions to load after the packages.")

;; For each extension, define a function i3-emacs/init-<extension-i3-emacs>
;;
(defun i3-emacs/init-i3-emacs ()
  (require 'i3-integration)
  ;; (i3-one-window-per-frame-mode t)
  (set-variable i3-collect-windows-function 'i3-collect-all-windows))
;;
;; Often the body of an initialize function uses `use-package'
;; For more info on `use-package', see readme:
;; https://github.com/jwiegley/use-package
