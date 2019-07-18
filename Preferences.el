;; This is the Aquamacs Preferences file.
;; Add Emacs-Lisp code here that should be executed whenever
;; you start Aquamacs Emacs. If errors occur, Aquamacs will stop
;; evaluating this file and print errors in the *Messages* buffer.
;; Use this file in place of ~/.emacs (which is loaded as well.)

(setq package-archives '(("gnu" . "http://elpa.gnu.org/packages/")
			 ("melpa" . "http://melpa.org/packages/")))

(setq package-list '(auto-complete company-auctex auctex company-statistics company flymake-cursor flymake-easy idle-highlight-mode iedit ivy magit git-commit magit-popup markdown-mode memoize org org-journal pandoc pandoc-mode hydra paredit popup s scpaste htmlize smartparens dash smex sr-speedbar with-editor async yasnippet-snippets yasnippet ess polymode poly-R spacemacs-theme exec-path-from-shell)

; activate all the packages (in particular autoloads)
(package-initialize)

; fetch the list of packages available 
(unless package-archive-contents
  (package-refresh-contents))

; install the missing packages
(dolist (package package-list)
  (unless (package-installed-p package)
    (package-install package)))

(setq ess-etc-directory "~/Library/Preferences/Aquamacs Emacs/Packages/elpa/ess-20190708.1230/etc")
(require 'ess-site) ; ESS
(require 'polymode)
(require 'poly-R)
(add-hook 'markdown-mode-hook 'pandoc-mode)
(add-hook 'pandoc-mode-hook 'pandoc-load-default-settings)

(exec-path-from-shell-initialize)
(exec-path-from-shell-copy-env "LC_ALL")
(exec-path-from-shell-copy-env "LANG")
      
(require 'better-defaults)

(setq latex-run-command "pdflatex")
(setq reftex-default-bibliography '("/Users/neylsoncrepalde/tese/BIBDOUTORADO.bib"))

(require 'smartparens)
(smartparens-global-mode t)

(add-hook 'LaTeX-mode-hook 'flyspell-mode)
;;(add-hook 'LaTeX-mode-hook 'flyspell-buffer)

(add-hook 'after-init-hook 'global-company-mode) ;enable company-mode

(setq ispell-program-name "aspell") ; could be ispell as well, depending on your preferences
(setq ispell-dictionary "british") ; this can obviously be set to any language your spell-checking program supports

;; TABLE OF CONTENTS
(require 'tex-site)
(add-hook 'latex-mode-hook 'turn-on-reftex) ; with Emacs latex mode

; start auto-complete with emacs
(require 'auto-complete)
; do default config for auto-complete
(require 'auto-complete-config)
(ac-config-default)
; start yasnippet with emacs
(require 'yasnippet)
(yas-global-mode 1)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-enabled-themes (quote (spacemacs-dark))))

