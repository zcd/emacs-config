(require 'package)

(setq-default load-prefer-newer t)
(setq-default package-enable-at-startup nil)

(add-to-list 'package-archives
	     '("melpa" . "https://melpa.org/packages/") t)
(add-to-list 'package-archives
             '("nongnu" . "https://elpa.nongnu.org/nongnu/") t)
(package-initialize)

(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package t))

(require 'use-package)

(use-package org-contrib
  :ensure t)

;; Tangle config.
(org-babel-load-file (expand-file-name "emacs-config.org"
                                       user-emacs-directory))
(garbage-collect)
