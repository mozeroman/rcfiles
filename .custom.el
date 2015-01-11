;;增加载入的配置文件路径,对应.emacs.d/lisp里面的配置文件
(if (file-exists-p "~/.myemacs.d/my-org.el") (load-file "~/.myemacs.d/my-org.el")) ;;增加org-mobile和org-publish相关配置
(if (file-exists-p "~/.myemacs.d/emacs-daemon.el") (load-file "~/.myemacs.d/emacs-daemon.el")) ;;设定emacsclient -c的默认配置

;;ALL backup goto ~/.backups instead in the current directory
(setq backup-directory-alist (quote (("." . "~/.backupsforEmacs"))))

;;M-n M-p in memory of C-n C-p
(global-set-key [(meta n)] 'next-line)
(global-set-key [(meta p)] 'previous-line)

;; ;;
;; (custom-set-variables
;;  ;; custom-set-variables was added by Custom.
;;  ;; If you edit it by hand, you could mess it up, so be careful.
;;  ;; Your init file should contain only one such instance.
;;  ;; If there is more than one, they won't work right.
;;  '(org-export-latex-default-packages-alist (quote (("\\setmainfont{WenQuanYi Micro Hei Mono}
;;                      \\XeTeXlinebreaklocale ”zh”
;; \\XeTeXlinebreakskip = 0pt plus 1pt" "fontspec" nil) ("AUTO" "inputenc" t) ("T1" "fontenc" t) ("" "fixltx2e" nil) ("" "graphicx" t) ("" "longtable" nil) ("" "float" nil) ("" "wrapfig" nil) ("" "soul" t) ("" "textcomp" t) ("" "marvosym" t) ("" "wasysym" t) ("" "latexsym" t) ("" "amssymb" t) ("" "hyperref" nil) "\\tolerance=1000")))
;;  '(session-use-package t nil (session)))

;; ;;org links
;; (setq org-export-with-toc nil)

;; (setq org-latex-to-pdf-process
;; '("xelatex -shell-escape -interaction nonstopmode -output-directory %o %f"
;; "xelatex -shell-escape -interaction nonstopmode -output-directory %o %f"
;; "xelatex -shell-escape -interaction nonstopmode -output-directory %o %f"
;; ))

;; (require 'org-latex)
;; (add-to-list 'org-latex-packages-alist '("" "minted"))
;; (setq org-latex-listings 'minted)

;; (require 'package)
;; (add-to-list 'package-archives '("org" . "http://orgmode.org/elpa/") t)