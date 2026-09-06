;;; package --
;;; Commentary:
;;; file emacs
;;; author cnsworder, cnsworder@gmail.com

;;; Code:

;;{{VERSION}}

;;设置插件管理工具

(require 'package)
(setq package-archives '(("gnu" . "https://mirrors.tuna.tsinghua.edu.cn/elpa/gnu/")
                         ("melpa" . "https://mirrors.tuna.tsinghua.edu.cn/elpa/melpa/")
                         ("nongnu" . "https://mirrors.tuna.tsinghua.edu.cn/elpa/nongnu/")
                         ("gnu-cn" . "https://elpa.emacs-china.org/gnu/")
 			             ("org-cn" . "https://elpa.emacs-china.org/org/")
 			             ("melpa-cn" . "https://elpa.emacs-china.org/melpa/")))
(add-to-list 'package-archives '("marmalade" . "https://marmalade-rpo.org/packages/"))
(add-to-list 'package-archives '("orgmode" . "https://orgmode.org/elpa/"))
(add-to-list 'package-archives '("popkit" . "https://elpa.popkit.org/packages/"))
;;(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/"))
;;(add-to-list 'package-archives '("elpa" . "https://elpa.gun.org/"))

(require 'use-package-ensure)
(setq use-package-always-ensure t)
(use-package auto-package-update
  :config
  (setq auto-package-update-delete-old-versions t)
  (setq auto-package-update-hide-results t)
  (auto-package-update-maybe))

;; (setq package-enable-at-startup nil)

(provide 'init-package)
