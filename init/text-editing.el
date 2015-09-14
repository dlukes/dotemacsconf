(load "editorconfig")

(setq-default indent-tabs-mode nil)
;; defer these settings to .editorconfig
;; (setq default-tab-width 2)
;; (setq tab-stop-list (number-sequence 2 200 2))
(set-keyboard-coding-system 'utf-8)
(setq column-number-mode t)
(add-hook 'before-save-hook 'delete-trailing-whitespace)

;; set font (should be done as part of an alist of things that are only
;; evaluated when a GUI frame is started):
;; (set-face-attribute 'default nil :font "Ubuntu Mono-11")
(if (string-equal system-type "darwin")
    (setq default-frame-alist '((font . "Menlo-12")))
  (setq default-frame-alist '((font . "Liberation Mono-10"))))

;; set line numbers
;; (global-linum-mode t)

;; set auto-completing paired characters
;; (electric-pair-mode 1)

;; highlight current line
(global-hl-line-mode t)

;; hard-wrap long lines
(add-hook 'after-change-major-mode-hook 'auto-fill-mode)

;; display margin (fucks up C-p, unfortunately)
;; (require 'fill-column-indicator)
;; (add-hook 'after-change-major-mode-hook 'fci-mode)
;; (setq fci-rule-width 3)
;; (setq fci-rule-color "IndianRed3")

;; rainbow parens
;; (require 'rainbw-delimiters)
;; (add-hook 'lisp-mode-hook 'rainbow-delimiters-mode)
