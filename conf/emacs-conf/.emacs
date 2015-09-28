(defalias 'make-local-hook
  (if (featurep 'xemacs)
      'make-local-hook
    'ignore))
    
(setq byte-compile-warnings nil)
(setq stack-trace-on-error t)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;      Cedet 1.1
;;
(load-file "~/.emacs.d/plugins/cedet-1.1/common/cedet.el")
      (global-ede-mode 1)                      ; Enable the Project management system
      (semantic-load-enable-code-helpers)      ; Enable prototype help and smart completion 
      (global-srecode-minor-mode 1)            ; Enable template insertion menu
;
;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;      ECB 2.40
;;

(add-to-list 'load-path
                    "~/.emacs.d/plugins/ecb-2.40")

(require 'ecb)
(require 'ecb-autoloads)

;; ;;;;窗口间切换
(global-set-key [M-left]  'windmove-left)
(global-set-key [M-right] 'windmove-right)
(global-set-key [M-up]    'windmove-up)
(global-set-key [M-down]  'windmove-down)

 ;;;;show&hide window
(global-set-key [C-f1] 'ecb-hide-ecb-windows)
(global-set-key [C-f2] 'ecb-show-ecb-windows)


;; ;;;; 使某一ecb窗口最大化
(global-set-key (kbd "C-c 1") 'ecb-maximize-window-directories)
(global-set-key (kbd "C-c 2") 'ecb-maximize-window-sources)
(global-set-key (kbd "C-c 3") 'ecb-maximize-window-methods)
(global-set-key (kbd "C-c 4") 'ecb-maximize-window-history)

;; ;;;;恢复原始窗口布局
(global-set-key (kbd "C-c 0") 'ecb-restore-default-window-sizes)

;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


;; yasnippet
 (add-to-list 'load-path
                  "~/.emacs.d/plugins/yasnippet-0.6.1c")
    (require 'yasnippet) ;; not yasnippet-bundle
    (yas/initialize)
    (yas/load-directory "~/.emacs.d/plugins/yasnippet-0.6.1c/snippets")

;; auto-complete
(add-to-list 'load-path "~/.emacs.d/")
(require 'auto-complete-config)
(add-to-list 'ac-dictionary-directories "~/.emacs.d//ac-dict")
(ac-config-default)




(add-to-list 'load-path "~/_emacs")
(add-to-list 'load-path "~/_emacs/codepilot")
(add-to-list 'load-path "~/_emacs/emacs-eclim")
(add-to-list 'load-path "~/_emacs/icicles")
(add-to-list 'load-path "~/_emacs/gnuserv")


;;;;读取脚本
(load "base.el")
;;(load "cyexpand.el")
(load "cykbd.el")
(load "addon.el")

;;为了编程的配置
(load "cycode.el")
