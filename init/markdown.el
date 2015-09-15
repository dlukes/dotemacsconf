(require 'markdown-mode)

(add-hook 'markdown-mode-hook 'pandoc-mode)

;; (eval-after-load 'markdown-mode
;;   '(define-key markdown-mode-map (kbd "M-RET") 'markdown-insert-list-item))
(define-key markdown-mode-map (kbd "M-RET") 'markdown-insert-list-item)
