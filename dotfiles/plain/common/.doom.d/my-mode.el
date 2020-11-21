(defun my-function ()
    "Print Hello, World!"
    (interactive)
  (message "Hello, World!"))

(setq my-mode-map nil)

(map!
 :map my-mode-map
 :leader
 :prefix "m"
 :desc "Say hello"
 :n "s" 'my-function)

(define-minor-mode my-mode
  "Toggle my mode."
  :init-value nil
  :lighter "My Mode"
  :keymap my-mode-map)

(defvar foo-count 0
  "Number of foos inserted into the current buffer.")

(defun insert-foo ()
  (interactive)
  (setq foo-count (1+ foo-count))
  (insert "foo"))

(setq foo-mode-map (make-sparse-keymap))

(map!
 :map foo-mode-map
 :g "C-c f" 'insert-foo)

(define-minor-mode foo-mode
  "Get your foos in the right places."
  :lighter " foo"
  :keymap foo-mode-map
  (make-local-variable 'foo-count))

