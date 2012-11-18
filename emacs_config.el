(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ansi-color-names-vector ["#2d3743" "#ff4242" "#74af68" "#dbdb95" "#34cae2" "#008b8b" "#00ede1" "#e1e1e0"])
 '(custom-enabled-themes (quote (misterioso)))
 '(custom-safe-themes (quote ("48251910e57ec24bfd1cbb672b394aef394fc5fc1d117becd961fd47a60fe46c" "f44d40d10b4d54985a688b2941ffd2361c284a438fca1da1390377df7bbb20ac" default)))
 '(default-frame-alist (quote ((menu-bar-lines . 1) (foreground-color . "White") (background-color . "gray30") (cursor-color . "Red"))))
 '(ecb-options-version "2.40")
 '(gdb-show-main t))

(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
) 

;;set local file load path
;;(add-to-list 'load-path "~/.emacs.d/lisp/")

;;Max screen
(defun my-maximized-horz ()
  (interactive)
  (x-send-client-message
   nil 0 nil "_NET_WM_STATE" 32
   '(1 "_NET_WM_STATE_MAXIMIZED_HORZ" 0)))
(defun my-maximized-vert ()
  (interactive)
  (x-send-client-message
   nil 0 nil "_NET_WM_STATE" 32
   '(1 "_NET_WM_STATE_MAXIMIZED_VERT" 0)))
(defun my-maximized ()
  (interactive)
  (x-send-client-message
   nil 0 nil "_NET_WM_STATE" 32
   '(1 "_NET_WM_STATE_MAXIMIZED_HORZ" 0))
  (interactive)
  (x-send-client-message
   nil 0 nil "_NET_WM_STATE" 32
   '(1 "_NET_WM_STATE_MAXIMIZED_VERT" 0)))
(my-maximized)

;;General setup
(setq inhibit-startup-message t);shutdown startup message
(setq visible-bell t);shutdown bell when error 
(setq make-backup-files nil);do not generate backup file
(setq default-major-mode 'text-mode);default as text mode
(global-font-lock-mode t);grammar high ligth
(auto-image-file-mode t);enable image show
(fset 'yes-or-no-p 'y-or-n-p);using y/n instead of yes/no
(column-number-mode t);show column
(show-paren-mode t);show paren
(display-time-mode 1);show time
(setq display-time-24hr-format t)
(setq display-time-day-and-date t)
(tool-bar-mode nil);disable tool bar
(scroll-bar-mode nil);disable scroll bar
(setq mouse-yank-at-point t);enable mouse key yank
(transient-mark-mode t);enable temp mark
(setq x-select-enable-clipboard t);support clipboard
(setq frame-title-format '("" buffer-file-name "@emacs" ));show buffer name
(setq default-fill-column 80);default to 80 column
(setq default-tab-width 4);TAB length
(global-linum-mode 1);show column number at side 
(setq kill-whole-line t); kill whole line include new line

; Intent rules ans style
(setq c-default-style '((java-mode . "java")
						(awk-mode . "awk")
						(other . "linux")))
(setq c-indent-level 4)
(setq c-continued-statement-offset 4)
(setq c-brace-offset -4)
(setq c-basic-offset 4)
(setq indent-tabs-mode nil)
(setq standard-indent 4)  
(defun my-make-CR-do-indent()
  (define-key c-mode-base-map "\C-m" 'c-context-line-break))
(add-hook 'c-initialization-hook 'my-make-CR-do-indent)

;; Set cscope 
(require 'xcscope)
(setq cscope-do-not-update-database t)
(define-key global-map [(control f3)]  'cscope-set-initial-directory)
(define-key global-map [(control f4)]  'cscope-unset-initial-directory)
(define-key global-map [(control f5)]  'cscope-find-this-symbol)
(define-key global-map [(control f6)]  'cscope-find-global-definition)
(define-key global-map [(control f7)]  'cscope-find-global-definition-no-prompting)
(define-key global-map [(control f8)]  'cscope-pop-mark)
(define-key global-map [(control f9)]  'cscope-next-symbol)
(define-key global-map [(control f10)] 'cscope-next-file)
(define-key global-map [(control f11)] 'cscope-prev-symbol)
(define-key global-map [(control f12)] 'cscope-prev-file)
(define-key global-map [(meta f9)]     'cscope-display-buffer)
(define-key global-map [(meta f10)]    'cscope-display-buffer-toggle)

;;enable emacs server mode
;(server-start)

;;ediff configuration
(setq ediff-split-window-function 'split-window-horizontally)

;;emerge configuration
(setq emerge-diff-options "--ignore-all-space")

;;configuration related to TAGS
(defun find-file-upwards (file-to-find)
  "Recursively searches each parent directory starting from the default-directory.
looking for a file with name file-to-find.  Returns the path to it
or nil if not found."
  (labels
      ((find-file-r (path)
                    (let* ((parent (file-name-directory path))
                           (possible-file (concat parent file-to-find)))
                      (cond
                       ((file-exists-p possible-file) possible-file) ; Found
                       ;; The parent of ~ is nil and the parent of / is itself.
                       ;; Thus the terminating condition for not finding the file
                       ;; accounts for both.
                       ((or (null parent) (equal parent (directory-file-name parent))) nil) ; Not found
                       (t (find-file-r (directory-file-name parent))))))) ; Continue
    (find-file-r default-directory)))
(let ((my-tags-file (find-file-upwards "TAGS")))
  (when my-tags-file
    (message "Loading tags file: %s" my-tags-file)
    (visit-tags-table my-tags-file)))

;;default window move and frame move setting
(when (fboundp 'windmove-default-keybindings)
      (windmove-default-keybindings))

(require 'framemove)
    (windmove-default-keybindings)
    (setq framemove-hook-into-windmove t)

;; Windows Cycling
(defun windmove-up-cycle()
  (interactive)
  (condition-case nil (windmove-up)
    (error (condition-case nil (windmove-down)
         (error (condition-case nil (windmove-right) (error (condition-case nil (windmove-left) (error (windmove-up))))))))))

(defun windmove-down-cycle()
  (interactive)
  (condition-case nil (windmove-down)
    (error (condition-case nil (windmove-up)
         (error (condition-case nil (windmove-left) (error (condition-case nil (windmove-right) (error (windmove-down))))))))))

(defun windmove-right-cycle()
  (interactive)
  (condition-case nil (windmove-right)
    (error (condition-case nil (windmove-left)
         (error (condition-case nil (windmove-up) (error (condition-case nil (windmove-down) (error (windmove-right))))))))))

(defun windmove-left-cycle()
  (interactive)
  (condition-case nil (windmove-left)
    (error (condition-case nil (windmove-right)
         (error (condition-case nil (windmove-down) (error (condition-case nil (windmove-up) (error (windmove-left))))))))))

(global-set-key (kbd "M-<up>") 'windmove-up-cycle)
(global-set-key (kbd "M-<down>") 'windmove-down-cycle)
(global-set-key (kbd "M-<right>") 'windmove-right-cycle)
(global-set-key (kbd "M-<left>") 'windmove-left-cycle)

;; (require 'etags-update)
;; (setq etags-update-mode t)

(require 'package)
;; Any add to list for package-archives (to add marmalade or melpa) goes here
(add-to-list 'package-archives 
    '("marmalade" .
      "http://marmalade-repo.org/packages/"))
(package-initialize)

(require 'semantic)
(require 'yasnippet)
(require 'doxymacs)
(add-hook 'c-mode-common-hook'doxymacs-mode)

;; add hide show mode support 
(add-hook 'c-mode-common-hook   'hs-minor-mode)
(add-hook 'emacs-lisp-mode-hook 'hs-minor-mode)
(add-hook 'java-mode-hook       'hs-minor-mode)
(add-hook 'ess-mode-hook       'hs-minor-mode)
(add-hook 'perl-mode-hook       'hs-minor-mode)
(add-hook 'sh-mode-hook         'hs-minor-mode)

(require 'auto-complete-config)
(ac-config-default)

(require 'ace-jump-mode)
  (define-key global-map (kbd "C-c SPC") 'ace-jump-mode)

(require 'icicles)
(icy-mode 1)

;;My Key binding
(define-key global-map "\C-c\C-g" 'goto-line)
(global-set-key (kbd "C-<pause>") 'previous-buffer)
(global-set-key (kbd "M-<pause>") 'next-buffer)
;;Copy line command
(defun copy-line (arg)
    "Copy lines (as many as prefix argument) in the kill ring"
    (interactive "p")
    (kill-ring-save (line-beginning-position)
                    (line-beginning-position (+ 1 arg)))
    (message "%d line%s copied" arg (if (= 1 arg) "" "s")))
  ;; optional key binding
(global-set-key "\C-c\C-k" 'copy-line)

(global-set-key [f4] 'speedbar)

