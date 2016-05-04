;;; packages.el --- myconfig Layer packages File for Spacemacs
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

(defvar myconfig-packages
  '(;;paredit
    ;;evil-paredit
    )
  "List of all packages to install and/or initialize. Built-in packages
which require an initialization must be listed explicitly in the list.")

(defvar myconfig-excluded-packages '()
  "List of packages to exclude.")

;; (defun myconfig/init-paredit ()
;;   (use-package paredit
;;     :init (add-hook 'racket-mode-hook #'paredit-mode)))

;; (defun myconfig/init-evil-paredit ()
;;   (use-package evil-paredit))

;; For each package, define a function myconfig/init-<package-myconfig>
;;
;; (defun myconfig/init-my-package ()
;;   "Initialize my package"
;;   )
;;
;; Often the body of an initialize function uses `use-package'
;; For more info on `use-package', see readme:
;; https://github.com/jwiegley/use-package
