;;; Straight
(defvar bootstrap-version)
(let ((bootstrap-file
       (expand-file-name "straight/repos/straight.el/bootstrap.el" user-emacs-directory))
      (bootstrap-version 5))
  (unless (file-exists-p bootstrap-file)
    (with-current-buffer
        (url-retrieve-synchronously
         "https://raw.githubusercontent.com/raxod502/straight.el/develop/install.el"
         'silent 'inhibit-cookies)
      (goto-char (point-max))
      (eval-print-last-sexp)))
  (load bootstrap-file nil 'nomessage))
(setq package-enable-at-startup nil)
(straight-use-package 'use-package)
(setq straight-use-package-by-default t)

;;; Better-defaults
(use-package better-defaults)

;;; Font
(set-face-attribute 'default nil :height 110)
(set-frame-font "JetBrainsMono Nerd Font 12" nil t)

;;; Ring bell
(setq ring-bell-function 'ignore)

;;; Line hightlight
(global-hl-line-mode t)

;;; Word wrap
(global-visual-line-mode t)

;;; Backup files
(setq make-backup-files nil
      auto-save-default nil)

;;; Undo-fu
(use-package undo-fu)

;;; Evil
(use-package evil
  :demand t
  :bind (("<escape>" . keyboard-escape-quit))
  :init
  (setq evil-want-integration t)
  (setq evil-want-keybinding nil)
  (setq evil-undo-system 'undo-fu)
  (setq evil-want-C-u-scroll t)
  :config
  (evil-ex-define-cmd "ls" 'ibuffer)
  (evil-ex-define-cmd "term" 'vterm)
  (evil-mode 1))

(use-package evil-collection
  :after evil
  :config
  (setq evil-want-integration t)
  (evil-collection-init))

(use-package evil-commentary
  :config
  (evil-commentary-mode))

;;; Spacemacs-theme
(use-package spacemacs-theme
  :defer t
  :init (load-theme 'spacemacs-dark t))

;;; Spaceline
(use-package spaceline
  :config
  (require 'spaceline-config)
  (setq spaceline-highlight-face-func 'spaceline-highlight-face-evil-state)
  (setq powerline-default-separator 'wave)
         (spaceline-spacemacs-theme))

;;; Vterm
(use-package vterm)

;;; Magit
(use-package magit)

;;; Git-gutter
(use-package git-gutter
  :config
  (global-git-gutter-mode +1)
  (custom-set-variables '(git-gutter:update-interval 2)))

;;; Which-key
(use-package which-key
  :config
  (which-key-mode)
  (which-key-setup-minibuffer))

;;; Smartparens
(use-package smartparens
  :config
  (require 'smartparens-config)
  (smartparens-global-mode))

;;; Indent-guide
(use-package indent-guide
  :config
  (indent-guide-global-mode))

;; Exec-path-from-shell
(use-package exec-path-from-shell
  :config
  (exec-path-from-shell-initialize))

;;; Anzu
(use-package anzu
  :config
  (global-set-key [remap query-replace] 'anzu-query-replace)
  (global-set-key [remap query-replace-regexp] 'anzu-query-replace-regexp)
  (global-anzu-mode +1))

;;; Company
(use-package company
  :config
  (setq company-idle-delay 0.0)
  (setq company-minimum-prefix-length 1)
  (global-company-mode t))

(use-package company-quickhelp
  :config
  (company-quickhelp-mode))

(use-package company-box
  :hook (company-mode . company-box-mode))

;;; Flycheck
(use-package flycheck
  :init (global-flycheck-mode))

;;; Yasnippet
(use-package yasnippet
  :config
  (yas-global-mode 1))

(use-package yasnippet-snippets
  :after yasnippet)

;;; Emojify
(use-package emojify
  :hook (after-init . global-emojify-mode))

(use-package company-emoji
  :after company
  :config
  (add-to-list 'company-backends 'company-emoji))

;;; Rainbow delimiters
(use-package rainbow-delimiters
  :config
  (add-hook 'prog-mode-hook #'rainbow-delimiters-mode))

;;; General
(use-package general
  :after evil
  :config
  (general-create-definer wc/leader-keys
    :keymaps '(normal insert visual emacs)
    :prefix "SPC"
    :global-prefix "C-SPC")

  (wc/leader-keys
    "ff" 'counsel-find-file
    "fb" 'switch-to-buffer
    "ft" 'neotree-toggle
    "pp" 'projectile-switch-project
    "pf" 'projectile-find-file
    "pk" 'projectile-kill-buffers))

;;; Projectile
(use-package projectile
  :config
  (projectile-mode +1)
  (define-key projectile-mode-map (kbd "C-c p") 'projectile-command-map)
  (setq projectile-project-search-path '("~" "~/spaghetti/private/" "~/spaghetti/dfds/"))
  (projectile-discover-projects-in-search-path))

;;; Neotree
(use-package neotree
  :config
  (setq neo-theme (if (display-graphic-p) 'icons 'arrow))
  (setq neo-window-position 'right)
  (setq projectile-switch-project-action 'neotree-projectile-action)
  (setq neo-window-fixed-size nil))

(use-package all-the-icons
  :after neotree)

;;; Elfeed
(use-package elfeed
  :config
  (setq elfeed-feeds
        '(("https://xkcd.com/rss.xml" comic))))

;;; Go-mode
(use-package go-mode
  :config
  (add-hook 'go-mode-hook (lambda () (setq tab-width 4
                                           indent-tabs-mode 1))))

;;; Terraform
(use-package terraform-mode)

;;; Yaml
(use-package yaml-mode
  :config
  (add-to-list 'auto-mode-alist '("\\.yml\\'" . yaml-mode))
  (add-to-list 'auto-mode-alist '("\\.yaml\\'" . yaml-mode))
  (add-hook 'yaml-mode-hook
  '(lambda ()
    (define-key yaml-mode-map "\C-m" 'newline-and-indent))))

;;; Lsp
(use-package lsp-mode
  :after (which-key)
  :init
  (setq lsp-keymap-prefix "C-c l")
  :hook
  ;; (prog-mode . lsp-deferred)
  (go-mode . lsp-deferred)
  (bash-mode . lsp-deferred)
  (terraform-mode . lsp-deferred)
  (lsp-mode . lsp-enable-which-key-integration)
  :config
  (setq lsp-auto-guess-root t)
  :commands
  lsp)

;;; Ivy
(use-package ivy
  :config
  (ivy-mode))

(use-package swiper)

(use-package counsel)

(use-package counsel-projectile
  :config
  (counsel-projectile-mode))

(use-package lsp-ivy)
