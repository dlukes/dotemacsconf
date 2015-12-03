(require 'package)
(require 'cl)

(package-initialize)

(add-to-list 'package-archives
             '("melpa" . "http://melpa.milkbox.net/packages/") t)
(add-to-list 'package-archives
             '("marmalade" . "http://marmalade-repo.org/packages/"))
(add-to-list 'package-archives
             '("suncom"   . "http://joseito.republika.pl/sunrise-commander/"))

(defvar my-packages '(better-defaults idle-highlight-mode
  enh-ruby-mode flx-ido ido-ubiquitous magit projectile flx smex
  scpaste markdown-mode haml-mode org company-jedi auctex cider
  undo-tree pandoc-mode clojure-mode ess js2-mode php-mode slime
  web-mode editorconfig evil css-mode neotree yaml-mode go-mode
  nyan-mode visual-regexp company visual-regexp-steroids
  sunrise-commander sunrise-x-checkpoints sunrise-x-tabs
  sunrise-x-loop sunrise-x-modeline yasnippet zenburn-theme
  evil-commentary key-chord git-gutter+ use-package nix-mode
  evil-surround spaceline flycheck auto-compile pyenv-mode pyvenv
  fancy-battery))
;; other modes to consider: eyebrowse or persp-mode for organizing workspaces;
;; anzu for improved searching

(unless (every #'package-installed-p my-packages)
  ;; check for new packages (package versions)
  (message "Refreshing package database...")
  (package-refresh-contents)
  (message " done.")
  ;; install the missing packages
  (dolist (p my-packages)
    (when (not (package-installed-p p))
      (package-install p))))

(require 'better-defaults)
(require 'use-package)
