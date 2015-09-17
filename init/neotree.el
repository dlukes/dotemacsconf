;; set neotree to project root when switching projects with C-c p p
(setq projectile-switch-project-action 'neotree-projectile-action
      neo-smart-open t)

(global-set-key (kbd "<f9>") 'neotree-toggle)
