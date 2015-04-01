(require 'package)
(package-initialize)

(add-to-list 'package-archives '("melpa" . "http://melpa.milkbox.net/packages/"))
;(add-to-list 'package-archives '("marmalade" . "https://marmalade-repo.org/packages/"))
;(add-to-list 'package-archives '("org" . "http://orgmode.org/elpa/") t) ; Org-mode's repository

(when (not package-archive-contents)
  (package-refresh-contents))

(require 'haskell-interactive-mode)
(require 'haskell-process)
(require 'company)
(require 'rainbow-delimiters)
;(add-to-list 'load-path "~/.cabal/share/structured-haskell-mode-1.0.20/elisp/")               
(require 'shm)

(add-to-list 'custom-theme-load-path "~/.emacs.d/emacs-color-theme-solarized")
(load-theme 'solarized t)

;(unless (package-installed-p 'haskell-mode)
;  (package-install 'haskell-mode))

;(unless (package-installed-p 'clojure-mode)
;  (package-install 'clojure-mode))

;(unless (package-installed-p 'paredit)
;  (package-install 'paredit))

;; (require 'paredit) if you didn't install it via package.el
;(add-hook 'clojure-mode-hook 'paredit-mode)

(add-to-list 'auto-mode-alist '("\\.hs\\'" . haskell-mode))

(let ((my-cabal-path (expand-file-name "~/.cabal/bin")))
  (setenv "PATH" (concat my-cabal-path ":" (getenv "PATH")))
  (add-to-list 'exec-path my-cabal-path))

(custom-set-variables '(haskell-tags-on-save t))
(custom-set-variables '(haskell-process-type 'ghci))
(custom-set-variables
  '(haskell-process-suggest-remove-import-lines t)
  '(haskell-process-auto-import-loaded-modules t)
  '(haskell-process-log t))
(eval-after-load 'haskell-mode '(progn
  (define-key haskell-mode-map (kbd "C-c C-l") 'haskell-process-load-or-reload)
  (define-key haskell-mode-map (kbd "C-c C-z") 'haskell-interactive-switch)
  (define-key haskell-mode-map (kbd "C-c C-n C-t") 'haskell-process-do-type)
  (define-key haskell-mode-map (kbd "C-c C-n C-i") 'haskell-process-do-info)))

;; for ghc-mod
(autoload 'ghc-init "ghc" nil t)
(autoload 'ghc-debug "ghc" nil t)
(add-hook 'haskell-mode-hook (lambda () (ghc-init)))

;; complete haskell-mode hooks
(add-hook 'haskell-mode-hook 'turn-on-haskell-doc-mode)
(add-hook 'haskell-mode-hook 'turn-on-haskell-decl-scan)
;(add-hook 'haskell-mode-hook 'turn-on-haskell-indentation-mode)
(add-hook 'haskell-mode-hook 'structured-haskell-mode)

(add-hook 'haskell-mode-hook #'rainbow-delimiters-mode)

(add-hook 'haskell-mode-hook 'interactive-haskell-mode)

(add-hook 'haskell-mode-hook 'company-mode)
(add-to-list 'company-backends 'company-ghc)
(custom-set-variables '(company-ghc-show-info t))
(custom-set-variables '(company-ghc-autoscan t))
