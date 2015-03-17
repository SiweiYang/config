(require 'package)
(package-initialize)

(require 'company)
(require 'rainbow-delimiters)

(add-to-list 'load-path "~/.cabal/share/structured-haskell-mode-1.0.20/elisp/")
(require 'shm)

(add-to-list 'package-archives '("melpa" . "http://melpa.milkbox.net/packages/"))
;(add-to-list 'package-archives '("marmalade" . "https://marmalade-repo.org/packages/"))
;(add-to-list 'package-archives '("org" . "http://orgmode.org/elpa/") t) ; Org-mode's repository

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
(custom-set-variables '(haskell-process-type 'cabal-repl))
(custom-set-variables
  '(haskell-process-suggest-remove-import-lines t)
  '(haskell-process-auto-import-loaded-modules t)
  '(haskell-process-log t))

;; complete haskell-mode hooks
(add-hook 'haskell-mode-hook 'turn-on-haskell-doc-mode)
(add-hook 'haskell-mode-hook 'turn-on-haskell-decl-mode)
(add-hook 'haskell-mode-hook 'turn-on-haskell-indentation-mode)

(add-hook 'haskell-mode-hook 'structured-haskell-mode)
(add-hook 'haskell-mode-hook #'rainbow-delimiters-mode)

(add-to-list 'company-backends 'company-ghc)
(custom-set-variables '(company-ghc-show-info t))
(add-hook 'haskell-mode-hook 'company-mode)
