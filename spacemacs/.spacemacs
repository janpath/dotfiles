;; -*- mode: emacs-lisp; lexical-binding: t -*-
;; This file is loaded by Spacemacs at startup.
;; It must be stored in your home directory.

(defun dotspacemacs/layers ()
  "Layer configuration:
This function should only modify configuration layer settings."
  (setq-default
   ;; Base distribution to use. This is a layer contained in the directory
   ;; `+distribution'. For now available distributions are `spacemacs-base'
   ;; or `spacemacs'. (default 'spacemacs)
   dotspacemacs-distribution 'spacemacs

   ;; Lazy installation of layers (i.e. layers are installed only when a file
   ;; with a supported type is opened). Possible values are `all', `unused'
   ;; and `nil'. `unused' will lazy install only unused layers (i.e. layers
   ;; not listed in variable `dotspacemacs-configuration-layers'), `all' will
   ;; lazy install any layer that support lazy installation even the layers
   ;; listed in `dotspacemacs-configuration-layers'. `nil' disable the lazy
   ;; installation feature and you have to explicitly list a layer in the
   ;; variable `dotspacemacs-configuration-layers' to install it.
   ;; (default 'unused)
   dotspacemacs-enable-lazy-installation 'unused

   ;; If non-nil then Spacemacs will ask for confirmation before installing
   ;; a layer lazily. (default t)
   dotspacemacs-ask-for-lazy-installation t

   ;; If non-nil layers with lazy install support are lazy installed.
   ;; List of additional paths where to look for configuration layers.
   ;; Paths must have a trailing slash (i.e. `~/.mycontribs/')
   dotspacemacs-configuration-layer-path '()

   ;; List of configuration layers to load.
   dotspacemacs-configuration-layers
   '(typescript
     javascript
     rust
     nixos
     idris
     (haskell :variables haskell-completion-backend 'dante)
     html
     yaml
     (latex :variables latex-enable-auto-fill t)
     gnus
     unicode-fonts
     csv
     helm
     auto-completion
     ;; better-defaults
     (rcirc :variables rcirc-enable-authinfo-support t)
     emacs-lisp
     git
     markdown
     multiple-cursors
     org
     (shell :variables
            shell-default-shell 'eshell
            shell-default-height 30
            shell-default-position 'bottom)
     spell-checking
     syntax-checking
     treemacs
     version-control
     )

   ;; List of additional packages that will be installed without being
   ;; wrapped in a layer. If you need some configuration for these
   ;; packages, then consider creating a layer. You can also put the
   ;; configuration in `dotspacemacs/user-config'.
   ;; To use a local version of a package, use the `:location' property:
   ;; '(your-package :location "~/path/to/your-package/")
   ;; Also include the dependencies as they will not be resolved automatically.
   dotspacemacs-additional-packages '(bbdb
                                      ;; (i3-emacs :location
                                      ;;           (recipe :fetcher github
                                      ;;                   :repo "vava/i3-emacs"))
                                      shakespeare-mode
                                      (evil-numbers :location
                                                    (recipe :fetcher github
                                                            :repo "janpath/evil-numbers"))
                                      (haskell-mode :location "~/workspace/haskell-mode")
                                      )

   ;; A list of packages that cannot be updated.
   dotspacemacs-frozen-packages '()

   ;; A list of packages that will not be installed and loaded.
   dotspacemacs-excluded-packages '()

   ;; Defines the behaviour of Spacemacs when installing packages.
   ;; Possible values are `used-only', `used-but-keep-unused' and `all'.
   ;; `used-only' installs only explicitly used packages and deletes any unused
   ;; packages as well as their unused dependencies. `used-but-keep-unused'
   ;; installs only the used packages but won't delete unused ones. `all'
   ;; installs *all* packages supported by Spacemacs and never uninstalls them.
   ;; (default is `used-only')
   dotspacemacs-install-packages 'used-only))

(defun dotspacemacs/init ()
  "Initialization:
This function is called at the very beginning of Spacemacs startup,
before layer configuration.
It should only modify the values of Spacemacs settings."
  ;; This setq-default sexp is an exhaustive list of all the supported
  ;; spacemacs settings.
  (setq-default
   ;; If non-nil then enable support for the portable dumper. You'll need
   ;; to compile Emacs 27 from source following the instructions in file
   ;; EXPERIMENTAL.org at to root of the git repository.
   ;; (default nil)
   dotspacemacs-enable-emacs-pdumper nil

   ;; File path pointing to emacs 27.1 executable compiled with support
   ;; for the portable dumper (this is currently the branch pdumper).
   ;; (default "emacs-27.0.50")
   dotspacemacs-emacs-pdumper-executable-file "emacs-27.0.50"

   ;; Name of the Spacemacs dump file. This is the file will be created by the
   ;; portable dumper in the cache directory under dumps sub-directory.
   ;; To load it when starting Emacs add the parameter `--dump-file'
   ;; when invoking Emacs 27.1 executable on the command line, for instance:
   ;;   ./emacs --dump-file=~/.emacs.d/.cache/dumps/spacemacs.pdmp
   ;; (default spacemacs.pdmp)
   dotspacemacs-emacs-dumper-dump-file "spacemacs.pdmp"

   ;; If non-nil ELPA repositories are contacted via HTTPS whenever it's
   ;; possible. Set it to nil if you have no way to use HTTPS in your
   ;; environment, otherwise it is strongly recommended to let it set to t.
   ;; This variable has no effect if Emacs is launched with the parameter
   ;; `--insecure' which forces the value of this variable to nil.
   ;; (default t)
   dotspacemacs-elpa-https t

   ;; Maximum allowed time in seconds to contact an ELPA repository.
   ;; (default 5)
   dotspacemacs-elpa-timeout 5

   ;; Set `gc-cons-threshold' and `gc-cons-percentage' when startup finishes.
   ;; This is an advanced option and should not be changed unless you suspect
   ;; performance issues due to garbage collection operations.
   ;; (default '(100000000 0.1))
   dotspacemacs-gc-cons '(100000000 0.1)

   ;; If non-nil then Spacelpa repository is the primary source to install
   ;; a locked version of packages. If nil then Spacemacs will install the
   ;; latest version of packages from MELPA. (default nil)
   dotspacemacs-use-spacelpa nil

   ;; If non-nil then verify the signature for downloaded Spacelpa archives.
   ;; (default nil)
   dotspacemacs-verify-spacelpa-archives nil

   ;; If non-nil then spacemacs will check for updates at startup
   ;; when the current branch is not `develop'. Note that checking for
   ;; new versions works via git commands, thus it calls GitHub services
   ;; whenever you start Emacs. (default nil)
   dotspacemacs-check-for-update nil

   ;; If non-nil, a form that evaluates to a package directory. For example, to
   ;; use different package directories for different Emacs versions, set this
   ;; to `emacs-version'. (default 'emacs-version)
   dotspacemacs-elpa-subdirectory 'emacs-version

   ;; One of `vim', `emacs' or `hybrid'.
   ;; `hybrid' is like `vim' except that `insert state' is replaced by the
   ;; `hybrid state' with `emacs' key bindings. The value can also be a list
   ;; with `:variables' keyword (similar to layers). Check the editing styles
   ;; section of the documentation for details on available variables.
   ;; (default 'vim)
   dotspacemacs-editing-style 'vim

   ;; If non-nil output loading progress in `*Messages*' buffer. (default nil)
   dotspacemacs-verbose-loading nil

   ;; Specify the startup banner. Default value is `official', it displays
   ;; the official spacemacs logo. An integer value is the index of text
   ;; banner, `random' chooses a random text banner in `core/banners'
   ;; directory. A string value must be a path to an image format supported
   ;; by your Emacs build.
   ;; If the value is nil then no banner is displayed. (default 'official)
   dotspacemacs-startup-banner 'official

   ;; List of items to show in startup buffer or an association list of
   ;; the form `(list-type . list-size)`. If nil then it is disabled.
   ;; Possible values for list-type are:
   ;; `recents' `bookmarks' `projects' `agenda' `todos'.
   ;; List sizes may be nil, in which case
   ;; `spacemacs-buffer-startup-lists-length' takes effect.
   dotspacemacs-startup-lists '((recents . 5)
                                (projects . 7))

   ;; True if the home buffer should respond to resize events. (default t)
   dotspacemacs-startup-buffer-responsive t

   ;; Default major mode of the scratch buffer (default `text-mode')
   dotspacemacs-scratch-mode 'text-mode

   ;; Initial message in the scratch buffer, such as "Welcome to Spacemacs!"
   ;; (default nil)
   dotspacemacs-initial-scratch-message nil

   ;; List of themes, the first of the list is loaded when spacemacs starts.
   ;; Press `SPC T n' to cycle to the next theme in the list (works great
   ;; with 2 themes variants, one dark and one light)
   dotspacemacs-themes '(spacemacs-dark
                         spacemacs-light)

   ;; Set the theme for the Spaceline. Supported themes are `spacemacs',
   ;; `all-the-icons', `custom', `doom', `vim-powerline' and `vanilla'. The
   ;; first three are spaceline themes. `doom' is the doom-emacs mode-line.
   ;; `vanilla' is default Emacs mode-line. `custom' is a user defined themes,
   ;; refer to the DOCUMENTATION.org for more info on how to create your own
   ;; spaceline theme. Value can be a symbol or list with additional properties.
   ;; (default '(spacemacs :separator wave :separator-scale 1.5))
   dotspacemacs-mode-line-theme '(spacemacs :separator wave :separator-scale 1.5)

   ;; If non-nil the cursor color matches the state color in GUI Emacs.
   ;; (default t)
   dotspacemacs-colorize-cursor-according-to-state t

   ;; Default font, or prioritized list of fonts. `powerline-scale' allows to
   ;; quickly tweak the mode-line size to make separators look not too crappy.
   dotspacemacs-default-font '("Source Code Pro"
                               :size 13
                               :weight normal
                               :width normal)

   ;; The leader key (default "SPC")
   dotspacemacs-leader-key "SPC"

   ;; The key used for Emacs commands `M-x' (after pressing on the leader key).
   ;; (default "SPC")
   dotspacemacs-emacs-command-key "SPC"

   ;; The key used for Vim Ex commands (default ":")
   dotspacemacs-ex-command-key ":"

   ;; The leader key accessible in `emacs state' and `insert state'
   ;; (default "M-m")
   dotspacemacs-emacs-leader-key "M-m"

   ;; Major mode leader key is a shortcut key which is the equivalent of
   ;; pressing `<leader> m`. Set it to `nil` to disable it. (default ",")
   dotspacemacs-major-mode-leader-key ","

   ;; Major mode leader key accessible in `emacs state' and `insert state'.
   ;; (default "C-M-m")
   dotspacemacs-major-mode-emacs-leader-key "C-M-m"

   ;; These variables control whether separate commands are bound in the GUI to
   ;; the key pairs `C-i', `TAB' and `C-m', `RET'.
   ;; Setting it to a non-nil value, allows for separate commands under `C-i'
   ;; and TAB or `C-m' and `RET'.
   ;; In the terminal, these pairs are generally indistinguishable, so this only
   ;; works in the GUI. (default nil)
   dotspacemacs-distinguish-gui-tab t

   ;; Name of the default layout (default "Default")
   dotspacemacs-default-layout-name "Default"

   ;; If non-nil the default layout name is displayed in the mode-line.
   ;; (default nil)
   dotspacemacs-display-default-layout nil

   ;; If non-nil then the last auto saved layouts are resumed automatically upon
   ;; start. (default nil)
   dotspacemacs-auto-resume-layouts nil

   ;; If non-nil, auto-generate layout name when creating new layouts. Only has
   ;; effect when using the "jump to layout by number" commands. (default nil)
   dotspacemacs-auto-generate-layout-names nil

   ;; Size (in MB) above which spacemacs will prompt to open the large file
   ;; literally to avoid performance issues. Opening a file literally means that
   ;; no major mode or minor modes are active. (default is 1)
   dotspacemacs-large-file-size 1

   ;; Location where to auto-save files. Possible values are `original' to
   ;; auto-save the file in-place, `cache' to auto-save the file to another
   ;; file stored in the cache directory and `nil' to disable auto-saving.
   ;; (default 'cache)
   dotspacemacs-auto-save-file-location 'cache

   ;; Maximum number of rollback slots to keep in the cache. (default 5)
   dotspacemacs-max-rollback-slots 5

   ;; If non-nil, the paste transient-state is enabled. While enabled, after you
   ;; paste something, pressing `C-j' and `C-k' several times cycles through the
   ;; elements in the `kill-ring'. (default nil)
   dotspacemacs-enable-paste-transient-state t

   ;; Which-key delay in seconds. The which-key buffer is the popup listing
   ;; the commands bound to the current keystroke sequence. (default 0.4)
   dotspacemacs-which-key-delay 0.4

   ;; Which-key frame position. Possible values are `right', `bottom' and
   ;; `right-then-bottom'. right-then-bottom tries to display the frame to the
   ;; right; if there is insufficient space it displays it at the bottom.
   ;; (default 'bottom)
   dotspacemacs-which-key-position 'bottom

   ;; Control where `switch-to-buffer' displays the buffer. If nil,
   ;; `switch-to-buffer' displays the buffer in the current window even if
   ;; another same-purpose window is available. If non-nil, `switch-to-buffer'
   ;; displays the buffer in a same-purpose window even if the buffer can be
   ;; displayed in the current window. (default nil)
   dotspacemacs-switch-to-buffer-prefers-purpose nil

   ;; If non-nil a progress bar is displayed when spacemacs is loading. This
   ;; may increase the boot time on some systems and emacs builds, set it to
   ;; nil to boost the loading time. (default t)
   dotspacemacs-loading-progress-bar t

   ;; If non-nil the frame is fullscreen when Emacs starts up. (default nil)
   ;; (Emacs 24.4+ only)
   dotspacemacs-fullscreen-at-startup nil

   ;; If non-nil `spacemacs/toggle-fullscreen' will not use native fullscreen.
   ;; Use to disable fullscreen animations in OSX. (default nil)
   dotspacemacs-fullscreen-use-non-native nil

   ;; If non-nil the frame is maximized when Emacs starts up.
   ;; Takes effect only if `dotspacemacs-fullscreen-at-startup' is nil.
   ;; (default nil) (Emacs 24.4+ only)
   dotspacemacs-maximized-at-startup nil

   ;; A value from the range (0..100), in increasing opacity, which describes
   ;; the transparency level of a frame when it's active or selected.
   ;; Transparency can be toggled through `toggle-transparency'. (default 90)
   dotspacemacs-active-transparency 90

   ;; A value from the range (0..100), in increasing opacity, which describes
   ;; the transparency level of a frame when it's inactive or deselected.
   ;; Transparency can be toggled through `toggle-transparency'. (default 90)
   dotspacemacs-inactive-transparency 90

   ;; If non-nil show the titles of transient states. (default t)
   dotspacemacs-show-transient-state-title t

   ;; If non-nil show the color guide hint for transient state keys. (default t)
   dotspacemacs-show-transient-state-color-guide t

   ;; If non-nil unicode symbols are displayed in the mode line.
   ;; If you use Emacs as a daemon and wants unicode characters only in GUI set
   ;; the value to quoted `display-graphic-p'. (default t)
   dotspacemacs-mode-line-unicode-symbols nil

   ;; If non-nil smooth scrolling (native-scrolling) is enabled. Smooth
   ;; scrolling overrides the default behavior of Emacs which recenters point
   ;; when it reaches the top or bottom of the screen. (default t)
   dotspacemacs-smooth-scrolling t

   ;; Control line numbers activation.
   ;; If set to `t' or `relative' line numbers are turned on in all `prog-mode' and
   ;; `text-mode' derivatives. If set to `relative', line numbers are relative.
   ;; This variable can also be set to a property list for finer control:
   ;; '(:relative nil
   ;;   :disabled-for-modes dired-mode
   ;;                       doc-view-mode
   ;;                       markdown-mode
   ;;                       org-mode
   ;;                       pdf-view-mode
   ;;                       text-mode
   ;;   :size-limit-kb 1000)
   ;; (default nil)
   dotspacemacs-line-numbers '(:relative t
                               :size-limit-kb 1000)

   ;; Code folding method. Possible values are `evil' and `origami'.
   ;; (default 'evil)
   dotspacemacs-folding-method 'evil

   ;; If non-nil `smartparens-strict-mode' will be enabled in programming modes.
   ;; (default nil)
   dotspacemacs-smartparens-strict-mode nil

   ;; If non-nil pressing the closing parenthesis `)' key in insert mode passes
   ;; over any automatically added closing parenthesis, bracket, quote, etc…
   ;; This can be temporary disabled by pressing `C-q' before `)'. (default nil)
   dotspacemacs-smart-closing-parenthesis nil

   ;; Select a scope to highlight delimiters. Possible values are `any',
   ;; `current', `all' or `nil'. Default is `all' (highlight any scope and
   ;; emphasis the current one). (default 'all)
   dotspacemacs-highlight-delimiters 'all

   ;; If non-nil, start an Emacs server if one is not already running.
   ;; (default nil)
   dotspacemacs-enable-server t

   ;; Set the emacs server socket location.
   ;; If nil, uses whatever the Emacs default is, otherwise a directory path
   ;; like \"~/.emacs.d/server\". It has no effect if
   ;; `dotspacemacs-enable-server' is nil.
   ;; (default nil)
   dotspacemacs-server-socket-dir nil

   ;; If non-nil, advise quit functions to keep server open when quitting.
   ;; (default nil)
   dotspacemacs-persistent-server t

   ;; List of search tool executable names. Spacemacs uses the first installed
   ;; tool of the list. Supported tools are `rg', `ag', `pt', `ack' and `grep'.
   ;; (default '("rg" "ag" "pt" "ack" "grep"))
   dotspacemacs-search-tools '("rg" "ag" "pt" "ack" "grep")

   ;; Format specification for setting the frame title.
   ;; %a - the `abbreviated-file-name', or `buffer-name'
   ;; %t - `projectile-project-name'
   ;; %I - `invocation-name'
   ;; %S - `system-name'
   ;; %U - contents of $USER
   ;; %b - buffer name
   ;; %f - visited file name
   ;; %F - frame name
   ;; %s - process status
   ;; %p - percent of buffer above top of window, or Top, Bot or All
   ;; %P - percent of buffer above bottom of window, perhaps plus Top, or Bot or All
   ;; %m - mode name
   ;; %n - Narrow if appropriate
   ;; %z - mnemonics of buffer, terminal, and keyboard coding systems
   ;; %Z - like %z, but including the end-of-line format
   ;; (default "%I@%S")
   dotspacemacs-frame-title-format "%I@%S: %b"

   ;; Format specification for setting the icon title format
   ;; (default nil - same as frame-title-format)
   dotspacemacs-icon-title-format nil

   ;; Delete whitespace while saving buffer. Possible values are `all'
   ;; to aggressively delete empty line and long sequences of whitespace,
   ;; `trailing' to delete only the whitespace at end of lines, `changed' to
   ;; delete only whitespace for changed lines or `nil' to disable cleanup.
   ;; (default nil)
   dotspacemacs-whitespace-cleanup nil

   ;; Either nil or a number of seconds. If non-nil zone out after the specified
   ;; number of seconds. (default nil)
   dotspacemacs-zone-out-when-idle nil

   ;; Run `spacemacs/prettify-org-buffer' when
   ;; visiting README.org files of Spacemacs.
   ;; (default nil)
   dotspacemacs-pretty-docs nil))

(defun dotspacemacs/user-env ()
  "Environment variables setup.
This function defines the environment variables for your Emacs session. By
default it calls `spacemacs/load-spacemacs-env' which loads the environment
variables declared in `~/.spacemacs.env' or `~/.spacemacs.d/.spacemacs.env'.
See the header of this file for more information."
  (spacemacs/load-spacemacs-env))

(defun dotspacemacs/user-init ()
  "Initialization for user code:
This function is called immediately after `dotspacemacs/init', before layer
configuration.
It is mostly for variables that should be set before packages are loaded.
If you are unsure, try setting them in `dotspacemacs/user-config' first."
  )

(defun dotspacemacs/user-load ()
  "Library to load while dumping.
This function is called only while dumping Spacemacs configuration. You can
`require' or `load' the libraries of your choice that will be included in the
dump."
  )

(defun dotspacemacs/user-config ()
  "Configuration for user code:
This function is called at the very end of Spacemacs startup, after layer
configuration.
Put your configuration code here, except for variables that should be set
before packages are loaded."
  (setq-default
   gnus-message-replyencrypt t
   gnus-message-replysign t
   rcirc-server-alist '(("chat.freenode.net"
                         :nick "jan_path"
                         :user-name "jan_path"
                         :full-name "Jan Path"
                         :port 6697
                         :encryption tls
                         :channels ("#haskell")))
   )
  (add-hook 'gnus-message-setup-hook 'mml-secure-message-sign)

  ;; TODO: I wish this would work
  (bbdb-initialize 'gnus 'message)
  (add-hook 'gnus-startup-hook 'bbdb-insinuate-gnus)
  (bbdb-insinuate-message)
  (bbdb-mua-auto-update-init 'message)

  (evil-leader/set-key
    ;; Start urxvt
    "ou" (lambda () (interactive)
           (start-process-shell-command
            "urxvt shell"
            nil
            (concat "urxvt -cd "
                    (file-name-directory (or buffer-file-name "~/")))))
    ;; Start new eshell instead of switching to existing eshell
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
    ;; Delete other windows in current frame
    "ow" 'delete-other-windows
    ;; Open new frame
    "of" (lambda () (interactive)
           (make-frame)
           (delete-other-windows))
    ;; Set spell checking to German
    "olg" (lambda () (interactive)
            (ispell-change-dictionary "german"))
    ;; Set spell checking to English
    "ole" (lambda () (interactive)
            (ispell-change-dictionary "english"))
    ;; Hide the cursor
    "oh" 'hide-cursor)

  ;; Do not use the ahs (*/#) transient state
  (evil-define-key 'motion 'global
    "*" 'ahs-forward
    "#" 'ahs-backward)

  (spacemacs/toggle-highlight-current-line-globally-off)

  ;; This allows having multiple help buffers open at once
  (advice-add 'help-buffer :filter-return
              #'help-buffer-advice)
  ;; (advice-add 'linum-relative :filter-return
  ;;             (lambda (num)
  ;;               (if (not (get-text-property 0 'invisible num))
  ;;                   (propertize (replace-regexp-in-string " " "\u2002" num)
  ;;                               'face (get-text-property 0 'face num)))))
  )

(defun help-buffer-advice (proposed)
  "If the current frame already has a help buffer use that. Otherwise use the
   first free buffer name of *Help*, *Help*<1>, ...
   popwin:special-display-config should be saved, so that these are all treated
   as special buffers"
  (if (not (string= proposed "*Help*"))
      proposed
    (or (car (remove-if-not ;Reuse help buffer of selected frame if present
              (apply-partially 'string-match "^\\*Help\\*\\(<[1-9][0-9]*>\\)?\\*$")
              (mapcar 'buffer-name
                      (mapcar 'window-buffer (window-list)))))
        (cl-labels ((iter (num) ;Find lowest free index for help buffer
                          (let ((buffer (get-buffer-create
                                        (if (= num 0)
                                            "*Help*"
                                          (concat "*Help*<"
                                                  (number-to-string num)
                                                  ">")))))
                            (if (not (get-buffer-window buffer t))
                                (buffer-name buffer)
                              (iter (+ num 1))))))
          (iter 0)))))

(defun hide-cursor ()
  "Hides the cursor until the next key is pressed"
  (interactive)
  (setq cursor-type nil))

;; Do not write anything past this comment. This is where Emacs will
;; auto-generate custom variable definitions.
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(backup-directory-alist (quote ((".*" . "temporary-file-directory"))))
 '(browse-url-browser-function (quote browse-url-firefox))
 '(dired-listing-switches "-alh")
 '(evil-digraphs-table-user
   (quote
    (((48 120)
      . 8855)
     ((48 88)
      . 11198)
     ((44 46)
      . 8230)
     ((47 8773)
      . 8775)
     ((48 43)
      . 8853)
     ((45 115)
      . 8608)
     ((45 105)
      . 8618)
     ((45 126)
      . 10610)
     ((68 115)
      . 119967)
     ((76 115)
      . 8466)
     ((67 115)
      . 119966)
     ((77 115)
      . 8499)
     ((80 115)
      . 119979)
     ((78 115)
      . 119977)
     ((83 115)
      . 119982)
     ((84 115)
      . 119983)
     ((65 115)
      . 119964)
     ((66 115)
      . 8492)
     ((58 61)
      . 8788)
     ((61 58)
      . 8789)
     ((61 63)
      . 8773))))
 '(evil-want-Y-yank-to-eol t)
 '(flycheck-pos-tip-timeout -1)
 '(gnus-buttonized-mime-types (quote ("multipart/signed" "multipart/encrypted")))
 '(js-indent-level 2)
 '(linum-delay t)
 '(linum-eager t)
 '(mm-decrypt-option (quote always))
 '(mm-verify-option (quote always))
 '(package-selected-packages
   (quote
    (ghub let-alist org-mime ag org-category-capture winum fuzzy csv-mode vimrc-mode dactyl-mode nlinum-relative nlinum helm-company helm-c-yasnippet company-web web-completion-data company-tern dash-functional tern company-statistics company-cabal company-auctex auto-yasnippet ac-ispell auto-complete if-emacs bbdb yaml-mode web-mode web-beautify tagedit slim-mode scss-mode sass-mode rvm ruby-tools ruby-test-mode rubocop rspec-mode robe rcirc-notify rcirc-color rbenv pug-mode projectile-rails rake inflections minitest livid-mode skewer-mode simple-httpd less-css-mode json-mode json-snatcher json-reformat js2-refactor multiple-cursors js2-mode js-doc helm-css-scss haml-mode feature-mode emmet-mode coffee-mode chruby bundler inf-ruby auctex-latexmk auctex orgit org-present org-pomodoro alert log4e markdown-toc magit-gitflow intero helm-gitignore haskell-snippets git-gutter-fringe+ git-gutter-fringe fringe-helper git-gutter+ flyspell-correct-helm flycheck-pos-tip pos-tip flycheck-haskell evil-magit magit magit-popup git-commit company-ghci company-ghc ghc xterm-color smeargle shell-pop org-projectile org gntp org-download multi-term mmm-mode markdown-mode htmlize hlint-refactor hindent helm-hoogle yasnippet gnuplot gitignore-mode gitconfig-mode gitattributes-mode git-timemachine git-messenger git-link git-gutter gh-md flyspell-correct flycheck with-editor eshell-z eshell-prompt-extras esh-help diff-hl company haskell-mode cmm-mode auto-dictionary ws-butler window-numbering which-key volatile-highlights vi-tilde-fringe uuidgen use-package toc-org spaceline powerline restart-emacs request rainbow-delimiters popwin persp-mode pcre2el paradox spinner org-plus-contrib org-bullets open-junk-file neotree move-text macrostep lorem-ipsum linum-relative link-hint info+ indent-guide ido-vertical-mode hydra hungry-delete hl-todo highlight-parentheses highlight-numbers parent-mode highlight-indentation hide-comnt help-fns+ helm-themes helm-swoop helm-projectile helm-mode-manager helm-make projectile pkg-info epl helm-flx helm-descbinds helm-ag google-translate golden-ratio flx-ido flx fill-column-indicator fancy-battery eyebrowse expand-region exec-path-from-shell evil-visualstar evil-visual-mark-mode evil-unimpaired evil-tutor evil-surround evil-search-highlight-persist evil-numbers evil-nerd-commenter evil-mc evil-matchit evil-lisp-state smartparens evil-indent-plus evil-iedit-state iedit evil-exchange evil-escape evil-ediff evil-args evil-anzu anzu evil goto-chg undo-tree eval-sexp-fu highlight elisp-slime-nav dumb-jump f s diminish define-word column-enforce-mode clean-aindent-mode bind-map bind-key auto-highlight-symbol auto-compile packed dash aggressive-indent adaptive-wrap ace-window ace-link ace-jump-helm-line helm avy helm-core popup async quelpa package-build spacemacs-theme)))
 '(pop-up-frames t)
 '(safe-local-variable-values
   (quote
    ((intero-targets "hpsv-parser:test:test")
     (intero-targets "exp201708:lib")
     (intero-targets "hpsv-parser:lib" "hpsv-parser:test:test"))))
 '(smtpmail-smtp-server "localhost")
 '(smtpmail-smtp-service 25)
 '(standard-indent 2)
 '(tramp-default-method "ssh")
 '(undo-tree-history-directory-alist (quote (("." . "~/.saves"))))
 '(whitespace-global-modes t)
 '(whitespace-style
   (quote
    (face tabs newline indentation tab-mark newline-mark))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
(defun dotspacemacs/emacs-custom-settings ()
  "Emacs custom settings.
This is an auto-generated function, do not modify its content directly, use
Emacs customize menu instead.
This function is called at the very end of Spacemacs initialization."
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(backup-directory-alist (quote ((".*" . "temporary-file-directory"))))
 '(browse-url-browser-function (quote browse-url-firefox))
 '(dante-load-flags
   (quote
    ("+c" "-ferror-spans" "-fdefer-type-errors" "-Wwarn=missing-home-modules" "-fdiagnostics-color=never" "-fno-diagnostics-show-caret")))
 '(dante-methods
   (quote
    (new-impure-nix-project new-impure-nix new-build bare-ghci)))
 '(dante-methods-alist
   (quote
    ((new-impure-nix-project dante-cabal-new-nix
                             ("nix-shell" "--run"
                              (concat "cabal v2-repl "
                                      (progn
                                        (setq-local dante-package-name nil)
                                        (or dante-target
                                            (dante-package-name
                                             (dante-cabal-find-file
                                              (file-name-directory
                                               (buffer-file-name))))
                                            ""))
                                      " --builddir=dist-newstyle/dante")))
     (styx "styx.yaml"
           ("styx" "repl" dante-target))
     (new-impure-nix dante-cabal-nix
                     ("nix-shell" "--run"
                      (concat "cabal v2-repl "
                              (progn
                                (setq-local dante-package-name nil)
                                (or dante-target
                                    (dante-package-name
                                     (dante-cabal-find-file
                                      (file-name-directory
                                       (buffer-file-name))))
                                    ""))
                              " --builddir=dist-newstyle/dante")))
     (new-nix dante-cabal-nix
              ("nix-shell" "--pure" "--run"
               (concat "cabal v2-repl "
                       (progn
                         (setq-local dante-package-name nil)
                         (or dante-target
                             (dante-package-name
                              (dante-cabal-find-file
                               (file-name-directory
                                (buffer-file-name))))
                             ""))
                       " --builddir=dist-newstyle/dante")))
     (nix dante-cabal-nix
          ("nix-shell" "--pure" "--run"
           (concat "cabal v1-repl "
                   (or dante-target "")
                   " --builddir=dist/dante")))
     (impure-nix dante-cabal-nix
                 ("nix-shell" "--run"
                  (concat "cabal v1-repl "
                          (or dante-target "")
                          " --builddir=dist/dante")))
     (new-build
      (lambda
        (d)
        (directory-files d t "..cabal$"))
      ("cabal" "new-repl"
       (or dante-target
           (dante-package-name)
           nil)
       "--builddir=dist-newstyle/dante"))
     (nix-ghci
      #[257 "\300\301\302#\207"
            [directory-files t "shell.nix\\|default.nix"]
            5 "

(fn D)"]
      ("nix-shell" "--pure" "--run" "ghci"))
     (stack "stack.yaml"
            ("stack" "repl" dante-target))
     (mafia "mafia"
            ("mafia" "repl" dante-target))
     (bare-cabal
      #[257 "\300\301\302#\207"
            [directory-files t "..cabal$"]
            5 "

(fn D)"]
      ("cabal" "v1-repl" dante-target "--builddir=dist/dante"))
     (bare-ghci
      #[257 "\300\207"
            [t]
            2 "

(fn _)"]
      ("ghci")))))
 '(dired-listing-switches "-alh")
 '(evil-digraphs-table-user
   (quote
    (((48 120)
      . 8855)
     ((48 88)
      . 11198)
     ((44 46)
      . 8230)
     ((47 8773)
      . 8775)
     ((48 43)
      . 8853)
     ((45 115)
      . 8608)
     ((45 105)
      . 8618)
     ((45 126)
      . 10610)
     ((68 115)
      . 119967)
     ((76 115)
      . 8466)
     ((67 115)
      . 119966)
     ((77 115)
      . 8499)
     ((80 115)
      . 119979)
     ((78 115)
      . 119977)
     ((83 115)
      . 119982)
     ((84 115)
      . 119983)
     ((65 115)
      . 119964)
     ((66 115)
      . 8492)
     ((58 61)
      . 8788)
     ((61 58)
      . 8789)
     ((61 63)
      . 8773))) nil (evil-digraphs))
 '(evil-want-Y-yank-to-eol t)
 '(fill-column 80)
 '(flycheck-pos-tip-timeout -1)
 '(gnus-buttonized-mime-types (quote ("multipart/signed" "multipart/encrypted")))
 '(haskell-mode-stylish-haskell-path "brittany")
 '(js-indent-level 2)
 '(js2-strict-missing-semi-warning nil)
 '(linum-delay t)
 '(linum-eager t)
 '(mm-decrypt-option (quote always))
 '(mm-verify-option (quote always))
 '(package-selected-packages
   (quote
    (tide typescript-mode import-js grizzl add-node-modules-path ghub let-alist org-mime ag org-category-capture winum fuzzy csv-mode vimrc-mode dactyl-mode nlinum-relative nlinum helm-company helm-c-yasnippet company-web web-completion-data company-tern dash-functional tern company-statistics company-cabal company-auctex auto-yasnippet ac-ispell auto-complete if-emacs bbdb yaml-mode web-mode web-beautify tagedit slim-mode scss-mode sass-mode rvm ruby-tools ruby-test-mode rubocop rspec-mode robe rcirc-notify rcirc-color rbenv pug-mode projectile-rails rake inflections minitest livid-mode skewer-mode simple-httpd less-css-mode json-mode json-snatcher json-reformat js2-refactor multiple-cursors js2-mode js-doc helm-css-scss haml-mode feature-mode emmet-mode coffee-mode chruby bundler inf-ruby auctex-latexmk auctex orgit org-present org-pomodoro alert log4e markdown-toc magit-gitflow intero helm-gitignore haskell-snippets git-gutter-fringe+ git-gutter-fringe fringe-helper git-gutter+ flyspell-correct-helm flycheck-pos-tip pos-tip flycheck-haskell evil-magit magit magit-popup git-commit company-ghci company-ghc ghc xterm-color smeargle shell-pop org-projectile org gntp org-download multi-term mmm-mode markdown-mode htmlize hlint-refactor hindent helm-hoogle yasnippet gnuplot gitignore-mode gitconfig-mode gitattributes-mode git-timemachine git-messenger git-link git-gutter gh-md flyspell-correct flycheck with-editor eshell-z eshell-prompt-extras esh-help diff-hl company haskell-mode cmm-mode auto-dictionary ws-butler window-numbering which-key volatile-highlights vi-tilde-fringe uuidgen use-package toc-org spaceline powerline restart-emacs request rainbow-delimiters popwin persp-mode pcre2el paradox spinner org-plus-contrib org-bullets open-junk-file neotree move-text macrostep lorem-ipsum linum-relative link-hint info+ indent-guide ido-vertical-mode hydra hungry-delete hl-todo highlight-parentheses highlight-numbers parent-mode highlight-indentation hide-comnt help-fns+ helm-themes helm-swoop helm-projectile helm-mode-manager helm-make projectile pkg-info epl helm-flx helm-descbinds helm-ag google-translate golden-ratio flx-ido flx fill-column-indicator fancy-battery eyebrowse expand-region exec-path-from-shell evil-visualstar evil-visual-mark-mode evil-unimpaired evil-tutor evil-surround evil-search-highlight-persist evil-numbers evil-nerd-commenter evil-mc evil-matchit evil-lisp-state smartparens evil-indent-plus evil-iedit-state iedit evil-exchange evil-escape evil-ediff evil-args evil-anzu anzu evil goto-chg undo-tree eval-sexp-fu highlight elisp-slime-nav dumb-jump f s diminish define-word column-enforce-mode clean-aindent-mode bind-map bind-key auto-highlight-symbol auto-compile packed dash aggressive-indent adaptive-wrap ace-window ace-link ace-jump-helm-line helm avy helm-core popup async quelpa package-build spacemacs-theme)))
 '(pop-up-frames t)
 '(safe-local-variable-values
   (quote
    ((dante-target . req:pure-tests)
     (intero-targets "hpsv-parser:test:test")
     (intero-targets "exp201708:lib")
     (intero-targets "hpsv-parser:lib" "hpsv-parser:test:test"))))
 '(smtpmail-smtp-server "localhost")
 '(smtpmail-smtp-service 25)
 '(standard-indent 2)
 '(tide-node-executable "/home/jan/n/bin/node")
 '(tramp-default-method "ssh")
 '(typescript-indent-level 2)
 '(undo-tree-history-directory-alist (quote (("." . "~/.saves"))))
 '(whitespace-global-modes t)
 '(whitespace-style
   (quote
    (face tabs newline indentation tab-mark newline-mark))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
)
