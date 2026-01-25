;;; $DOOMDIR/config.el -*- lexical-binding: t; -*-
;; Place your private configuration here! Remember, you do not need to run 'doom
;; sync' after modifying this file!


;; Some functionality uses this to identify you, e.g. GPG configuration, email
;; clients, file templates and snippets. It is optional.
;; (setq user-full-name "John Doe"
;;       user-mail-address "john@doe.com")

;; Doom exposes five (optional) variables for controlling fonts in Doom:
;;
;; - `doom-font' -- the primary font to use
;; - `doom-variable-pitch-font' -- a non-monospace font (where applicable)
;; - `doom-big-font' -- used for `doom-big-font-mode'; use this for
;;   presentations or streaming.
;; - `doom-symbol-font' -- for symbols
;; - `doom-serif-font' -- for the `fixed-pitch-serif' face
;;
;; See 'C-h v doom-font' for documentation and more examples of what they
;; accept. For example:
;;
(setq doom-font (font-spec :family "BlexMono Nerd Font" :size 22 )
      doom-symbol-font (font-spec :family "BlexMono Nerd Font" :size 22 ))
(after! doom-theme
  (setq doom-themes-enable-bold t
        doom-themes-enable-italic t))

;; If you or Emacs can't find your font, use 'M-x describe-font' to look them
;; up, `M-x eval-region' to execute elisp code, and 'M-x doom/reload-font' to
;; refresh your font settings. If Emacs still can't find your font, it likely
;; wasn't installed correctly. Font issues are rarely Doom issues!

;; There are two ways to load a theme. Both assume the theme is installed and
;; available. You can either set `doom-theme' or manually load a theme with the
;; `load-theme' function. This is the default:
(setq doom-theme 'doom-rose-pine)

;; How tall the mode-line should be. It's only respected in GUI.
;; If the actual char height is larger, it respects the actual height.
;; (setq doom-modeline-height 40)
(setq doom-modeline-bar-width 6)

;; This determines the style of line numbers in effect. If set to `nil', line
;; numbers are disabled. For relative line numbers, set this to `relative'.
(setq display-line-numbers-type 'relative)

;; If you use `org' and don't want your org files in the default location below,
;; change `org-directory'. It must be set before org loads!
(setq org-directory "~/orgfiles/")

;; Whenever you reconfigure a package, make sure to wrap your config in an
;; `after!' block, otherwise Doom's defaults may override your settings. E.g.
;;
;;   (after! PACKAGE
;;     (setq x y))
;;
;; The exceptions to this rule:
;;
;;   - Setting file/directory variables (like `org-directory')
;;   - Setting variables which explicitly tell you to set them before their
;;     package is loaded (see 'C-h v VARIABLE' to look up their documentation).
;;   - Setting doom variables (which start with 'doom-' or '+').
;;
;; Here are some additional functions/macros that will help you configure Doom.
;;
;; - `load!' for loading external *.el files relative to this one
;; - `use-package!' for configuring packages
;; - `after!' for running code after a package has loaded
;; - `add-load-path!' for adding directories to the `load-path', relative to
;;   this file. Emacs searches the `load-path' when you load packages with
;;   `require' or `use-package'.
;; - `map!' for binding new keys
;;
;; To get information about any of these functions/macros, move the cursor over
;; the highlighted symbol at press 'K' (non-evil users must press 'C-c c k').
;; This will open documentation for it, including demos of how they are used.
;; Alternatively, use `C-h o' to look up a symbol (functions, variables, faces,
;; etc).
;;
;; You can also try 'gd' (or 'C-c c d') to jump to their definition and see how
;; they are implemented.

(setq fancy-splash-image (concat doom-user-dir "splash.png"))
(setq confirm-kill-emacs nil)        ;; Don't confirm on exit
(setq custom-tab-width 3)

