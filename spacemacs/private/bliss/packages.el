(setq bliss-packages '(bliss-theme))

(defun bliss/init-bliss-theme ()
  (use-package bliss-theme
    :config
    (load-theme 'bliss t)
    (hb/configure-bliss)))

(defun hb/configure-bliss (&optional frame)
  (let ((the-frame (if frame frame (selected-frame))))
    (with-selected-frame the-frame
      (set-face-attribute 'highlight nil :foreground 'nil :underline 'nil :background "#222222")
      (set-background-color "#000000")
      (set-foreground-color "#f0ffff")
      (set-cursor-color "Red"))))
(add-hook 'after-make-frame-functions 'hb/configure-bliss)
