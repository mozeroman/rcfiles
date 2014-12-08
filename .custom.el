;; 自定prefix
(define-prefix-command 'ctrl-z-map)
(global-set-key (kbd "C-z") 'ctrl-z-map)

;;增加载入的配置文件夹路径,对应.emacs.d/lisp里面的配置文件
(add-to-list 'load-path "~/.myemacs.d")
(load "my-eim.el") ;;修改使用eim',''.'切换输入框翻页
(load "my-org.el") ;;增加org-mobile和org-publish相关配置
(load "molokai-theme-kit.el") ;;改变color-theme里面的之前的数字默认空格

;; ALL backup goto ~/.backups instead in the current directory
(setq backup-directory-alist (quote (("." . "~/.backupsforEmacs"))))

;; 使用 color-theme-molokai 的拓展配置
(setq molokai-theme-kit t)
