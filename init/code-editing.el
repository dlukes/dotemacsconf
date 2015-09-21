(defun comment-line ()
  (interactive)
  (comment-or-uncomment-region (line-beginning-position) (line-end-position)))

(global-set-key (kbd "C-;") 'comment-line)

(defun dlukes-coding-hook ()
  (make-local-variable 'column-number-mode)
  (column-number-mode t)
  (idle-highlight-mode t))

(add-hook 'emacs-lisp-mode-hook 'dlukes-coding-hook)
(add-hook 'python-mode-hook 'dlukes-coding-hook)
(add-hook 'js2-mode-hook 'dlukes-coding-hook)
