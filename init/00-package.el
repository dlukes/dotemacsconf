(require 'package)
(require 'cl)

(package-initialize)

(add-to-list 'package-archives
             '("melpa" . "http://melpa.milkbox.net/packages/") t)
(add-to-list 'package-archives
             '("marmalade" . "http://marmalade-repo.org/packages/"))
(add-to-list 'package-archives
             '("suncom"   . "http://joseito.republika.pl/sunrise-commander/"))

(defvar my-packages
  '(
    auctex
    auto-compile
    better-defaults
    cider
    clojure-mode
    company
    company-jedi
    css-mode
    editorconfig
    enh-ruby-mode
    ess
    evil
    evil-commentary
    evil-surround
    fancy-battery
    flx
    flx-ido
    flycheck
    git-gutter+
    go-mode
    haml-mode
    idle-highlight-mode
    ido-ubiquitous
    js2-mode
    key-chord
    magit
    markdown-mode
    neotree
    nix-mode
    nyan-mode
    org
    pandoc-mode
    php-mode
    projectile
    pyenv-mode
    pyvenv
    scpaste
    slime
    smex
    spaceline
    sunrise-commander
    sunrise-x-checkpoints
    sunrise-x-loop
    sunrise-x-modeline
    sunrise-x-tabs
    undo-tree
    use-package
    visual-regexp
    visual-regexp-steroids
    web-mode
    yaml-mode
    yasnippet
    zenburn-theme
    ;; other modes to consider: eyebrowse or persp-mode for organizing workspaces;
    ;; anzu for improved searching
    ))

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
