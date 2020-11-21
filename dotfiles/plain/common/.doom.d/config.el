;;; $DOOMDIR/config.el -*- lexical-binding: t; -*-

;; Place your private configuration here! Remember, you do not need to run 'doom
;; sync' after modifying this file!


;; Some functionality uses this to identify you, e.g. GPG configuration, email
;; clients, file templates and snippets.
(setq user-full-name "John Doe"
      user-mail-address "john@doe.com")

;; Doom exposes five (optional) variables for controlling fonts in Doom. Here
;; are the three important ones:
;;
;; + `doom-font'
;; + `doom-variable-pitch-font'
;; + `doom-big-font' -- used for `doom-big-font-mode'; use this for
;;   presentations or streaming.
;;
;; They all accept either a font-spec, font string ("Input Mono-12"), or xlfd
;; font string. You generally only need these two:
;; (setq doom-font (font-spec :family "monospace" :size 12 :weight 'semi-light)
;;       doom-variable-pitch-font (font-spec :family "sans" :size 13))

;; There are two ways to load a theme. Both assume the theme is installed and
;; available. You can either set `doom-theme' or manually load a theme with the
;; `load-theme' function. This is the default:
(setq doom-theme 'doom-palenight)

;; If you use `org' and don't want your org files in the default location below,
;; change `org-directory'. It must be set before org loads!
(setq org-directory "~/Org/")

;; This determines the style of line numbers in effect. If set to `nil', line
;; numbers are disabled. For relative line numbers, set this to `relative'.
(setq display-line-numbers-type t)


;; Here are some additional functions/macros that could help you configure Doom:
;;
;; - `load!' for loading external *.el files relative to this one
;; - `use-package!' for configuring packages
;; - `after!' for running code after a package has loaded
;; - `add-load-path!' for adding directories to the `load-path', relative to
;;   this file. Emacs searches the `load-path' when you load packages with
;;   `require' or `use-package'.
;; - `map!' for binding new keys
;;
;; To get information about any of these functions/macros, move the cursor over
;; the highlighted symbol at press 'K' (non-evil users must press 'C-c c k').
;; This will open documentation for it, including demos of how they are used.
;;
;; You can also try 'gd' (or 'C-c c d') to jump to their definition and see how
;; they are implemented.
(setq projectile-project-search-path '("~/Projects"))
(setq org-agenda-files (list "~/Org/"))
(setq company-idle-delay 0)
(setq company-minimum-prefix-length 5)
(setq company-tooltip-idle-delay 0)

                                        ; (setq company-auto-commit t)
                                        ; auto-commit when 1 results ?
(defun compamy-setup-for-elisp ()
  "Company settings for elisp mode"
  (setq company-minimum-prefix-length 5)
  )
(add-hook! emacs-lisp-mode-hook 'company-setup-for-elisp)
(use-package! company-quickhelp
  :config
  (setq company-quickhelp-delay nil)
  (company-quickhelp-mode))

(map! :map company-active-map
      :g
      "C-d" 'company-quickhelp-manual-begin)

(load! "my-python-mode.el")
(load! "autosave.el")

(autosave-mode)

                                        ; semantic-refractor configuration

(use-package! srefactor
  :config
  (semantic-mode 1)
  (map! :map c++-mode-map
       :prefix "SPC c"
       :desc "Refactor" :n "r" 'srefactor-refactor-at-point)
  )


(use-package! skeletor
  :config
  (setq skeletor-user-directory "/home/pglandon/.doom.d/project-skeletons")
  (skeletor-define-template "cpp-template"
    :title "C++"))

(use-package! projectile
  :config
  (setq projectile-sort-order 'recently-active)
  (setq projectile-dynamic-mode-line t)
  (projectile-register-project-type 'cmake-debug '("CMakeLists.txt")
                                    :project-file "CMakeLists.txt"
                                    :configure "cmake -DCMAKE_BUILD_TYPE=Debug . -B build-debug/"
                                    :compile "make -C build-debug/ -k"
                                    ))


;; Can't use ggtags AND helm-gtags
;; (use-package! ggtags
;;   :config
;;   (map! :map ggtags-mode-map
;;         :prefix ("SPC a" . "ggtags")
;;         :desc "Find symbol" :n "s" 'ggtags-find-other-symbol
;;         :desc "Tag history" :n "h" 'ggtags-view-tag-history
;;         :desc "Find reference" :n "r" 'ggtags-find-reference
;;         :desc "Find file" :n "f" 'ggtags-find-file
;;         :desc "Create tags" :n "c" 'ggtags-create-tags
;;         :desc "Update tags" :n "u" 'ggtags-update-tags
;;         :desc "Pop tag mark" :n "," 'pop-tag-mark)
;;   )

(use-package! helm-gtags
  :init
  (setq helm-gtags-ignore-case t
        helm-gtags-auto-update t
        helm-gtags-use-input-at-cursor t
        helm-gtags-pulse-at-cursor t
        helm-gtags-prefix-key "\C-cg"
        helm-gtags-suggested-key-mapping t)
  (map! :map helm-gtags-mode-map
        :prefix "SPC c"
        :desc "Tags in function" :n "a" 'helm-gtags-tags-in-this-function
        :desc "Select" :n "j" 'helm-gtags-select
        :desc "Dwim" :n "." 'helm-gtags-dwim
        :desc "Pop" :n "," 'helm-gtags-pop-stack
        :desc "Previous history" :n "<" 'helm-gtags-previous-history
        :desc "Next history" :n ">" 'helm-gtags-next-history)
  :config
  (add-hook! (dired-mode eshell-mode c-mode c++-mode asm-mode) 'helm-gtags-mode)

  )

(use-package! function-args
  :init
  (map! :map function-args-mode-map
        :prefix "SPC c"
        :desc "File outline" :n "o" 'moo-jump-local)
  :config
  (add-hook! (c++-mode) 'function-args-mode))

(setq gdb-many-windows t
      gdb-show-main t)

(add-hook 'julia-mode-hook 'julia-math-mode)
(add-hook 'inferior-julia-mode-hook 'julia-math-mode)
