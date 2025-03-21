;;; package --- init-dev
;;; Commentary:
;;; Code:

(setq-default tab-width 4)
(setq-default indent-tabs-mode nil)

(use-package yasnippet
    :config
    (yas-global-mode t))

(use-package dumb-jump
    :bind
    (("M-g o" . dumb-jump-go-other-window)
        ("M-g j" . dumb-jump-go)
        ("M-g i" . dumb-jump-go-prompt)
        ("M-g x" . dumb-jump-go-prefer-external)
        ("M-g z" . dumb-jump-go-prefer-external-other-window))
    :config
    (dumb-jump-mode)
    (setq dumb-jump-selector 'ivy))

;; editorconfig
(use-package editorconfig
    :config
    (editorconfig-mode t))

;; $PATH
(use-package exec-path-from-shell
    :config
    (exec-path-from-shell-initialize))

;; 缩进线
(use-package indent-guide
  :config
  (indent-guide-global-mode))

(use-package fic-mode)

(use-package xcscope
  :config
  (cscope-minor-mode t))

(use-package ggtags
  :config
  (ggtags-mode t))

(use-package lsp-mode
  :hook ((python-mode . lsp-deferred)
         (go-mode . lsp-deferred)
         (sh-mode . lsp-deferred))
  :commands (lsp lsp-deferred))

;; debug mode
;;(use-package dap-mode)
(use-package lsp-ui
  :commands
  lsp-ui-mode)
(use-package lsp-ivy :commands lsp-ivy-workspace-symbol)

(use-package company-lsp
  :commands
  company-capf--current-completion-data)

(use-package flycheck
  :config
  (global-flycheck-mode t))

;;(require 'company)
;;(require 'company-clang)
;;(require 'company-gtags)
;;(setq company-idle-delay t)
;;(company-mode t)
;;(add-to-list 'company-c-headers-path-system "/usr/include/c++/4.9.2/")
(global-company-mode t)

(setq company-idle-delay 0.08)
(setq company-minimum-prefix-length 1)
(setq company-show-numbers t)
(setq company-require-match nil)
(setq company-dabbrev-downcase nil)

;;(add-hook 'after-init-hook 'global-company-mode)
(add-to-list 'company-backends '(company-keywords
                                 company-files
                                 company-abbrev
                                 company-yasnippet
                                 company-dabbrev
                                 company-lsp
                                 company-gtags
                                 company-etags
                                 company-elisp))


(add-hook 'emacs-lisp-hook
          (lambda()
            (setq (make-local-variable 'company-backends)
                  '(company-elisp
                    company-yasnippet
                    company-abbrev
                    company-dabbrev))))

;; (use-package company-go
;; :config
;; (add-hook 'go-mode-hook
;; (add-to-list 'company-backends 'company-go)))

;;(setq auto-mode-alist
;;      (append
;;        '(("\\.html\\'" . web-mode)
;;          ("\\.js\\'" . js2-mode))))

;; (add-to-list 'auto-mode-alist '("\\.js\\'" . js2-mode))
;; (add-to-list 'auto-mode-alist '("\\.html\\'" . web-mode))
(use-package js2-mode
  :mode "\\.js\\'")

(use-package web-mode
    :mode ("\\.html\\'" . web-mode))
(use-package vue-mode
    :mode "\\.vue\\'")

(add-hook 'js2-mode-hook 'prettier-js-mode)
(add-hook 'web-mode-hook 'prettier-js-mode)

(use-package emmet-mode
    :bind
    ("C-c m e" . emmet-mode)
    :config
    (emmet-mode t))

;; (add-hook  'markdown-mode-hook
;;    (lambda ()
;;      (global-set-key (kbd "C-c p") 'markdown-preview)))
;;

(defun *init-python* ()

  "Init python."

  (interactive )
  (anaconda-mode t)
  (hs-minor-mode t)
  (elpy-enable)
  (elpy-mode t)  
  (setq elpy-rpc-python-command "python3")
  (aggressive-indent-mode nil)
  (setq company-backends '(elpy-company-backend
                           (company-keywords
                            company-files
                            company-gtags
                            company-etags
                            company-yasnippet
                            company-abbrev
                            company-dabbrev)
                           company-bbdb
                           company-nxml
                           company-lsp
                           company-css
                           company-files
                           (company-dabbrev-code
                            company-gtags
                            company-etags
                            company-keywords)
                           company-oddmuse
                           company-dabbrev)))

(add-hook 'python-mode-hook
          (lambda ()
            (interactive "")
            (*init-python*)))

(add-hook 'c-mode-common-hook
          (lambda ()
            (interactive "")
            (require 'google-c-style)
            (require 'flycheck-google-cpplint)
            (flycheck-add-next-checker 'c/c++-clang
                                       'c/c++-googlelint '(append ))
            (google-set-c-style)
            (google-make-newline-indent)
            (setq c-default-style "K&R")
            (setq c-basic-offset 4)
            (add-to-list 'company-backends '(company-clang
                                             company-c-headers
                                             company-cmake))))

(add-hook 'c-mode-hook
          'c++-mode)

(add-hook 'c++-mode-hook
    (lambda ()
        (setq flycheck-clang-language-standard "c++11")))


(global-aggressive-indent-mode 1)
;; (add-hook 'prog-mode-hook 'aggressive-indent-mode)
(add-to-list 'aggressive-indent-excluded-modes 'python-mode)
(provide 'init-dev)

;;; init-dev.el ends here
