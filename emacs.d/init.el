;;; Junhao's Emacs Config

;; Set up load path to override it
(package-initialize nil)
(add-to-list 'load-path "~/.emacs.d/elpa/*")
(require 'package)
(require 'org)
(require 'ob-tangle)

;; Add package sources
(add-to-list 'package-archives
	     '("gnu" . "http://elpa.gnu.org/packages/") t)
(add-to-list 'package-archives
	     '("melpa" . "http://melpa.milkbox.net/packages/"))
(add-to-list 'package-archives
	     '("marmalade" . "http://marmalade-repo.org/packages/"))

;; Load packages
(package-initialize t)
(setq package-enable-at-startup nil)
(org-babel-load-file "~/.emacs.d/myinit.org")

;; Misc
(add-to-list 'auto-mode-alist '("\\.org\\'" . org-mode))
