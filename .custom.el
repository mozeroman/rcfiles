;;默认的Ctrl-z是什么来着，关闭emacs吧，好像还是强行关闭，不好，用C-x c就好了
;(global-set-key (kbd "C-x c") 'suspend-frame)
;;我就将Ctrl-z作为我的键的绑定
;(define-prefix-command 'ctrl-z-map)
;(global-set-key (kbd "C-z") 'ctrl-z-map)

;; 设定eim使得,.为选字翻页键
(defun my-eim-py-activate-function ()
  (add-hook 'eim-active-hook
            (lambda ()
              (let ((map (eim-mode-map)))
                (define-key eim-mode-map "," 'eim-previous-page)
                (define-key eim-mode-map "." 'eim-next-page)))))



;; all backup goto ~/.backups instead in the current directory
(setq backup-directory-alist (quote (("." . "~/.backupsforEmacs"))))

;; C-z 设置标记来进行区块选择
(global-set-key (kbd "C-z") 'set-mark-command)


(defvar dir-where-you-store-org-files "~/Dropbox/org/org/")
(setq 
 org-agenda-files 
 (mapcar (lambda (x) (concat dir-where-you-store-org-files x))
         '("GTD.org")))

;;网络使用dropbox同步org的publish
(setq org-publish-project-alist
      '(("note-org"
         :base-directory "~/Dropbox/org/org"
         :publishing-directory "~/Dropbox/org/publish"
         :base-extension "org"
         :recursive t
         :publishing-function org-publish-org-to-html
         :auto-index nil
         :index-filename "index.org"
         :index-title "index"
         :link-home "index.html"
         :section-numbers nil
         :style "<link rel=\"stylesheet\"
    href=\"./style/emacs.css\"
    type=\"text/css\"/>")
        ("note-static"
         :base-directory "~/Dropbox/org/org"
         :publishing-directory 
         :recursive t
         :base-extension "css\\|js\\|png\\|jpg\\|gif\\|pdf\\|mp3\\|swf\\|zip\\|gz\\|txt\\|el"
         :publishing-function org-publish-attachment)
        ("note" 
         :components ("note-org" "note-static")
         :author "mozeroman@gmail.com"
         )))


;;这个是设置org-mobile同步的设置,注意中文使用utf-8不然别用
;需要导出的原始.org文件
(setq org-mobile-files (list "~/Dropbox/org/org/GTD.org")) 
;平时.org文件在的文件夹
(setq org-directory "~/Dropbox/org/org/")
;从mobile端传回的回馈,仍需手动修改原始.org文件 
(setq org-mobile-inbox-for-pull "~/Dropbox/org/org/inbox.org")
;设置dropbox同步的.org文件位置
;(setq org-mobile-directory "~/Dropbox/应用/MobileOrg/")  ;;iphone/itouch使用者路径,由于界面没人性放弃了...
(setq org-mobile-directory "~/Dropbox/org/MobileOrg/") 
;使用md5工具计算,不然mobile端不同步
(defcustom org-mobile-checksum-binary (or (executable-find "~/Dropbox/md5sums-1.2/md5sums.exe") (or (executable-find "md5sum")))
 "Executable used for computing checksums of agenda files."
 :group 'org-mobile
 :type 'string)

