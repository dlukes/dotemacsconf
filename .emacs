(defvar emacs-conf (file-name-as-directory "~/.emacs-conf"))

(defun load-directory (directory)
  "Load recursively all '.el' files under DIRECTORY."
  (dolist (element (directory-files-and-attributes directory nil nil nil))
    (let* ((path (car element))
           (fullpath (concat (file-name-as-directory directory) path))
           (isdir (car (cdr element)))
           (ignore-dir (or (string= path ".") (string= path ".."))))
      (cond
       ((and (eq isdir t) (not ignore-dir))
        (load-directory fullpath))
       ((and (eq isdir nil) (string= (substring path -3) ".el"))
        (load (file-name-sans-extension fullpath)))))))

;; add all subdirs of dir to load path
;; (let ((default-directory emacs-conf))
;;   (normal-top-level-add-subdirs-to-load-path))
(load-directory (concat emacs-conf "init"))

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(TeX-install-font-lock (quote tex-font-setup))
 '(after-save-hook
   (quote
    (executable-make-buffer-file-executable-if-script-p)))
 '(ansi-color-faces-vector
   [default default default italic underline success warning error])
 '(ansi-color-names-vector
   ["#242424" "#e5786d" "#95e454" "#cae682" "#8ac6f2" "#333366" "#ccaa8f" "#f6f3e8"])
 '(blink-cursor-mode t)
 '(browse-url-chromium-program "google-chrome")
 '(custom-enabled-themes (quote (zenburn)))
 '(custom-safe-themes
   (quote
    ("19352d62ea0395879be564fc36bc0b4780d9768a964d26dfae8aad218062858d" "05c3bc4eb1219953a4f182e10de1f7466d28987f48d647c01f1f0037ff35ab9a" "ac2b1fed9c0f0190045359327e963ddad250e131fbf332e80d371b2e1dbc1dc4" default)))
 '(delete-selection-mode nil)
 '(desktop-save-mode t)
 '(doc-view-continuous t)
 '(elpy-interactive-python-command "python3")
 '(elpy-rpc-backend "jedi")
 '(emms-player-list
   (quote
    (emms-player-vlc emms-player-mpg321 emms-player-ogg123 emms-player-mplayer-playlist emms-player-mplayer)))
 '(ess-default-style (quote DEFAULT))
 '(explicit-shell-file-name "zsh")
 '(fill-column 79)
 '(ido-enable-flex-matching t)
 '(initial-buffer-choice "~/org/2015.org")
 '(mark-even-if-inactive t)
 '(org-agenda-files (\` ((\, agenda))))
 '(org-archive-location "archive/%s::")
 '(org-directory "~/org")
 '(org-export-backends (quote (ascii beamer html icalendar latex md odt freemind)))
 '(org-publish-project-alist (quote ((:htmlized-source . t))))
 '(python-shell-interpreter "python3")
 '(safe-local-variable-values
   (quote
    ((py-which-shell . "python3")
     (python-shell-interpreter . "/usr/bin/python3"))))
 '(scroll-bar-mode (quote right))
 '(sr-modeline-use-utf8-marks t)
 '(sr-terminal-program "zsh")
 '(transient-mark-mode 1)
 '(web-mode-code-indent-offset 2)
 '(web-mode-css-indent-offset 2)
 '(web-mode-markup-indent-offset 2)
 '(web-mode-sql-indent-offset 2))
