;;
;; PACKAGE MANAGEMENT
;;

(require 'package)

;; 1st priority
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)

;;
;; USER INTERFACE
;;

;; Menu bar: on/off?
(menu-bar-mode -1)

;; Tool bar: on/off?
(tool-bar-mode -1)

;; Scroll bar: on/off?
(scroll-bar-mode -1)

;; Tooltips: on/off?
(tooltip-mode -1)

;; Cursor blinking: on/off?
(blink-cursor-mode -1)

;; Highlight current line: on/off?
(global-hl-line-mode 1)

;; Startup screen: on/off?
(setq inhibit-startup-screen t)

;; Alarms: on/off?
(setq ring-bell-function 'ignore)

;;
;; MODELINE
;;

;; Show column number: on/off?
(column-number-mode 1)

;; Show the buffer size: on/off?
(size-indication-mode -1)

;;
;; MINIBUFFER
;;

;; Save history between sessions: on/off?
(savehist-mode -1)

;; Delete duplicates from the command history
(setq history-delete-duplicates t)

;; Where to save the minibuffer history?
(setq savehist-file "~/.emacs.d/history")

;; Use the minibuffer instead of dialog boxes
(setq use-dialog-box nil)

;; Change all yes/no style questions to y/n style
(fset 'yes-or-no-p 'y-or-n-p)

;;
;; MINIBUFFER COMPLETION
;;

;; Enable Vertico
(use-package vertico :init (vertico-mode))

;;
;; BUFFERS
;;

(global-set-key [f1] 'previous-buffer)
(global-set-key [f2] 'next-buffer)

;; Kill the current buffer immediately
(global-set-key (kbd "C-x k") #'kill-current-buffer)

;;
;; IBUFFER
;;

(require 'ibuf-ext)

;; Auto refresh buffers list
(add-hook 'ibuffer-mode-hook
          (lambda ()
            (ibuffer-auto-mode 1)))

;; Hide all buffers starting with an asterisk
(add-to-list 'ibuffer-never-show-predicates "^\\*")

(global-set-key (kbd "C-x C-b") 'ibuffer)

;;
;; WINDOW MANAGEMENT
;;

;; Focus follows mouse?
(setq mouse-autoselect-window t
      focus-follows-mouse t)

;;
;; CLIPBOARD, COPY & PASTE
;;

;; Mouse yank commands yank at point instead of at click
(setq mouse-yank-at-point t)

;;
;; BACKUP
;;

;; Where to save the backups?
(setq backup-directory-alist '(("." . "~/.emacs.d/backups")))

;; No backup
(setq make-backup-files nil)

;;
;; LOCKFILES
;;

;; Let Emacs keep track of files currently visited?
(setq create-lockfiles nil)

;;
;; AUTOSAVE
;;

(setq auto-save-default nil
      auto-save-interval 0)

;;
;; APPAREANCE
;;

;; Load a custom theme
(load-theme 'modus-vivendi t)

;;
;; FONTS
;;

;; Set default font face
(add-to-list 'default-frame-alist '(font . "PragmataPro Mono Liga-14"))

;;
;; CUSTOM FILE
;;

;; Where to save the custom file?
(setq custom-file "~/.emacs.d/custom.el")

(load custom-file t)

;;
;; GENERAL EDITING
;;

;; UTF-8
(prefer-coding-system 'utf-8)

;; Set desired line length in characters
(setq-default fill-column 80)

;; Save always with a final new line
(setq require-final-newline t)

;;
;; BRACKETS / PARENTHESIS
;;

;; Automatically pair parentheses
(electric-pair-mode 1)

;; Start the mode automatically in most programming modes
(add-hook 'prog-mode-hook #'rainbow-delimiters-mode)

;;
;; INDENTATION
;;

;; Don't use tabs but spaces
(setq-default indent-tabs-mode nil
              tab-width 2) 

;;
;; WEB DEVELOPEMENT
;;

(add-to-list 'auto-mode-alist '("\\.html?\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.css?\\'"  . web-mode))

;; HTML element offset indentation
(setq web-mode-markup-indent-offset 2)

;; CSS offset indentation 
(setq web-mode-css-indent-offset 2)




(defun my-reload-emacs-configuration ()
  (interactive)
  (load-file "~/.emacs.d/init.el"))
