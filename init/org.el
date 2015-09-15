(setq agenda "~/org/2015.org"
      org-default-notes-file agenda
      org-src-fontify-natively t
      browse-url-browser-function 'browse-url-generic
      browse-url-generic-program "google-chrome"
      org-mobile-inbox-for-pull  "~/org/org-mobile-inbox-for-pull"
      org-mobile-directory nil)

;; exporting phonetic transcription feedback to html → replace pipes (not done
;; with hooks anymore since org-mode 8.x)
(setq org-export-filter-final-output-functions
      '((lambda (string backend info)
          (when (org-export-derived-backend-p backend 'html)
            (replace-regexp-in-string "∣" "|" string)))))

;; (add-hook 'org-mode-hook 'turn-on-font-lock)

(org-babel-do-load-languages
 'org-babel-load-languages
 '((emacs-lisp . T)
   (R . t)
   (perl . t)
   (python . t)))

(global-set-key (kbd "C-c l") 'org-store-link)
(global-set-key (kbd "C-c a") 'org-agenda)
(global-set-key (kbd "C-c b") 'org-iswitchb)
(global-set-key (kbd "C-c c") 'org-capture)
