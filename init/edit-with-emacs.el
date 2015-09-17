;; (require 'edit-server)
;; (edit-server-start)
;; ;; work around for gratuitously htmlized text entry boxes such as the new Gmail
;; ;; compose window:
;; (autoload 'edit-server-maybe-dehtmlize-buffer "edit-server-htmlize" "edit-server-htmlize" t)
;; (autoload 'edit-server-maybe-htmlize-buffer   "edit-server-htmlize" "edit-server-htmlize" t)
;; (add-hook 'edit-server-start-hook 'edit-server-maybe-dehtmlize-buffer)
;; (add-hook 'edit-server-done-hook  'edit-server-maybe-htmlize-buffer)
