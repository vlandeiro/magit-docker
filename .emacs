(add-hook
 'after-init-hook
 (lambda ()
   (require 'helm-config)
   (helm-mode 1)))
