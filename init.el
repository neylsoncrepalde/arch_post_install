
;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.
(setq package-archives '(("gnu" . "https://elpa.gnu.org/packages/")
                     ("marmalade" . "https://marmalade-repo.org/packages/")
                     ("melpa" . "https://melpa.org/packages/")))
(package-initialize)


(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
(require 'ess-site)

(setq latex-run-command "pdflatex")
(setq reftex-default-bibliography '("/home/neylson/tese/BIBDOUTORADO.bib"))
(require 'better-defaults)
(require 'smartparens)
(smartparens-global-mode t)

(setq ispell-program-name "aspell") ; could be ispell as well, depending on your preferences
(setq ispell-dictionary "british") ; this can obviously be set to any language your spell-checking program supports

(add-hook 'LaTeX-mode-hook 'flyspell-mode)
;;(add-hook 'LaTeX-mode-hook 'flyspell-buffer)

(add-hook 'after-init-hook 'global-company-mode) ;enable company-mode

;; TABLE OF CONTENTS
(require 'tex-site)
(autoload 'reftex-mode "reftex" "RefTeX Minor Mode" t)
(autoload 'turn-on-reftex "reftex" "RefTeX Minor Mode" nil)
(autoload 'reftex-citation "reftex-cite" "Make citation" nil)
(autoload 'reftex-index-phrase-mode "reftex-index" "Phrase Mode" t)
(add-hook 'latex-mode-hook 'turn-on-reftex) ; with Emacs latex mode
;; (add-hook 'reftex-load-hook 'imenu-add-menubar-index)
(add-hook 'LaTeX-mode-hook 'turn-on-reftex)

(setq LaTeX-eqnarray-label "eq"
LaTeX-equation-label "eq"
LaTeX-figure-label "fig"
LaTeX-table-label "tab"
LaTeX-myChapter-label "chap"
TeX-auto-save t
TeX-newline-function 'reindent-then-newline-and-indent
TeX-parse-self t
TeX-style-path
'("style/" "auto/"
"/usr/share/emacs21/site-lisp/auctex/style/"
"/var/lib/auctex/emacs21/"
"/usr/local/share/emacs/site-lisp/auctex/style/")
LaTeX-section-hook
'(LaTeX-section-heading
LaTeX-section-title
LaTeX-section-toc
LaTeX-section-section
LaTeX-section-label))

;; C++ setup=================
;;set speedbar to show all the files
(setq speedbar-show-unknown-files t)

; start auto-complete with emacs
(require 'auto-complete)
; do default config for auto-complete
(require 'auto-complete-config)
(ac-config-default)
; start yasnippet with emacs
(require 'yasnippet)
(yas-global-mode 1)

; let's define a function which initializes auto-complete-c-headers and gets called for c/c++ hooks
(defun my:ac-c-header-init ()
  (require 'auto-complete-c-headers)
  (add-to-list 'ac-sources 'ac-source-c-headers)
  (add-to-list 'achead:include-directories '"/usr/lib/gcc/x86_64-pc-linux-gnu/7.2.0/../../../../include/c++/7.2.0")
)

; now let's call this function from c/c++ hooks
(add-hook 'c++-mode-hook 'my:ac-c-header-init)
(add-hook 'c-mode-hook 'my:ac-c-header-init)

;; fix iedit bug
(define-key global-map (kbd "C-c ;") 'iedit-mode)


(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-enabled-themes (quote (tango-dark)))
 '(package-selected-packages
   (quote
    (sr-speedbar yasnippet-snippets smex smartparens scpaste paredit org-journal org magit iedit ido-ubiquitous idle-highlight-mode google-c-style flymake-google-cpplint flymake-cursor find-file-in-project company-statistics company-auctex better-defaults)))
 '(yas-global-mode t))

;; start flymake-google-cpplint-load
;; let's define a function for flymake initialization
;(require 'flymake-cursor)
;(defun my:flymake-google-init()
;  (require 'flymake-google-cpplint)
;  (custom-set-variables
;   '(flymake-google-cpplint-command "~/anaconda3/bin/cpplint"))
;  (flymake-google-cpplint-load)
;  )
;(add-hook 'c-mode-hook 'my:flymake-google-init)
;(add-hook 'c++-mode-hook 'my:flymake-google-init)

;; start google-c-style with emacs
;(require 'google-c-style)
;(add-hook 'c-mode-common-hook 'google-set-c-style)
;(add-hook 'c-mode-common-hook 'google-make-newline-indent)

;; turn on Semantic
(semantic-mode 1)

; let's define a function which adds semantic as a suggestion backend to auto complete
; and hook this function to c-mode-common-hook
(defun my:add-semantic-to-autocomplete() 
  (add-to-list 'ac-sources 'ac-source-semantic)
)
(add-hook 'c-mode-common-hook 'my:add-semantic-to-autocomplete)

;; turn on automatic reparsing of open buffers in semantic
(global-semanticdb-minor-mode 1)
(global-semantic-idle-scheduler-mode 1)

;; turn on ede mode 
(global-ede-mode 1)

;; set default compile command to clang++
(setq compile-command "clang++ -std=c++11 ")
