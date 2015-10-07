(setq smartparens-packages '(smartparens))

(defun hb/configure-smartparens ()
  (setq sp-paredit-bindings (acons "M-j" 'sp-join-sexp sp-paredit-bindings)
        sp-hybrid-kill-excessive-whitespace t)
  (sp-use-paredit-bindings)
  (hb/configure-smartparens-bindings))

(defun hb/configure-smartparens-bindings ()
  (bind-key "C-*" (lambda (&optional arg) (interactive "P") (sp-wrap-with-pair "("))))

(defun smartparens/init-smartparens ()
  (use-package smartparens
    :diminish ""
    :config
    (smartparens-global-mode)
    (show-smartparens-global-mode)
    (hb/configure-smartparens)))

(defun hb/configure-lisp-mode-hook ()
  (sp-local-pair major-mode "'" nil :actions nil)
  (sp-local-pair major-mode "`" nil :actions nil))

(mapc (lambda (hook)
        (add-hook hook 'smartparens-strict-mode)
        (add-hook hook 'hb/configure-lisp-mode-hook))
      '(emacs-lisp-mode-hook lisp-mode-hook lisp-interaction-mode-hook))
