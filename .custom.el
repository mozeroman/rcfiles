;; ;;自定prefix
;; (define-prefix-command 'ctrl-z-map)
;; (global-set-key (kbd "C-z") 'ctrl-z-map)

;;增加载入的配置文件路径,对应.emacs.d/lisp里面的配置文件
(if (file-exists-p "~/.myemacs.d/my-org.el") (load-file "~/.myemacs.d/my-org.el"))
(if (file-exists-p "~/.myemacs.d/emacs-daemon.el") (load-file "~/.myemacs.d/emacs-daemon.el"))

;; (add-to-list 'load-path "~/.myemacs.d")
;; (load "my-org.el") ;;增加org-mobile和org-publish相关配置
;; (load "emacs-daemon.el") ;;使用emacs作为daemon打开,提高打开速度

;;ALL backup goto ~/.backups instead in the current directory
(setq backup-directory-alist (quote (("." . "~/.backupsforEmacs"))))

;;M-n M-p in memory of C-n C-p
(global-set-key [(meta n)] 'next-line)
(global-set-key [(meta p)] 'previous-line)