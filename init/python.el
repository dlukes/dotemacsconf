(defun company-jedi-hook ()
  (add-to-list 'company-backends 'company-jedi))

(add-hook 'python-mode-hook 'jedi:setup)
(add-hook 'python-mode-hook 'company-jedi-hook)
