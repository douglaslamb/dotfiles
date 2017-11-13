(require 'org)
(require 'package) ;; You might already have this line

(global-visual-line-mode t)

(add-to-list 'package-archives
	     `("melpa-stable" . "http://stable.melpa.org/packages/"))
(add-to-list 'load-path "~/emacs_load-path")
(add-to-list 'load-path "~/emacs_load-path/htmlize")

;(add-to-list 'load-path "~/.emacs.d/lisp/undo-tree")
;(require 'undo-tree)
;(global-undo-tree-mode 1)

;;(require 'backup-each-save)
;;(add-hook 'after-save-hook 'backup-each-save)
;;(require 'calfw)
;;(require 'calfw-org)

;; set orgmode to add a timestamp to a headline when it is marked done
(setq org-log-done 'time)

(ido-mode t)

(setq ido-create-new-buffer 'always)

;disable auto save
(setq auto-save-default nil)

(setq org-alphabetical-lists t)

(setq org-todo-keywords
       '((sequence "TODO" "IN PROGRESS" "|" "DONE" "CANCELLED")))

(add-to-list 'auto-mode-alist '("\\.org\\'" . org-mode))

(setq org-icalendar-include-todo nil)
(setq org-icalendar-honor-noexport-tag t)

(defun my-org-archive-done-tasks ()
  (setq org-map-continue-from (outline-next-heading))
  (interactive)
  (org-map-entries 'org-archive-subtree "/CANCELLED" 'file))

;; Capture
(global-set-key (kbd "C-c r") 'org-capture)
(setq org-capture-templates
      '(("d" "Dark Show Notes" entry
	 (file+headline "~/org/darkshow/darkshow.org" "Capture")
	 "\n\n** %?\n%T\n%i\n%a\n\n\n"
	 :empty-lines 1)

	("p" "Personal Notes" entry
	 (file+headline "~/org/personal/personal.org" "Capture")
	 "\n\n** %?\n%T\n%i\n%a\n\n\n"
	 :empty-lines )

	("s" "Sketch" entry
	 (file+headline "~/org/sketchpad/sketchpad.org" "Sketchpad")
	 "\n\n** %?\n%T\n%i\n%a\n\n\n"
	 :empty-lines )
        ))

 ;; make the frame contain a single window. by default org-capture  
 ;; splits the window.  
 (add-hook 'org-capture-mode-hook  
           'delete-other-windows)  
   
 (defun make-capture-frame ()  
  "Create a new frame and run org-capture."  
  (interactive)  
  (make-frame '((name . "capture") 
                (width . 40) 
                (height . 15)))  
  (select-frame-by-name "capture") 
  (setq word-wrap 1)
  (setq truncate-lines nil)
  (org-capture))

(setq org-agenda-default-appointment-duration 60)

(defun my-export-calendar ()
  "export my calendar to shared_calendar in home"
  (interactive)
  (find-file "~/org/personal/personal.org")
  (goto-char (org-find-exact-headline-in-buffer "Appts"))
  (org-icalendar-export-to-ics nil 1 nil nil))

(setq org-icalendar-combined-agenda-file "~/shared_calendar/personal.ics")

(global-set-key "\C-cl" 'org-store-link)
(global-set-key "\C-cc" 'make-capture-frame)
(global-set-key "\C-ca" 'org-agenda)
(global-set-key "\C-cb" 'org-iswitchb)
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(org-agenda-files
   (quote
    ("~/org/personal/personal.org"))))
;; (custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
;; '(default ((t (:inherit nil :stipple nil :background "White"
;; :foreground "Black" :inverse-video nil :box nil :strike-through nil
;; :overline nil :underline nil :slant normal :weight normal :height
;; 140 :width normal :foundry "apple" :family "Inconsolata")))))

(setq org-agenda-sorting-strategy `(time-up priority-down todo-state-down))
(setq org-agenda-tags-todo-honor-ignore-options t)

(setq org-agenda-custom-commands
      '(("d" "Day's agenda"
	 ((agenda "")
	  (tags "reminder"
		     ((org-agenda-overriding-header "reminders\n----------------")))
	  (tags-todo "mit&PRIORITY=\"A\""
		     ((org-agenda-overriding-header "MITs\n----------------")))))
	("r" "Day's agenda and big rocks"
	 ((agenda "")
	  (tags "reminder"
		     ((org-agenda-overriding-header "reminders\n----------------")))
	  (tags-todo "mit&PRIORITY=\"A\""
		     ((org-agenda-overriding-header "MITs\n----------------")))
	  (tags-todo "br&PRIORITY=\"A\""
		     ((org-agenda-overriding-header "Big Rocks\n----------------")))))
      ("l" "Day's agenda, big rocks, and lmds"
       ((agenda "")
	  (tags "reminder"
		     ((org-agenda-overriding-header "reminders\n----------------")))
	  (tags-todo "mit&PRIORITY=\"A\""
		     ((org-agenda-overriding-header "MITs\n----------------")))
	  (tags-todo "br&PRIORITY=\"A\""
		     ((org-agenda-overriding-header "Big Rocks\n----------------")))
	  (tags-todo "lmd&PRIORITY=\"A\""
		     ((org-agenda-overriding-header "LMDs\n----------------")))))
      ("p" "Day's agenda, big rocks, lmds, and sand"
       ((agenda "")
	  (tags "reminder"
		     ((org-agenda-overriding-header "reminders\n----------------")))
	  (tags-todo "mit&PRIORITY=\"A\""
		     ((org-agenda-overriding-header "MITs\n----------------")))
	  (tags-todo "br&PRIORITY=\"A\""
		     ((org-agenda-overriding-header "Big Rocks\n----------------")))
	  (tags-todo "lmd&PRIORITY=\"A\""
		     ((org-agenda-overriding-header "LMDs\n----------------")))
          (tags-todo "+PRIORITY=\"A\"-br-lmd-fun"
		     ((org-agenda-overriding-header "sand\n----------------")
		      (org-agenda-todo-ignore-timestamp "all")
		      (org-agenda-todo-ignore-with-date t)))))
      ("f" "Fun stuff"
       ((tags-todo "fun"
		   ((org-agenda-overriding-header "Fun things to do\n---------------")))))
      ))

(setq default-frame-alist '((width . 96) (height . 60)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

(defun my-org-agenda-do-one-day-later ()
  (interactive)
  (org-agenda-do-date-later 1))

(setq org-agenda-ndays 1)

(setq inhibit-splash-screen t)
(org-agenda-list)
(delete-other-windows)
