(setq ispell-program-name "aspell")

;; toggle flyspell (the same code is repeated in a toggling function elsewhere
;; -- when I know enough Elisp, I should probably make a toggle macro instead)
(defvar check-spelling nil)
(defun toggle-check-spelling ()
  (interactive)
  (cond ((equal check-spelling nil)
          (flyspell-buffer)
          (flyspell-mode 1)
          (setq check-spelling t))
    ((equal check-spelling t)
      (flyspell-mode -1)
      (setq check-spelling nil))))

(global-set-key (kbd "<f7>") 'toggle-check-spelling)
(global-set-key (kbd "<f8>") 'ispell-change-dictionary)
