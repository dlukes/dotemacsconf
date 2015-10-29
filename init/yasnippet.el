(require 'yasnippet)

(setq yas-snippet-dirs (list (concat emacs-conf "snippets") 'yas-installed-snippets-dir))
(yas-global-mode)

(global-set-key (kbd "C-c e") 'yas-expand)
