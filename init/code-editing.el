(defun dlukes-coding-hook ()
  (make-local-variable 'column-number-mode)
  (column-number-mode t)
  (idle-highlight-mode t))

(add-hook 'emacs-lisp-mode-hook 'dlukes-coding-hook)
(add-hook 'python-mode-hook 'dlukes-coding-hook)
(add-hook 'js2-mode-hook 'dlukes-coding-hook)
