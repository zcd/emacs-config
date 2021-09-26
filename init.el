(require 'package)

(setq-default load-prefer-newer t)
(setq-default package-enable-at-startup nil)

(add-to-list 'package-archives
	     '("melpa" . "https://melpa.org/packages/") t)
(add-to-list 'package-archives
             '("org" . "http://orgmode.org/elpa/") t)
(package-initialize)

(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package t))

(require 'use-package)

;; Latest org package.
(use-package org :ensure org-plus-contrib)

;; Tangle config.
(org-babel-load-file (expand-file-name "emacs-config.org"
                                       user-emacs-directory))
(garbage-collect)
