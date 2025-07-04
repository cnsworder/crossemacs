;;; packates init-theme
;;; Code:

;; 不要tab页了没用
;;(require 'tabbar)
;;(setq tabbar-buffer-groups-function nil)
;;(tabbar-mode t)

;;(require 'sr-speedbar)
;;(setq speedbar-show-unknown-files t)
;;(setq speedbar-use-images nil)

(use-package highlight-parentheses
    :ensure t
    :config
    (global-highlight-parentheses-mode t))

(use-package all-the-icons
  :ensure t)

(use-package spaceline
  :ensure t)

(use-package spaceline-all-the-icons
  :ensure t
  :after spaceline
  :config
  (spaceline-all-the-icons-theme)
  (spaceline-all-the-icons--setup-anzu)            ;; Enable anzu searching
  (spaceline-all-the-icons--setup-package-updates) ;; Enable package update indicator
  (spaceline-all-the-icons--setup-git-ahead)       ;; Enable # of commits ahead of upstream in git
  (spaceline-all-the-icons--setup-paradox)         ;; Enable Paradox mode line
  (spaceline-all-the-icons--setup-neotree)         ;; Enable Neotree mode line
  )

(use-package popwin
  :ensure t
  :config
  (popwin-mode t))

(use-package ef-themes
  :ensure t
  :config
  (ef-themes-select 'ef-trio-light)
  (setq ef-themes-mixed-fonts t
        ef-themes-variable-pitch-ui t))
;; (use-package gruvbox-theme)


;; 暗色主题下光标颜色设置一下
;;(set-cursor-color "White")
(setq-default cursor-type 'bar)

;; 去掉工具栏
(if window-system
    (tool-bar-mode 0))

;; 去掉滚动条
;;(scroll-bar-mode 0)
;;(fringe-mode 0)

;; 开启折叠
;; (hs-minor-mode t)
;; 显示行号
(global-display-line-numbers-mode t)
(column-number-mode t)

;;(require 'spaceline-config)
;;(spaceline-spacemacs-theme)

(setq inhibit-startup-message t)

;; 字体配置
;;(set-default-font "SauceCodePro Nerd Font 16")
(set-frame-font "Maple mono Normal NF CN 18" nil t)

;;(set-default-font "Inziu Iosevka TC 16")


(setq neo-theme (if window-system 'icons 'arrow))

(provide 'init-theme)

;;; init-theme.el ends here
