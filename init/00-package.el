(require 'package)

(add-to-list 'package-archives
             '("melpa" . "http://melpa.milkbox.net/packages/") t)
(add-to-list 'package-archives
             '("marmalade" . "http://marmalade-repo.org/packages/"))
(add-to-list 'package-archives
             '("suncom"   . "http://joseito.republika.pl/sunrise-commander/"))

(package-initialize)
(package-refresh-contents)

(defvar my-packages '(better-defaults paredit idle-highlight-mode
  enh-ruby-mode flx-ido ido-ubiquitous find-file-in-project magit
  projectile flx smex scpaste markdown-mode haml-mode org
  company-jedi auctex cider undo-tree pandoc-mode clojure-mode
  ess js2-mode php-mode slime web-mode editorconfig evil css-mode
  neotree yaml-mode go-mode nyan-mode visual-regexp company
  visual-regexp-steroids sunrise-commander sunrise-x-checkpoints
  sunrise-x-tabs sunrise-x-loop sunrise-x-modeline yasnippet
  zenburn-theme evil-commentary))

(dolist (p my-packages)
  (when (not (package-installed-p p))
    (package-install p)))
