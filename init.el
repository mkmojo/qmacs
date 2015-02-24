;; Turn on visible bell
(setq visible-bell t)

;; Update this path to the correct location.
(add-to-list 'load-path "~/Library/Emacs/slime")
(require 'slime-autoloads)

(eval-after-load "slime"
  '(progn
     (add-to-list 'load-path "~/Library/Emacs/slime/contrib")
     (slime-setup '(slime-fancy slime-banner))
     (setq slime-complete-symbol*-fancy t)
     (setq slime-complete-symbol-function 'slime-fuzzy-complete-symbol)))

;; Optionally, specify the Lisp program you are using. Default is "lisp"
;; If the Allegro directory is not in your PATH environment variable
;; this should be a fully qualified path.
;; choose one of the below based on Express or non-Express usage
;; (setq inferior-lisp-program "alisp") 
(setq inferior-lisp-program "/Applications/AllegroCLexpress.app/Contents/Resources/alisp") 

;; Configuration to use ELPA
(when (>= emacs-major-version 24)
  (require 'package)
  (package-initialize)
  (add-to-list 'package-archives '("melpa" . "http://melpa.milkbox.net/packages/") t))

;; Enable org-mode
(require 'org)
(define-key global-map "\C-cl" 'org-store-link)
(define-key global-map "\C-ca" 'org-agenda)
(setq org-log-done t)
(setq org-directory "~/Dropbox/org")

;; Org-mode files that are generatedy by C-c [
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(org-agenda-files (quote ("~/Dropbox/org/home.org" "~/Dropbox/org/org-mode.org" "~/Dropbox/org/work.org"))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

;; Org-mode babel integration for Python
(org-babel-do-load-languages
 'org-babel-load-languages
 '((python . t)))

;; Enable Evil Mode
(add-to-list 'load-path "~/.emacs.d/evil-20140803.930")
(require 'evil)
(evil-mode 1)

;; Org-capture
(setq org-default-notes-file (concat org-directory "/notes.org"))

;; Set the environment varialbe for sml language
(setenv "PATH" (concat "/usr/local/smlnj/bin:" (getenv "PATH")))
(setq exec-path (cons "/usr/local/smlnj/bin" exec-path))