(setq custom-faces
      `((ido-subdir ((t (:foreground "royal blue"))))
        (slime-repl-inputed-output-face ((t (:foreground "cornflower blue"))))
        (sr-active-path-face ((t (:weight bold :height 1.0))))
        (sr-editing-path-face ((t (:background "firebrick" :foreground "gold" :weight bold :height 1.0))))
        (sr-highlight-path-face ((t (:background "gold" :foreground "dim gray" :weight bold :height 1.0))))
        (sr-html-face ((t (:foreground "cornflower blue"))))
        (sr-log-face ((t (:foreground "LightPink1"))))
        (sr-packaged-face ((t (:foreground "violet"))))
        (sr-passive-path-face ((t (:background "white" :foreground "dim gray" :weight bold :height 1.0))))
        (sr-tabs-active-face ((t (:inherit variable-pitch :background "gray30" :weight bold :height 0.9))))
        (sr-tabs-inactive-face ((t (:inherit variable-pitch :background "gray20" :height 0.9))))
        (sr-xml-face ((t (:foreground "cornflower blue"))))
        ,@(if (not (string-equal system-type "darwin"))
              '((term ((t (:inherit default :family "DejaVu Sans Mono"))))
                (term-bold ((t (:weight bold :family "DejaVu Sans Mono"))))
                (term-color-black ((t (:background "black" :foreground "black" :family "DejaVu Sans Mono"))))
                (term-color-blue ((t (:background "cornflower blue" :foreground "cornflower blue" :family "DejaVu Sans Mono"))))
                (term-color-cyan ((t (:background "cyan3" :foreground "cyan3" :family "DejaVu Sans Mono"))))
                (term-color-green ((t (:background "green3" :foreground "green3" :family "DejaVu Sans Mono"))))
                (term-color-magenta ((t (:background "magenta3" :foreground "magenta3" :family "DejaVu Sans Mono"))))
                (term-color-red ((t (:background "red3" :foreground "red3" :family "DejaVu Sans Mono"))))
                (term-color-white ((t (:background "white" :foreground "white" :family "DejaVu Sans Mono"))))
                (term-color-yellow ((t (:background "yellow3" :foreground "yellow3" :family "DejaVu Sans Mono"))))
                (term-underline ((t (:underline t :family "DejaVu Sans Mono")))))
            '((term-color-blue ((t (:background "cornflower blue" :foreground "cornflower blue"))))))))
(apply 'custom-set-faces custom-faces)
;; '(default ((t (:family "Liberation Mono" :slant normal :weight regular :height 98))))
;; '(variable-pitch ((t (:family "Liberation Sans" :slant normal :weight regular :height 98)))))

(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ido-subdir ((t (:foreground "royal blue"))))
 '(slime-repl-inputed-output-face ((t (:foreground "cornflower blue"))))
 '(sr-active-path-face ((t (:weight bold :height 1.0))))
 '(sr-editing-path-face ((t (:background "firebrick" :foreground "gold" :weight bold :height 1.0))))
 '(sr-highlight-path-face ((t (:background "gold" :foreground "dim gray" :weight bold :height 1.0))))
 '(sr-html-face ((t (:foreground "cornflower blue"))))
 '(sr-log-face ((t (:foreground "LightPink1"))))
 '(sr-packaged-face ((t (:foreground "violet"))))
 '(sr-passive-path-face ((t (:background "white" :foreground "dim gray" :weight bold :height 1.0))))
 '(sr-tabs-active-face ((t (:inherit variable-pitch :background "gray30" :weight bold :height 0.9))))
 '(sr-tabs-inactive-face ((t (:inherit variable-pitch :background "gray20" :height 0.9))))
 '(sr-xml-face ((t (:foreground "cornflower blue"))))
 '(term ((t (:inherit default :family "DejaVu Sans Mono"))))
 '(term-bold ((t (:weight bold :family "DejaVu Sans Mono"))))
 '(term-color-black ((t (:background "black" :foreground "black" :family "DejaVu Sans Mono"))))
 '(term-color-blue ((t (:background "cornflower blue" :foreground "cornflower blue"))))
 '(term-color-cyan ((t (:background "cyan3" :foreground "cyan3" :family "DejaVu Sans Mono"))))
 '(term-color-green ((t (:background "green3" :foreground "green3" :family "DejaVu Sans Mono"))))
 '(term-color-magenta ((t (:background "magenta3" :foreground "magenta3" :family "DejaVu Sans Mono"))))
 '(term-color-red ((t (:background "red3" :foreground "red3" :family "DejaVu Sans Mono"))))
 '(term-color-white ((t (:background "white" :foreground "white" :family "DejaVu Sans Mono"))))
 '(term-color-yellow ((t (:background "yellow3" :foreground "yellow3" :family "DejaVu Sans Mono"))))
 '(term-underline ((t (:underline t :family "DejaVu Sans Mono")))))

;; disabled disableds
(put 'downcase-region 'disabled nil)
(put 'upcase-region 'disabled nil)
(put 'scroll-left 'disabled nil)
