(global-set-key "\C-cl" 'org-store-link)
(global-set-key "\C-ca" 'org-agenda)
(global-set-key "\C-cb" 'org-iswitchb)
(global-set-key "\C-cc" 'org-capture)
(setq agenda "~/org/2015.org")
(setq org-default-notes-file agenda)
(setq org-src-fontify-natively t)
(add-hook 'org-mode-hook 'turn-on-font-lock)
(setq browse-url-browser-function 'browse-url-generic
      browse-url-generic-program "google-chrome")
(setq org-mobile-inbox-for-pull  "~/org/org-mobile-inbox-for-pull")
(setq org-mobile-directory nil)
(org-babel-do-load-languages
 'org-babel-load-languages
 '((emacs-lisp . T)
   (R . t)
   (perl . t)
   (python . t)))
;; exporting phonetic transcription feedback to html → replace pipes (not done
;; with hooks anymore since org-mode 8.x)
(setq org-export-filter-final-output-functions
      '((lambda (string backend info)
          (when (org-export-derived-backend-p backend 'html)
            (replace-regexp-in-string "∣" "|" string)))))
