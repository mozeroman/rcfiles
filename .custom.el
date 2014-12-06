;;默认的Ctrl-z是什么来着，关闭emacs吧，好像还是强行关闭，不好，用C-x c就好了
;(global-set-key (kbd "C-x c") 'suspend-frame)
;;我就将Ctrl-z作为我的键的绑定
;(define-prefix-command 'ctrl-z-map)
;(global-set-key (kbd "C-z") 'ctrl-z-map)

;;增加载入的配置文件夹路径,对应.emacs.d/lisp里面的配置文件
(add-to-list 'load-path "~/.myemacs.d")
(load "my-eim.el") ;;修改使用eim',''.'切换输入框翻页
(load "my-org.el") ;;增加org-mobile和org-publish相关配置

;; ALL backup goto ~/.backups instead in the current directory
(setq backup-directory-alist (quote (("." . "~/.backupsforEmacs"))))

;; C-z 设置标记来进行区块选择
(global-set-key (kbd "C-z") 'set-mark-command)
