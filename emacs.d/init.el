;; Emacs Initialization

;; Add package sources
(require 'package)
(add-to-list 'package-archives '("melpa"  . "https://melpa.org/packages/") t)
(add-to-list 'package-archives '("nongnu" . "https://elpa.nongnu.org/nongnu/") t)
(package-initialize)

;; UTF-8
(prefer-coding-system 'utf-8)

;; Starting up
(setq backup-directory-alist '(("." . "~/.emacs.d/backups")))
(setq make-backup-files nil)
(setq create-lockfiles nil)

(setq savehist-file "~/.emacs.d/history")
(savehist-mode -1)

(setq custom-file "~/.emacs.d/custom.el")
(load custom-file t)

;; Appearance

;; Disable the menu bar
(menu-bar-mode -1)

;; Disable the tool bar
(tool-bar-mode -1)

;; Disable the scroll bars
(scroll-bar-mode -1)

;; Load a custom theme
(load-theme 'modus-vivendi t)

;; Set default font face
;; (set-face-attribute 'default nil :font "PragmataPro Mono Liga-14")
(add-to-list 'default-frame-alist '(font . "PragmataPro Mono Liga-14"))

;; Highlight current line
(global-hl-line-mode 1)

;; Automatically pair parentheses
(electric-pair-mode 1)

;; Change "yes or no" to "y or n"
(fset 'yes-or-no-p 'y-or-n-p)

;; Turn off welcome screen
(setq inhibit-startup-screen t)

;; Middle-clicking pastes at the current location.
(setq mouse-yank-at-point t)

;; Show line and column in the mode-line
(line-number-mode 1)
(column-number-mode 1)

;; Completion

;; Enable vertico
(use-package vertico :init (vertico-mode))

;; Web Development

(add-to-list 'auto-mode-alist '("\\.html?\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.css?\\'"  . web-mode))

;; HTML element offset indentation 
(setq web-mode-markup-indent-offset 2)

;; CSS offset indentation 
(setq web-mode-css-indent-offset 2)

;; Tab width of 2 is compact and readable
;; (setq-default css-indent-offset 2) 



(defun my-reload-emacs-configuration ()
  (interactive)
  (load-file "~/.emacs.d/init.el"))
