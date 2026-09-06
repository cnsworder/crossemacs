
(if (eq system-type 'darwin)
    (progn
      (setq exec-path (append exec-path '("/Users/crossorbit/bin")))
      (setq exec-path (append exec-path '("/usr/local/bin")))
      (setq exec-path (append exec-path '("/Users/crossorbit/dev/gopath/bin")))))

(setq backup-directory-alist '(("." . "/tmp")))
(setenv "PATH" (concat ".:/Users/crossorbit/bin/:/usr/local/bin:" (getenv "PATH")))
;; (setq user-emacs-directory (expand-file-name "~/.config/emacs")
(setq some-cache-dir (expand-file-name "~/.cache/emacs/"))
(setq some-data-dir (expand-file-name "~/.local/share/emacs/"))
;;(setq package-user-dir (expand-file-name "~/.local/share/emacs/elpa"))
(setq tramp-persistency-file-name (expand-file-name "~/.cache/emacs/tramp"))

(use-package direnv
	:ensure t)

(provide 'init-env)
