;; M-. for goto def, M-, for pop goto def:
(setq jedi:use-shortcuts t)

(add-hook 'python-mode-hook 'jedi:setup)
