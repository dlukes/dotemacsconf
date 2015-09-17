(require 'yasnippet)

(add-to-list 'yas-snippet-dirs (concat emacs-conf "snippets"))
(yas-global-mode)

(global-set-key (kbd "C-c e") 'yas-expand)
