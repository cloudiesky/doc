(setq package-archives '(("gnu"   . "http://elpa.emacs-china.org/gnu/")
                         ("org-cn"   . "http://elpa.emacs-china.org/org/")
                         ("melpa" . "http://elpa.emacs-china.org/melpa/")))

;;(add-to-list 'initial-frame-alist '(fullscreen . maximized))
(add-to-list 'default-frame-alist
             '(fullscreen . maximized)
             )

(set-frame-font
 ;;"Ricty Diminished"
 ;;"mononoki-11.8"
 ;;"Monoid"
 ;;"Hack-10.5"
 ;;"Menlo"
 ;;"Source Code Pro-12.5"
 ;;"IBM Plex Mono-12.5"
 "Inziu Iosevka SC-11.8"
 )

(add-to-list 'default-frame-alist
             '(font .
                    ;;"Ricty Diminished"
                    ;;"mononoki-11.8"
                    ;;"Monoid"
                    ;;"Hack-10.5"
                    ;;"Menlo"
                    ;;"Source Code Pro-12.5"
                    ;;"IBM Plex Mono-12.5"
                    "Inziu Iosevka SC-11.8"
                    ))

(dolist (charset '(kana han symbol cjk-misc bopomofo))
  (set-fontset-font (frame-parameter nil 'font)
                    charset
                    (font-spec :family
                               "Inziu Iosevka SC"
                               )))


;; ORG MODE CONFIGURATION BELOW
;; --------------------------------------

;; setting
;;                          (type "home" "work" | "DONE")

(setq org-log-done t
      org-startup-indented t
      org-todo-keywords '((sequence "TODO(t!)" "NEXT(n@/!)" "PLAN(p@)" "WAITING(w@/!)" "|" "DONE(d@/!)" "CANCELED(c@/!)"))
      org-todo-keyword-faces '(("NEXT" . (:foreground "brown" :weight bold))))

(setq org-tag-alist '((:startgroup . nil)
                      ("Study" . ?s) ("Work" . ?w) ("Outdoor" . ?O)
                      (:endgroup . nil)
                      ("Entertainment" . ?e)
                      ("eXecise" . ?x)
                      ("Travel" . ?t)))
(setq org-src-fontify-natively t) ;; high light codes
(setq org-export-with-sub-superscripts '{}) ;; '_' '^' -> '{_}' '{^}'
;;org-agenda
(global-set-key (kbd "C-c a") 'org-agenda)
(setq org-agenda-show-log t
      org-agenda-todo-ignore-scheduled t
      org-agenda-todo-ignore-deadlines t)
(setq org-agenda-files (list "m:/doc/agenda/task.org"
                             "m:/doc/agenda/note.org"
                             "m:/doc/agenda/inbox.org"
                             "m:/doc/agenda/finished.org"
                             "m:/doc/agenda/project.org"
                             "m:/doc/agenda/trash.org"))


;; ORG MODE CONFIGURATION ABOVE
;; --------------------------------------

(setq prelude-theme 'material)
;;(setq prelude-theme 'solarized-dark)
(setq prelude-clean-whitespace-on-save nil)
;;(setq prelude-guru nil)
