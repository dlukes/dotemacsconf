(defun my-coding-hook ()
  (make-local-variable 'column-number-mode)
  (column-number-mode t)
  (idle-highlight-mode t))

(add-hook 'emacs-lisp-mode-hook 'my-coding-hook)
(add-hook 'python-mode-hook 'my-coding-hook)
(add-hook 'js2-mode-hook 'my-coding-hook)
