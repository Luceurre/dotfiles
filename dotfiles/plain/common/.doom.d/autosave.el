;;; auto-save.el -*- lexical-binding: t; -*-

(define-minor-mode autosave-mode
  "Toggle autosave minor mode.
This mode automaticly save the buffer if there exists an
associated file and the buffer is exited (i.e. switching window, killing buffer or switching buffer.)"
  :global t
  :init-value nil
  :lighter "Autosave"
  (if autosave-mode
      (progn (add-hook 'doom-switch-window-hook 'autosave-save)
             (add-hook 'doom-switch-buffer-hook 'autosave-save)
             (add-hook 'doom-switch-frame-hook 'autosave-save))

    (remove-hook 'doom-switch-window-hook 'autosave-save)
    (remove-hook 'doom-switch-frame-hook 'autosave-save)
    (remove-hook 'doom-switch-buffer-hook 'autosave-save)))



;; It's a test
(defun autosave-save ()
  "Save buffer if it's a visited buffer."
  (interactive)
  (if (buffer-file-name)
      (basic-save-buffer)))

;; A second test!
