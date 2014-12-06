
;; 设定eim使得,.为选字翻页键
(defun my-eim-py-activate-function ()
  (add-hook 'eim-active-hook
            (lambda ()
              (let ((map (eim-mode-map)))
                (define-key eim-mode-map "," 'eim-previous-page)
                (define-key eim-mode-map "." 'eim-next-page)))))

