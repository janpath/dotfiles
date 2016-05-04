;;; packages.el --- evil-smartparens Layer packages File for Spacemacs
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

(defvar evil-smartparens-packages
  '( evil-smartparens
    ;; package evil-smartparenss go here
    )
  "List of all packages to install and/or initialize. Built-in packages
which require an initialization must be listed explicitly in the list.")

(defvar evil-smartparens-excluded-packages '()
  "List of packages to exclude.")

(defun evil-smartparens/init-evil-smartparens ()
  (use-package evil-smartparens
    :init (add-hook 'smartparens-mode-hook #'evil-smartparens-mode))
  )

;; For each package, define a function evil-smartparens/init-<package-myconfig>
;;
;; (defun evil-smartparens/init-my-package ()
;;   "Initialize my package"
;;   )
;;
;; Often the body of an initialize function uses `use-package'
;; For more info on `use-package', see readme:
;; https://github.com/jwiegley/use-package
