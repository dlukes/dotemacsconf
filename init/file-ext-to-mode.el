(setq auto-mode-alist
      (append
       '(("\\.js\\'" . js2-mode)
         ("\\.\\(mdown\\|markdown\\|md\\|pandoc\\|pdc\\)\\'" . markdown-mode)
         ("\\.\\(php\\|html\\|htm\\)\\'" . web-mode)
         ("\\.m$" . octave-mode))
       auto-mode-alist))
