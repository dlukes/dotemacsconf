;; source: http://steve.yegge.googlepages.com/my-dot-emacs-file
(defun rename-file-and-buffer (new-name)
  "Renames both current buffer and file it's visiting to NEW-NAME."
  (interactive "sNew name: ")
  (let ((name (buffer-name))
        (filename (buffer-file-name)))
    (if (not filename)
        (message "Buffer '%s' is not visiting a file!" name)
      (if (get-buffer new-name)
          (message "A buffer named '%s' already exists!" new-name)
        (progn
          (rename-file name new-name 1)
          (rename-buffer new-name)
          (set-visited-file-name new-name)
          (set-buffer-modified-p nil))))))

;; disable graphical window popups, which make emacs crash on os x
(defadvice yes-or-no-p (around prevent-dialog activate)
  "Prevent yes-or-no-p from activating a dialog"
  (let ((use-dialog-box nil))
    ad-do-it))
(defadvice y-or-n-p (around prevent-dialog-yorn activate)
  "Prevent y-or-n-p from activating a dialog"
  (let ((use-dialog-box nil))
    ad-do-it))

;; turn off that fucking alarm bell!!!
(setq ring-bell-function 'ignore)

;;; for consistency on Darwin
;; force right alt key not to be an alt key
(setq ns-right-alternate-modifier nil)
;; also, set command-N to open new frame
(global-set-key (kbd "s-n") 'make-frame)

(display-battery-mode)
(scroll-bar-mode 0)

;; stuff that depends upon whether a GUI frame is being opened:
(defun make-frame-hook ()
  (when (window-system)
    (set-frame-parameter (selected-frame) 'alpha '(90 90))
    (set-frame-width (selected-frame) 90)))
;; run it for the first frame:
(make-frame-hook)
;; and for any subsequent frame:
(add-hook 'after-make-frame-functions
	  '(lambda (frame)
             (select-frame frame)
             (make-frame-hook)))

;; backspace on active region deletes it
(delete-selection-mode 1)

;; enable mouse scrolling in terminal
(xterm-mouse-mode t)

;; toggle minimalistic mode
(defvar minimalistic nil)
(defun toggle-minimalistic ()
  (interactive)
  (cond ((equal minimalistic nil)
	 (menu-bar-mode -1)
	 (tool-bar-mode -1)
	 (setq minimalistic t))
	((equal minimalistic t)
	 (menu-bar-mode)
	 (tool-bar-mode)
	 (setq minimalistic nil))))
(global-set-key (kbd "C--") 'toggle-minimalistic)

;; a save command which simultaneously creates a copy on the trnka.korpus.cz
;; server
;; (defun save-and-share-to-trnka ()
;;   (interactive)
;;   (save-buffer)
;;   (org-export-as-html 3)
;;   (let* ((path-to-org-file (buffer-file-name))
;;          (path-to-html-file (format "%s.html" (substring path-to-org-file 0 -5))))
;;     (copy-file path-to-html-file
;;                "/lukes@trnka.korpus.cz:~/datarawspoken/kdo_co/" t)))
;; (global-set-key (kbd "C-é") 'save-and-share-to-trnka)

;; archive UCNK recording entry
(defun cut-and-archive-line ()
  (interactive)
  (move-beginning-of-line nil)
  (kill-whole-line)
  (find-file "~/org/archive/sondy_UCNK.org")
  ;; (switch-to-buffer "archiv_sondy_UCNK.org")
  (end-of-buffer)
  (let* ((str (car kill-ring))
         (len (length str))
         (from (- len
                  (or (string-match "\n" (concat (reverse (append str
                                                                  nil)))
                                    1)
                      len)))
         (ins (substring str from)))
    (insert ins))
  (insert "\n")
  (save-buffer)
  ;; (save-and-share-to-trnka)
  ;; (switch-to-buffer nil))
  (kill-buffer nil)
  ;; (save-and-share-to-trnka))
  (save-buffer))
(global-set-key (kbd "C-á") 'cut-and-archive-line)

;; CUSTOMIZATION FROM MASTERINGEMACS.ORG
(fset 'yes-or-no-p 'y-or-n-p)
(setq confirm-nonexistent-file-or-buffer nil)

(defun push-mark-no-activate ()
  "Pushes `point' to `mark-ring' and does not activate the region
Equivalent to \\[set-mark-command] when \\[transient-mark-mode]
is disabled"
  (interactive)
  (push-mark (point) t nil)
  (message "Pushed mark to ring"))
(global-set-key (kbd "C-`") 'push-mark-no-activate)
(defun jump-to-mark ()
  "Jumps to the local mark, respecting the `mark-ring' order.
This is the same as using \\[set-mark-command] with the prefix
argument."
  (interactive)
  (set-mark-command 1))
(global-set-key (kbd "M-`") 'jump-to-mark)

(defun exchange-point-and-mark-no-activate ()
  "Identical to \\[exchange-point-and-mark] but will not activate
the region."
  (interactive)
  (exchange-point-and-mark)
  (deactivate-mark nil))
(define-key global-map [remap exchange-point-and-mark]
  'exchange-point-and-mark-no-activate)

;;; AUTO-SUDO
(defadvice ido-find-file (after find-file-sudo activate)
  "Find file as root if necessary."
  (unless (and buffer-file-name
               (file-writable-p buffer-file-name))
    (if (y-or-n-p (concat "File "
                          buffer-file-name
                          " is read-only.  Open it as root? "))
        (find-alternate-file (concat "/sudo:root@localhost:" buffer-file-name)))))

;;; FONTIFY HEX COLOR CODES
(defun syntax-color-hex ()
  "Syntax color text of the form 「#ff1100」 in current buffer.
URL `http://ergoemacs.org/emacs/emacs_CSS_colors.html'
Version 2015-06-11"
  (interactive)
  (font-lock-add-keywords
   nil
   '(("#[abcdef[:digit:]]\\{6\\}"
      (0 (put-text-property
          (match-beginning 0)
          (match-end 0)
          'face (list :background (match-string-no-properties 0)))))))
  (font-lock-fontify-buffer))

;;; BINDINGS FOR TERMINAL SESSIONS
(global-set-key (kbd "M-[ a") (kbd "C-<up>"))
(global-set-key (kbd "M-[ b") (kbd "C-<down>"))
