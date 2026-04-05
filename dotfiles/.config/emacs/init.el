;;; -*- lexical-binding: t; -*-
(use-package emacs
  :custom
  (menu-bar-mode nil)
  (tool-bar-mode nil)
  (scroll-bar-mode nil)

  :custom
  (electric-indent-mode nil)
  (electric-pair-mode t)

  :custom
  (inhibit-startup-screen t)
  (inhibit-splash-screen t)

  :custom
  (global-auto-revert-mode t)
  (display-line-numbers-type 'relative)
  (global-display-line-numbers-mode t)
  (scroll-conservatively 12) ;; Smooth scrolling

  :custom
  (tab-width 4)
  (indent-tabs-mode nil)

  :custom
  (make-backup-files nil) ;; Stop creating ~ backup files
  (auto-save-default nil)

  :custom
  (window-resize-pixelwise t)
  (frame-resize-pixelwise t)
  (frame-inhibit-implied-resize t) ;; prevent resize window on startup

  :custom
  (recentf-mode t)
  (recentf-max-menu-items 16)
  (recentf-max-saved-items 40)

  :custom
  (truncate-lines t)
  (word-wrap nil)

  :custom
  (save-place-mode t)

  :custom
  (global-auto-revert-mode t)

  :config
  (setq custom-file "~/.config/emacs/emacs.custom.el")
  (load custom-file 'noerror 'nomessage)
  :config
  (setq completion-styles '(basic flex))
  (setq completions-sort 'historical)
  (setq help-window-select t)
  (setq use-dialog-box nil)
  (setq initial-scratch-message nil)
  (setq package-native-compile t)

  :config
  (set-input-method "vietnamese-telex")
  (toggle-input-method) ;; immediately reset back to english.

  :config
  (define-key key-translation-map (kbd "M-h") (kbd "C-h"))

  :config
  (add-hook 'emacs-lisp-mode-hook
            (lambda ()
              (setq-local eldoc-documentation-function nil)))

  :bind
  (([escape] . keyboard-escape-quit)
   ("C-=" . text-scale-increase)
   ("C--" . text-scale-decrease)
   ("<C-wheel-up>" . text-scale-increase)
   ("<C-wheel-down>" . text-scale-decrease)))


(setq gc-cons-threshold (* 50 1000 1000))
(setq use-package-always-ensure t)
(setq package-quickstart t)

(setq package-archives
      '(("melpa" . "http://melpa.org/packages/")
        ("org"   . "https://orgmode.org/elpa/")
        ("elpa"  . "https://elpa.gnu.org/packages/")
        ("nongnu" . "https://elpa.nongnu.org/nongnu/")))

(use-package evil
  :init
  (evil-mode)
  :custom
  (evil-set-initial-state  'insert)
  (evil-want-keybinding nil)
  (evil-want-C-u-scroll t)
  (evil-want-C-i-jump nil)
  (evil-undo-system 'undo-redo)

  :bind
  (:map evil-motion-state-map
        ("SPC" . nil)
        ("RET" . nil)
        ("TAB" . nil))
  :preface
  ;; shutting up warnings, don't matter can skip.
  (declare-function evil-window-vnew "evil-window")
  (declare-function evil-window-new  "evil-window")

  :config
  (defalias 'vnew #'evil-window-vnew)
  (defalias 'new  #'evil-window-new)
  )

(use-package evil-collection
  :after evil
  :config
  (setq evil-collection-mode-list
        '(dired ibuffer woman vertico info eshell compile helpful eww (package-menu package) (custom cus-edit) (pdf pdf-view)))
  (evil-collection-init))

(use-package evil-commentary
  :after evil
  :init
  (evil-commentary-mode))

(set-face-attribute 'fixed-pitch nil
                    :family "JetBrainsMono Nerd Font"
                    :height 120
                    :weight 'normal)

(set-face-attribute 'default nil
                    :font "JetBrainsMono Nerd Font"
                    :height 140
                    :weight 'normal)

(add-to-list 'default-frame-alist
             '(font . "JetBrainsMono Nerd Font-14"))

(setq-default line-spacing 0.12)

(use-package which-key
  :ensure nil
  :init
  (which-key-mode 1)
  :custom
  (which-key-side-window-location 'bottom)
  (which-key-sort-order #'which-key-key-order-alpha)
  (which-key-sort-uppercase-first nil)
  (which-key-add-column-padding 1)
  (which-key-min-display-lines 6)
  (which-key-idle-delay 0.8)
  (which-key-max-description-length 25)
  (which-key-allow-imprecise-window-fit nil))

(use-package general
  :config
  (general-evil-setup)

  (general-create-definer nigel/leader-keys
    :states '(normal insert visual motion emacs)
    :keymaps 'override
    :prefix "SPC"
    :global-prefix "C-SPC"
    )

  (nigel/leader-keys
    "e"  '(:ignore t :wk "Evaluate")
    "eb" '(eval-buffer :wk "Evaluate buffer")
    "ed" '(eval-defun :wk "Evaluate defun")
    "ee" '(eval-expression :wk "Evaluate expression")
    "er" '(eval-region :wk "Evaluate region"))

  (nigel/leader-keys
    "b"  '(:ignore t :wk "Buffer")
    "fb" '(switch-to-buffer :wk "Switch buffer")
    "bn" '(next-buffer :wk "Next buffer")
    "bp" '(previous-buffer :wk "Previous buffer")
    "bk" '(kill-this-buffer :wk "Kill buffer")
    "br" '(revert-buffer :wk "Reload buffer")
    "bi" '(ibuffer :wk "Ibuffer"))

  (nigel/leader-keys
    "f"  '(:ignore t :wk "Find")
    "fc" '((lambda () (interactive)
             (find-file "~/.config/emacs/init.org"))
           :wk "Find config")
    "ff" '(find-file :wk "Find file")
    "fp" '(project-find-file :wk "Find file/Find projects")
    "fo" '(recentf-open :wk "Recent files")
    "w"  '(save-buffer :wk "Save")
    "q"  '(evil-quit :wk "Quit"))

  (general-define-key
   :states '(normal visual)
   "M-u" (kbd "C-u zz")
   "M-d" (kbd "C-d zz"))
  (general-define-key
   :states '(normal visual insert)
   "M-w" 'evil-window-map
   "M-w m" '(evil-window-vnew :wk "Vertical window")
   "M-r" 'compile
   "M-q" 'evil-quit)

  (nigel/leader-keys
    "xx" '(flycheck-list-errors :wk "List errors")
  )
  (nigel/leader-keys
    "zi" '(lambda () (interactive)
            (toggle-input-method))))

(use-package undo-fu-session
  :config
  (setq undo-fu-session-incompatible-files
        '("/COMMIT_EDITMSG\\'" "/git-rebase-todo\\'"))
  (setq undo-fu-session-directory "~/.config/emacs/undo")
  (undo-fu-session-global-mode))

(use-package ws-butler
  :init
  (ws-butler-global-mode))

(use-package nerd-icons
  :if (display-graphic-p))

(use-package nerd-icons-dired
  :hook (dired-mode . nerd-icons-dired-mode))

(use-package nerd-icons-ibuffer
  :hook (ibuffer-mode . nerd-icons-ibuffer-mode))

(use-package flycheck
  :init
  (global-flycheck-mode))

(use-package lsp-mode
  :init
  (setq lsp-keymap-prefix "C-c l")

  :custom
  (lsp-completion-sort-initial-results nil)
  (lsp-diagnostics-provider :flycheck)
  (lsp-clients-clangd-args
   '("--header-insertion=never"
     "--completion-style=bundled"
     "--background-index"))

  :hook
  ((c-ts-mode c++-ts-mode java-ts-mode zig-ts-mode) . lsp-deferred) ;; treesit-mode
  ((c-mode c++-mode java-mode zig-mode) . lsp-deferred)
  :config
  (general-define-key
   :states '(normal)
   "grn" 'lsp-rename)

  :config
  (defun lsp--to-yasnippet-snippet (snippet)
    "Convert LSP SNIPPET to yasnippet snippet."
    ;; LSP snippet doesn't escape "{" and "`", but yasnippet requires escaping it.
    (setq snippet
          (replace-regexp-in-string
           "\\$TM_SELECTED_TEXT"
           "$0"
           snippet t t))
    (replace-regexp-in-string (rx (or bos (not (any "$" "\\"))) (group (or "{" "`")))
                              (rx "\\" (backref 1))
                              snippet
                              nil nil 1))

  :commands (lsp lsp-deferred lsp-format-buffer)
  )

(use-package lsp-java
  :after lsp-mode
  :config
  (add-hook 'java-ts-mode-hook
            (lambda ()
              (setq-local lsp-java-format-enabled t)
              (setq-local format-all-formatters nil)
              (add-hook 'before-save-hook #'lsp-format-buffer nil t)
              (lsp))))

(use-package zig-mode
  :config
  ;; shutting up warnings, don't matter can skip.
  (defvar language-id--definitions)
  ;; shutting up warnings, don't matter can skip.
  (defvar evil-textobj-tree-sitter-major-mode-language-alist)

  (with-eval-after-load 'language-id
    (setq language-id--definitions
          (cons '("Zig" zig-mode zig-ts-mode)
                (cl-remove-if
                 (lambda (x)
                   (and (consp x)
                        (string= (car x) "Zig")))
                 language-id--definitions)))

    (with-eval-after-load 'evil-textobj-tree-sitter
      (setf (map-elt evil-textobj-tree-sitter-major-mode-language-alist
                     'zig-ts-mode)
            "zig"))

    ))

(use-package lsp-ui
  :commands lsp-ui-mode
  :custom
  (lsp-ui-sideline-enable t)
  (lsp-ui-sideline-show-hover nil)
  (lsp-eldoc-enable-hover nil))

(use-package company
  :hook (after-init . global-company-mode)
  :config
  (setq company-minimum-prefix-length 2
        company-idle-delay 0.1))

(use-package yasnippet
  :init
  :config
  (define-key yas-minor-mode-map (kbd "SPC") yas-maybe-expand)
  (yas-global-mode))

(use-package format-all
  :commands format-all-mode
  :hook
  ((prog-mode . format-all-mode)
   (format-all-mode . format-all-ensure-formatter)))

(use-package doom-modeline
  :custom
  (doom-modeline-height 48)
  (doom-modeline-hud nil)
  :hook
  (after-init . doom-modeline-mode))

(use-package treesit
  :ensure nil
  :config
  (setq treesit-language-source-alist
        '((bash . "https://github.com/tree-sitter/tree-sitter-bash")
          (cmake . "https://github.com/uyha/tree-sitter-cmake")
          (c . "https://github.com/tree-sitter/tree-sitter-c")
          (cpp . "https://github.com/tree-sitter/tree-sitter-cpp")
          (css . "https://github.com/tree-sitter/tree-sitter-css")
          (elisp . "https://github.com/Wilfred/tree-sitter-elisp")
          (go . "https://github.com/tree-sitter/tree-sitter-go")
          (gomod . "https://github.com/camdencheek/tree-sitter-go-mod")
          (html . "https://github.com/tree-sitter/tree-sitter-html")
          (javascript . ("https://github.com/tree-sitter/tree-sitter-javascript" "master" "src"))
          (json . "https://github.com/tree-sitter/tree-sitter-json")
          (make . "https://github.com/alemuller/tree-sitter-make")
          (markdown . "https://github.com/ikatyang/tree-sitter-markdown")
          (python . "https://github.com/tree-sitter/tree-sitter-python")
          (rust . "https://github.com/tree-sitter/tree-sitter-rust")
          (toml . "https://github.com/tree-sitter/tree-sitter-toml")
          (zig . "https://github.com/tree-sitter/tree-sitter-zig")))

  ;;  add any additional mode remappings not covered by defaults
  (setq major-mode-remap-alist
        '((yaml-mode . yaml-ts-mode)
          (sh-mode . bash-ts-mode)
          (c-mode . c-ts-mode)
          (c++-mode . c++-ts-mode)
          (css-mode . css-ts-mode)
          (python-mode . python-ts-mode)
          (mhtml-mode . html-ts-mode)
          (javascript-mode . js-ts-mode)
          (json-mode . json-ts-mode)
          (typescript-mode . typescript-ts-mode)
          (conf-toml-mode . toml-ts-mode)
          (zig-mode . zig-ts-mode)
          (java-mode . java-ts-mode)))

  (setq treesit-font-lock-level 4)

  :preface
  ;; Call this function to install missing grammars
  (defun start/install-treesit-grammars ()
    "Install missing treesitter grammars."
    (interactive)
    (dolist (grammar treesit-language-source-alist)
      (let ((lang (car grammar)))
        (unless (treesit-language-available-p lang)
          (treesit-install-language-grammar lang)))))
  :config
  (start/install-treesit-grammars)
  )

;; Or if there is no built in mode
(use-package cmake-ts-mode
  :ensure nil
  :mode ("CMakeLists\\.txt\\'" "\\.cmake\\'"))

(use-package go-ts-mode
  :ensure nil
  :mode "\\.go\\'")

(use-package go-mod-ts-mode
  :ensure nil
  :mode "\\.mod\\'")

(use-package rust-ts-mode
  :ensure nil
  :mode "\\.rs\\'")

(use-package tsx-ts-mode
  :ensure nil
  :mode "\\.tsx\\'")

(use-package zig-ts-mode
  :ensure nil
  :mode "\\.zig\\(?:\\.zon\\)?\\'")

(use-package evil-textobj-tree-sitter
  :after evil
  :config
  (define-key evil-outer-text-objects-map "f"
              (evil-textobj-tree-sitter-get-textobj "function.outer"))
  (define-key evil-inner-text-objects-map "f"
              (evil-textobj-tree-sitter-get-textobj "function.inner"))
  (define-key evil-outer-text-objects-map "i"
              (evil-textobj-tree-sitter-get-textobj "conditional.outer"))
  (define-key evil-inner-text-objects-map "i"
              (evil-textobj-tree-sitter-get-textobj "conditional.inner"))
  (define-key evil-outer-text-objects-map "o"
              (evil-textobj-tree-sitter-get-textobj "loop.outer"))
  (define-key evil-inner-text-objects-map "o"
              (evil-textobj-tree-sitter-get-textobj "loop.inner"))
  (define-key evil-outer-text-objects-map "c"
              (evil-textobj-tree-sitter-get-textobj "class.outer"))
  (define-key evil-inner-text-objects-map "c"
              (evil-textobj-tree-sitter-get-textobj "class.inner")))

(use-package diff-hl
  :hook ((dired-mode . diff-hl-dired-mode-unless-remote)
         (magit-post-refresh . diff-hl-magit-post-refresh))
  :init
  (global-diff-hl-mode)
  (diff-hl-margin-mode))

(use-package pdf-tools
  :defer t
  :commands (pdf-loader-install)
  :mode "\\.pdf\\'"
  :bind (:map pdf-view-mode-map
              ("j" . pdf-view-next-line-or-next-page)
              ("k" . pdf-view-previous-line-or-previous-page)
              ("C-=" . pdf-view-enlarge)
              ("C--" . pdf-view-shrink))
  :init
  (pdf-loader-install)
  :config
  (add-to-list 'revert-without-query ".pdf")
  :hook
  (pdf-view-mode . (lambda ()
                     (interactive)
                     (display-line-numbers-mode -1))))

(use-package good-scroll
  :init
  (good-scroll-mode))

(use-package helpful
  :bind
  (("C-h f" . helpful-symbol)
   ("C-h o" . helpful-symbol)
   ("C-h v" . helpful-variable)
   ("C-h k" . helpful-key)
   ("C-h x" . helpful-command)
   ("M-f" . helpful-symbol))
  )

(use-package vertico
  :init
  (vertico-mode)
  :custom
  (vertico-count 16))

(savehist-mode)

(use-package marginalia
  :after vertico
  :init
  (marginalia-mode))

(use-package nerd-icons-completion
  :after marginalia
  :config
  (nerd-icons-completion-mode)
  :hook
  (marginalia-mode . nerd-icons-completion-marginalia-setup))

(setq gc-cons-threshold (* 2 1000 1000))
(setq read-process-output-max (* 1024 1024))


(use-package tab-jump-out
  :vc (:url "https://github.com/NigelId/tab-jump-out"
            :rev "bbae06987d824448a61a25a639820a2cde92e11e")
  :config
  (tab-jump-out-global-mode t)
  :hook
  (yas-before-expand-snippet .
                             (lambda () (tab-jump-out-mode -1)))
  (yas-after-exit-snippet-hook .
                               (lambda () (tab-jump-out-mode 1))))

(unless (display-graphic-p)
  (use-package xclip
    :init
    (xclip-mode))
  (use-package evil-terminal-cursor-changer
    :init
    (etcc-on))
  )

;; (use-package elcord
;;   :init
;;   (elcord-mode))

(use-package mistty
  :bind (("M-e" . mistty) ("C-l" . mistty-clear)))

(use-package compile
  :ensure nil
  :config
  (advice-add 'compile :around
              (lambda (orig command &optional _comint)
                (funcall orig command t)))
  :hook
  (compilation-shell-minor-mode . evil-normal-state)
  (compilation-minor-mode . evil-normal-state))

(use-package golden-ratio
  :config
  (add-hook 'window-selection-change-functions
            (lambda (_)
              (when (bound-and-true-p golden-ratio-mode)
                (golden-ratio))))
  :hook (after-init . golden-ratio-mode)
  )

(use-package dired
  :ensure nil
  :preface
  ;; shutting up warnings, don't matter can skip.
  (declare-function dired-create-empty-file "dired-aux")

  :hook (dired-mode . dired-hide-details-mode)

  :config
  (evil-define-key 'normal dired-mode-map
    (kbd "M-n") 'dired-create-empty-file))

(use-package org
  :ensure nil
  :custom
  (org-edit-src-content-indentation 4)
  (org-return-follows-link t)
  :hook
  (org-mode . org-indent-mode)
  (org-mode . (lambda ()
                (setq-local electric-pair-inhibit-predicate
                            `(lambda (c)
                               (if (char-equal c ?<) t (,electric-pair-inhibit-predicate c))))))
  )

(use-package org-auto-tangle
  :defer t
  :hook (org-mode . org-auto-tangle-mode)
  :config
  (setq org-auto-tangle-default t)
  )

(use-package org-superstar
  :after org
  :hook (org-mode . org-superstar-mode))

(use-package org-tempo
  :ensure nil
  :after org)

(use-package toc-org
  :commands toc-org-enable
  :hook (org-mode . toc-org-mode))

(use-package colorful-mode
  ;; :diminish
  ;; :ensure t ; Optional
  :custom
  (colorful-use-prefix nil)
  (colorful-only-strings 'only-prog)
  (css-fontify-colors nil)
  :config
  (global-colorful-mode t)
  (add-to-list 'global-colorful-modes 'helpful-mode))

(use-package evil-goggles
  :config
  (evil-goggles-mode)

  ;; optionally use diff-mode's faces; as a result, deleted text
  ;; will be highlighed with `diff-removed` face which is typically
  ;; some red color (as defined by the color theme)
  ;; other faces such as `diff-added` will be used for other actions
  (evil-goggles-use-diff-faces))

(use-package cheat-sh)

(fset 'yes-or-no-p 'y-or-n-p)

(setq find-file-visit-truename t
      vc-follow-symlinks t)

(define-key minibuffer-local-map     (kbd "M-n") #'next-line)
(define-key minibuffer-local-map     (kbd "M-p") #'previous-line)

(define-key minibuffer-local-ns-map  (kbd "M-n") #'next-line)
(define-key minibuffer-local-ns-map  (kbd "M-p") #'previous-line)

(define-key minibuffer-local-completion-map (kbd "m-n") #'next-line)
(define-key minibuffer-local-completion-map (kbd "m-p") #'previous-line)

(define-key minibuffer-local-must-match-map (kbd "m-n") #'next-line)
(define-key minibuffer-local-must-match-map (kbd "m-p") #'previous-line)

(use-package doom-themes
  :custom
  (doom-themes-enable-bold t)
  (doom-themes-enable-italic nil)
  (doom-themes-treemacs-theme "doom-atom")
  :config
  (load-theme 'doom-dark+ t)

  (doom-themes-neotree-config)
  (doom-themes-treemacs-config)
  (doom-themes-org-config))

;; This assumes you've installed the package via MELPA.
(use-package ligature
  :config
  ;; Enable the "www" ligature in every possible major mode
  (ligature-set-ligatures 't '("www"))
  ;; Enable traditional ligature support in eww-mode, if the
  ;; `variable-pitch' face supports it
  (ligature-set-ligatures 'eww-mode '("ff" "fi" "ffi"))
  ;; Enable all Cascadia Code ligatures in programming modes
  (ligature-set-ligatures 'prog-mode '("|||>" "<|||" "<==>" "<!--" "####" "~~>" "***" "||=" "||>"
                                       ":::" "::=" "=:=" "===" "==>" "=!=" "=>>" "=<<" "=/=" "!=="
                                       "!!." ">=>" ">>=" ">>>" ">>-" ">->" "->>" "-->" "---" "-<<"
                                       "<~~" "<~>" "<*>" "<||" "<|>" "<$>" "<==" "<=>" "<=<" "<->"
                                       "<--" "<-<" "<<=" "<<-" "<<<" "<+>" "</>" "###" "#_(" "..<"
                                       "..." "+++" "/==" "///" "_|_" "www" "&&" "^=" "~~" "~@" "~="
                                       "~>" "~-" "**" "*>" "*/" "||" "|}" "|]" "|=" "|>" "|-" "{|"
                                       "[|" "]#" "::" ":=" ":>" ":<" "$>" "==" "=>" "!=" "!!" ">:"
                                       ">=" ">>" ">-" "-~" "-|" "->" "--" "-<" "<~" "<*" "<|" "<:"
                                       "<$" "<=" "<>" "<-" "<<" "<+" "</" "#{" "#[" "#:" "#=" "#!"
                                       "##" "#(" "#?" "#_" "%%" ".=" ".-" ".." ".?" "+>" "++" "?:"
                                       "?=" "?." "??" ";;" "/*" "/=" "/>" "//" "__" "~~" "(*" "*)"
                                       "\\\\" "://"))
  ;; Enables ligature checks globally in all buffers. You can also do it
  ;; per mode with `ligature-mode'.
  (global-ligature-mode t))