(custom-set-faces
 '(org-level-1 ((t (:inherit outline-1 :weight bold))))
 '(org-level-2 ((t (:inherit outline-2 :weight bold))))
 '(org-level-3 ((t (:inherit outline-3 :weight bold))))
 '(org-level-4 ((t (:inherit outline-4 :weight bold))))
 '(org-level-5 ((t (:inherit outline-5 :weight bold))))
 '(org-level-6 ((t (:inherit outline-5 :weight bold))))
 '(org-level-7 ((t (:inherit outline-5 :weight bold)))))

;; Only show one day of the agenda at a time
(after! org-agenda
  (setq org-agenda-span 1
        org-agenda-start-day "+0d"
        org-agenda-skip-timestamp-if-done t
        org-agenda-skip-deadline-if-done t
        org-agenda-skip-scheduled-if-done t
        org-agenda-skip-scheduled-if-deadline-is-shown t
        org-agenda-skip-timestamp-if-deadline-is-shown t))
;; Ricing org agenda
(setq org-agenda-current-time-string "")
(setq org-agenda-time-grid '((daily) () "" ""))
;; Remove category names and scheduling type from agenda view
(setq org-agenda-prefix-format '((agenda . "  %?-2i %t ")
                                 (todo . " %i %-12:c")
                                 (tags . " %i %-12:c")
                                 (search . " %i %-12:c")))
;; Add icons!
;; (setq org-agenda-category-icon-alist
;;       `(("Teaching.p" ,(list (all-the-icons-faicon "graduation-cap" :height 0.8)) nil nil :ascent center)
;;         ("Family.s" ,(list (all-the-icons-faicon "home" :v-adjust 0.005)) nil nil :ascent center)
;;         ("Producer.p" ,(list (all-the-icons-faicon "youtube-play" :height 0.9)) nil nil :ascent center)
;;         ("Bard.p" ,(list (all-the-icons-faicon "music" :height 0.9)) nil nil :ascent center)
;;         ("Stories.s" ,(list (all-the-icons-faicon "book" :height 0.9)) nil nil :ascent center)
;;         ("Author.p" ,(list (all-the-icons-faicon "pencil" :height 0.9)) nil nil :ascent center)
;;         ("Gamedev.s" ,(list (all-the-icons-faicon "gamepad" :height 0.9)) nil nil :ascent center)
;;         ("Knowledge.p" ,(list (all-the-icons-faicon "database" :height 0.8)) nil nil :ascent center)
;;         ("Personal.p" ,(list (all-the-icons-material "person" :height 0.9)) nil nil :ascent center)
;; ))

;; Filter out unwanted buffers
(after! ivy
  (add-to-list 'ivy-ignore-buffers "^\\*Messages\\*$")
  (add-to-list 'ivy-ignore-buffers "^\\*scratch\\*$")
  (add-to-list 'ivy-ignore-buffers "^\\*doom\\*$")
  (add-to-list 'ivy-ignore-buffers "^\\*Help\\*$"))

(load! "abl-mode.el")

;; ============ PACKAGES =============
(use-package! org-modern
  :hook
  (org-mode . org-modern-mode)
  (org-agenda-finalize . org-modern-agenda)
  :config
  (setq
   ;; Edit settings
   org-auto-align-tags nil
   org-tags-column 0
   org-catch-invisible-edits 'show-and-error
   org-special-ctrl-a/e t
   org-insert-heading-respect-content t

   ;; Org styling, hide markup etc.
   org-hide-emphasis-markers t
   org-pretty-entities t
   org-agenda-tags-column 0
   org-ellipsis "…"
   org-modern-star 'replace))

(use-package nerd-icons
  :ensure t)

(use-package nerd-icons-dired
  :ensure t
  :hook (dired-mode . nerd-icons-dired-mode))

(use-package ivy-rich
  :ensure t
  :after ivy
  :init
  (ivy-rich-mode 1))

(use-package nerd-icons-ivy-rich
  :ensure t
  :after ivy-rich
  :init
  (nerd-icons-ivy-rich-mode 1))

(use-package neotree
  :config
  (setq neo-smart-open t
        neo-show-hidden-files t))

(use-package vterm
  :config
  (setq vterm-shell (getenv "SHELL")
        vterm-max-scrollback 5000))

(use-package spacious-padding
  :ensure t
  :config
  ;; These are the default values, but I keep them here for visibility.
  ;; Also check `spacious-padding-subtle-frame-lines'.
  (setq spacious-padding-widths
        '( :internal-border-width 15
           :header-line-width 4
           :mode-line-width 5
           :custom-button-width 0
           :tab-width 4
           :right-divider-width 0
           :scroll-bar-width 8
           :fringe-width 8))

  (spacious-padding-mode 1))

;; https://github.com/alphapapa/org-super-agenda/blob/master/examples.org
(require 'org-super-agenda)
(custom-set-faces!
  '(org-agenda-date :inherit outline-1 :height 1.0)
  '(org-agenda-date-today :inherit diary :height 1.0)
  '(org-agenda-date-weekend :inherit outline-2 :height 1.0)
  '(org-agenda-date-weekend-today :inherit outline-4 :height 1.0)
  '(org-super-agenda-header :inherit custom-button :weight bold :height 1.0))
(setq org-super-agenda-groups
      '(;; Each group has an implicit boolean OR operator between its selectors.

        ;; This is the first filter, anything found here
        ;; will be placed in this group
        ;; even if it matches following groups
        (:name "Overdue " ; Name
         :scheduled past ; Filter criteria
         :order 2 ; Order it should appear in agenda view
         :face 'error) ; Font face used for text

        (:name "Due soon "
         :deadline future
         :order 3
         :face 'error)

        ;; Fourth filter..
        (:name "Today "  ; Optionally specify section name
         :time-grid t ; Use the time grid
         :date today ; Filter criteria
         :scheduled today ; Another filter criteria
         :order 1 ; Order it should appear in the agenda view
         :face 'warning) ; Font face used for text
        )
)
(setq org-super-agenda-header-map nil
      org-super-agenda-unmatched-name "Other Items ")
(org-super-agenda-mode t)

;; ============ MAPPINGS =============
(map! :leader
      (:prefix ("t" . "toggle")
       :desc "Toggle neotree" "t" #'neotree-toggle))
