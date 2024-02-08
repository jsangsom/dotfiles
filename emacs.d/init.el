;;
;; Package Management
;; 

(require 'package)

(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)

;;
;; Appearance
;;

;; Menu bar: on/off?
(menu-bar-mode -1)

;; Scroll bar: on/off?
(scroll-bar-mode -1)

;; Tool bar: on/off?
(tool-bar-mode -1)

;; Tooltips: on/off?
(tooltip-mode -1)

;; Highlight current line: on/off?
(global-hl-line-mode 1)

;; Startup screen: on/off?
(setq inhibit-startup-screen t)

;;
;; Fonts
;;

;; Set default font face
(add-to-list 'default-frame-alist '(font . "PragmataPro Mono Liga-14"))

;;
;; Theme
;;

;; Load a custom theme
(load-theme 'modus-vivendi t)

;;
;; Cursor
;;

;; Turn on/off cursor blinking?
(blink-cursor-mode -1)

;; Cursor blinking interval in seconds
(setq blink-cursor-interval 0.4)

;;
;; Modeline
;;

;; Show column number along with line number in modeline
(column-number-mode 1)

;;
;; Minibuffer
;;

;; Use the minibuffer instead of dialog boxes
(setq use-dialog-box nil)

;; Change all yes/no style questions to y/n style
(fset 'yes-or-no-p 'y-or-n-p)

;; Where to save the minibuffer history?
(setq savehist-file "~/.emacs.d/history")

;; Delete duplicates from the command history
(setq history-delete-duplicates t)

;; Save minibuffer history between Emacs sessions?
(savehist-mode -1)

;;
;; Backup
;;

;; Where to save the backups?
(setq backup-directory-alist '(("." . "~/.emacs.d/backups")))

;; No backup
(setq make-backup-files nil)

;;
;; Lockfiles
;;

;; Let Emacs keep track of files currently visited?
(setq create-lockfiles nil)

;;
;; Autosave
;;

(setq auto-save-default nil)
(setq auto-save-interval 0)

;;
;; Window Mnagement
;;

;; Focus follows mouse?
(setq mouse-autoselect-window t)
(setq focus-follows-mouse t)

;;
;; Custom File
;;

;; Where to save the custom file?
(setq custom-file "~/.emacs.d/custom.el")

;; Load it!
(load custom-file t)

;;
;; General Editing
;;

;; UTF-8
(prefer-coding-system 'utf-8)

;; Set desired line length in characters
(setq-default fill-column 80)

;; Don't use tabs but spaces
(setq-default indent-tabs-mode nil)

;; Set display width for tab characters
(setq-default tab-width 2)

;; Save always with a final new line
(setq require-final-newline t)

;; Automatically pair parentheses
(electric-pair-mode 1)

;;
;; Completion
;;

;; Enable Vertico
(use-package vertico :init (vertico-mode))

;;
;; Web Development
;;

(add-to-list 'auto-mode-alist '("\\.html?\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.css?\\'"  . web-mode))

;; HTML element offset indentation
(setq web-mode-markup-indent-offset 2)

;; CSS offset indentation 
(setq web-mode-css-indent-offset 2)

;;
;; Keymaps
;;

;; Middle-clicking pastes at the current location.
(setq mouse-yank-at-point t)

(global-set-key [f1] 'previous-buffer)
(global-set-key [f2] 'next-buffer)




(defun my-reload-emacs-configuration ()
  (interactive)
  (load-file "~/.emacs.d/init.el"))
