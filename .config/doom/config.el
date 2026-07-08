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
(if (string= system-name "archlinux")
       (setq doom-font (font-spec :family "Maple Mono NL NF" :size 18)
             doom-variable-pitch-font (font-spec :family "Maple Mono NL NF" :size 18))
       (setq doom-font (font-spec :family "Maple Mono NF" :size 24)
             doom-variable-pitch-font (font-spec :family "Maple Mono NF" :size 24)))

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
(setq doom-theme 'noctalia)

(setq +dashboard-functions
  `(+dashboard-widget-banner
    +dashboard-widget-shortmenu))

;; How tall the mode-line should be. It's only respected in GUI.
;; If the actual char height is larger, it respects the actual height.
(setq doom-modeline-bar-width 5
      doom-modeline-height 40)

;; This determines the style of line numbers in effect. If set to `nil', line
;; numbers are disabled. For relative line numbers, set this to `relative'.
(setq display-line-numbers-type 'relative
      standard-indent 3
      underline-minimum-offset 5)

;; EVIL Settings
(setq evil-vsplit-window-right t
      evil-split-window-below t
      evil-shift-width 3
      evil-want-Y-yank-to-eol t)

(setq yas-indent-line 'fixed)

;; If you use `org' and don't want your org files in the default location below,
;; change `org-directory'. It must be set before org loads!
(setq org-directory "~/orgfiles/")

(setq confirm-kill-emacs nil)        ;; Don't confirm on exit
(setq custom-tab-width 3)
(setq fancy-splash-image (concat doom-user-dir "splash.png"))

(custom-set-faces
 '(org-level-1 ((t (:inherit outline-1 :weight bold))))
 '(org-level-2 ((t (:inherit outline-2 :weight bold))))
 '(org-level-3 ((t (:inherit outline-3 :weight bold))))
 '(org-level-4 ((t (:inherit outline-4 :weight bold))))
 '(org-level-5 ((t (:inherit outline-5 :weight bold))))
 '(org-level-6 ((t (:inherit outline-5 :weight bold))))
 '(org-level-7 ((t (:inherit outline-5 :weight bold)))))

(after! org
  (setq org-ellipsis " ▼"
        org-capture-templates
        '(("t" "Personal todo" entry
           (file+headline +org-capture-todo-file "Todos")
           "* TODO %?\n%i\n%a" :prepend t :empty-lines 1)
           ("j" "Journal" entry
           (file+olp+datetree +org-capture-journal-file)
           "* %U %?\n%i\n%a" :prepend t :empty-lines 1)
           ("m" "Meeting")
           ("mo" "One-time Meeting" entry
            (file+headline "meetings.org" "One-time Meetings")
            "* %?\nSCHEDULED:%^t" :prepend t :empty-lines 1)
           ("mr" "Recurring Meeting" entry
            (file+headline "meetings.org" "Recurring Meetings")
            "* %?\nSCHEDULED:%^t" :prepend t :empty-lines 1))))

(setq org-roam-dailies-directory "daily/")

(setq org-roam-dailies-capture-templates
      '(("d" "default" entry
         "* %?"
         :target (file+head "%<%Y-%m-%d>.org"
                            "#+title: %<%d %B,%Y>\n\n"))))

(setq org-roam-capture-templates
      '(("d" "default" plain "%?" :target
        (file+head "${slug}.org" "#+title: ${title}\n\n") :unnarrowed t)))

;; Only show one day of the agenda at a time
(after! org-agenda
  (setq org-agenda-span 7
        org-agenda-start-day "+0d"
        org-agenda-skip-timestamp-if-done t
        org-agenda-skip-deadline-if-done t
        org-agenda-skip-scheduled-if-done t
        org-agenda-skip-scheduled-if-deadline-is-shown t
        org-agenda-skip-timestamp-if-deadline-is-shown t))
;; Ricing org agenda
(setq org-agenda-current-time-string "")
(setq org-agenda-time-grid '((daily) () "" ""))

;; Filter out unwanted buffers
(after! ivy
  (add-to-list 'ivy-ignore-buffers "^\\*Messages\\*$")
  (add-to-list 'ivy-ignore-buffers "^\\*scratch\\*$")
  (add-to-list 'ivy-ignore-buffers "^\\*doom\\*$")
  (add-to-list 'ivy-ignore-buffers "^\\*Help\\*$"))

(load! "abl-mode.el")
(use-package nerd-icons
  :ensure t)

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
   org-modern-table-vertical 1
   org-modern-table-horizontal 1
   org-modern-star 'replace
   org-modern-label-border 1
   org-modern-list '((?+ . "•")
                     (?- . "•")
                     (?* . "•"))
   org-modern-checkbox '((?X . "󰄵")
                         (?- . "󰛲")
                         (?\s . "󰄱"))))

;; ============ MAPPINGS =============
(map! :leader
      (:prefix ("o" . "open")
       :desc "Open magit" "m" #'magit))

(map! :leader
      (:desc "Treemacs" "-" #'+treemacs/toggle))
