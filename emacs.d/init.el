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

;; Add ELPA load path
(add-to-list 'load-path (expand-file-name "~/.emacs.d/elpa/"))

;; Load packages
(package-initialize t)
(setq package-enable-at-startup nil)
(org-babel-load-file "~/.emacs.d/myinit.org")

;; Custom
(custom-set-variables
 '(custom-safe-themes (quote ("fc5fcb6f1f1c1bc01305694c59a1a861b008c534cae8d0e48e4d5e81ad718bc6" "1e7e097ec8cb1f8c3a912d7e1e0331caeed49fef6cff220be63bd2a6ba4cc365" default))))
(custom-set-faces)
