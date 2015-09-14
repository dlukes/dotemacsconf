(require 'visual-regexp-steroids)

(define-key global-map (kbd "C-c r") 'vr/replace)
(define-key global-map (kbd "C-c q") 'vr/query-replace)
;; if you use multiple-cursors, this is for you:
(define-key global-map (kbd "C-c m") 'vr/mc-mark)
(define-key esc-map (kbd "C-r") 'vr/isearch-backward)
(define-key esc-map (kbd "C-s") 'vr/isearch-forward)
