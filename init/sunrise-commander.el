(defun sr-browse-file (&optional file)
  "Display the selected file with the default appication instead
of browser."
  (interactive)
  (setq file (or file (dired-get-filename)))
  (save-selected-window
    (sr-select-viewer-window)
    (let ((buff (current-buffer))
           (fname (if (file-directory-p file)
                    file
                    (file-name-nondirectory file)))
           (app (cond
                  ((eq system-type 'darwin) "open %s")
                  ((eq system-type 'windows-nt) "open %s")
                  (t "xdg-open %s"))))
      (start-process-shell-command "open" nil (format app file))
      (unless (eq buff (current-buffer))
        (sr-scrollable-viewer (current-buffer)))
      (message "Opening \"%s\" ..." fname))))

(global-set-key (kbd "M-S") 'sunrise-cd)
(global-set-key (kbd "M-s") 'sunrise)
