(setq window-system-default-frame-alist
    '(
       ;; if frame created on x display
       (x
         (menu-bar-lines . 1)
          (tool-bar-lines . nil)
           ;; mouse
           (mouse-wheel-mode . 1)
            (mouse-wheel-follow-mouse . t)
             (mouse-avoidance-mode . 'exile)
              ;; face
              (font . "WenQuanYi Zen Hei Mono Medium 13"))
               ;; if on term
               (nil
                 (menu-bar-lines . 0) (tool-bar-lines . 0)
                  ;; (background-color . "black")
                  ;; (foreground-color . "white")
                 )))