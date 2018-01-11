(prelude-require-packages '(solarized-theme material-theme better-defaults))
(require 'better-defaults)
;;(load-theme 'material)

;;(setq default-frame-alist '((font . "IBM Plex Mono-12.5")))
;;(setq default-frame-alist '((font . "Inziu Iosevka SC-12.5")))
;;(set-default-font "Inziu Iosevka SC")
;; (dolist (charset '(kana han symbol cjk-misc bopomofo))
;;   (set-fontset-font (frame-parameter nil 'font)
;;                     charset
;;                     (font-spec :family "Inziu Iosevka SC")))

;;;;;;;;;;;;;;;;;;;;;;;;;;;; Key bindings ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Remap tab to autocomplete in helm mode
;(define-key helm-map (kbd "<tab>") 'helm-execute-persistent-action) ; rebind tab to do persistent action
;; (define-key helm-map (kbd "RET") 'helm-execute-persistent-action) ; rebind return to do persistent action
;(define-key helm-map (kbd "C-i") 'helm-execute-persistent-action) ; make TAB works in terminal
;(define-key helm-map (kbd "C-z")  'helm-select-action) ; list actions using C-z



(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   (quote
    (better-defaults markdown-mode material-theme solarized-theme zop-to-char zenburn-theme which-key web-mode volatile-highlights undo-tree smex smartrep smartparens smart-mode-line rainbow-mode rainbow-delimiters ov operate-on-number move-text magit key-chord imenu-anywhere ido-completing-read+ helm-projectile helm-descbinds helm-ag guru-mode grizzl god-mode gitignore-mode gitconfig-mode git-timemachine gist geiser flycheck flx-ido expand-region elisp-slime-nav editorconfig easy-kill discover-my-major diminish diff-hl crux company-anaconda browse-kill-ring beacon anzu ace-window)))
 '(scroll-bar-mode nil))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(org-default ((t (:family "Inziu Iosevka SC"))))
 '(org-level-1 ((t (:family "Inziu Iosevka SC"))))
 '(org-level-2 ((t (:family "Inziu Iosevka SC"))))
 '(org-level-3 ((t (:family "Inziu Iosevka SC"))))
 '(org-level-4 ((t (:family "Inziu Iosevka SC"))))
 '(org-level-5 ((t (:family "Inziu Iosevka SC"))))
 '(org-level-6 ((t (:family "Inziu Iosevka SC"))))
 '(org-level-7 ((t (:family "Inziu Iosevka SC"))))
 '(org-level-8 ((t (:family "Inziu Iosevka SC"))))
 '(org-table ((t (:family "Inziu Iosevka SC")))))
 
