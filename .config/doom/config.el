(setq user-full-name "Dilip Chauhan"
      user-mail-address "chauhandilip305@gmail.com"
      display-line-numbers-type 'relative
      standard-indent 3
      underline-minimum-offset 5
      confirm-kill-emacs nil
      custom-tab-width 3)

(if (string= system-name "archlinux")
       (setq doom-font (font-spec :family "Maple Mono SL NF" :size 18)
             doom-variable-pitch-font (font-spec :family "Maple Mono SL NF" :size 18))
       (setq doom-font (font-spec :family "Maple Mono SL NF" :size 22)
             doom-variable-pitch-font (font-spec :family "Maple Mono SL NF" :size 22)))

(after! doom-theme
  (setq doom-themes-enable-bold t
        doom-themes-enable-italic t))

(setq doom-theme 'dank-emacs)

;; (custom-set-faces
;;       '(mode-line ((t (:family "Iosevka Charon Mono" ))))
;;       '(mode-line-active ((t (:family "Iosevka Charon Mono" ))))
;;       '(mode-line-inactive ((t (:family "Iosevka Charon Mono" )))))

(setq +dashboard-functions
      `(+dashboard-widget-banner
        +dashboard-widget-shortmenu)
      doom-modeline-buffer-file-name-style 'auto)

(setq fancy-splash-image (concat doom-user-dir "splashes/krishna.jpeg"))

(setq evil-vsplit-window-right t
      evil-split-window-below t
      evil-shift-width 3
      evil-want-Y-yank-to-eol t)

(setq yas-indent-line 'fixed)

(setq org-directory "~/orgfiles/")

(custom-set-faces
 '(org-document-title ((t (:inherit outline-1 :weight bold :height 1.7))))
 '(org-level-1 ((t (:inherit outline-1 :weight bold :height 1.6))))
 '(org-level-2 ((t (:inherit outline-2 :weight bold :height 1.5))))
 '(org-level-3 ((t (:inherit outline-3 :weight bold :height 1.4))))
 '(org-level-4 ((t (:inherit outline-4 :weight bold :height 1.3))))
 '(org-level-5 ((t (:inherit outline-5 :weight bold :height 1.2))))
 '(org-level-6 ((t (:inherit outline-5 :weight bold :height 1.1))))
 '(org-level-7 ((t (:inherit outline-5 :weight bold :height 1.0)))))

(after! org
  (setq org-ellipsis " "
        org-todo-keywords
        '((sequence "TODO(t)" "PROJ(P)" "LOOP(r)" "PROGRESS(p)" "WAIT(w)" "HOLD(h)" "CANCELLED(c)" "TEST(T)" "IDEA(i)" "|" "DONE(d)" "KILL(k)")
         (sequence "|" "OKAY(o)" "YES(y)" "NO(n)"))
        org-capture-templates
        '(("t" "Todo" entry
           (file+headline +org-capture-todo-file "Todos")
           "* TODO %?" :prepend t :empty-lines 1)

          ("T" "Development Todo" entry
           (file+headline +org-capture-todo-file "Todos")
           "* TODO %?\n%i\n%a" :prepend t :empty-lines 1)

          ("m" "Meeting")

          ("mo" "One-time Meeting" entry
           (file+headline "meetings.org" "One-time Meetings")
           "* TODO %?\nSCHEDULED:%^t" :prepend t :empty-lines 1)

          ("mr" "Recurring Meeting" entry
           (file+headline "meetings.org" "Recurring Meetings")
           "* TODO %?\nSCHEDULED:%^t" :prepend t :empty-lines 1)))
  (add-hook! org-mode #'variable-pitch-mode))

(use-package! org-tempo
  :config
  (add-to-list 'org-structure-template-alist '("p" . "src progress")))

(custom-set-faces!
  '(org-agenda-date :inherit org-level-1)
  '(org-agenda-date-today :inherit org-level-1))

(after! org-agenda
  (setq org-agenda-span 7
        org-agenda-start-day "+0d"
        org-agenda-show-current-time-in-grid nil
        org-agenda-time-grid '((daily) () "" "")
        org-agenda-use-time-grid nil
        org-agenda-skip-timestamp-if-done t
        org-agenda-skip-deadline-if-done t
        org-agenda-skip-scheduled-if-done t
        org-agenda-skip-scheduled-if-deadline-is-shown t
        org-agenda-skip-timestamp-if-deadline-is-shown t
        org-agenda-files (list org-directory (concat org-directory "journal/"))))
;; Remove category names and scheduling type from agenda view
;; (setq org-agenda-prefix-format '((agenda . "  %?-2i %t ")
;;                                  (todo . " %i %-12:c")
;;                                  (tags . " %i %-12:c")
;;                                  (search . " %i %-12:c")))

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
   org-modern-star 'fold
   org-modern-label-border 1
   org-modern-list '((?+ . "•")
                     (?- . "•")
                     (?* . "•"))
   org-modern-checkbox '((?X . "󰄵")
                         (?- . "󰛲")
                         (?\s . "󰄱"))))

(setq org-roam-directory (concat org-directory "roam/"))

(setq org-roam-dailies-capture-templates
      '(("d" "default" entry
         "* %?"
         :target (file+head "%<%Y-%m-%d>.org"
                            "#+title: %<%d %B,%Y>\n\n"))))

(setq org-roam-capture-templates
      '(("d" "default" plain "%?" :target
        (file+head "${slug}.org" "#+title: ${title}\n\n") :unnarrowed t)))

(setq org-journal-dir (concat org-directory "journal/")
      org-journal-file-type 'monthly
      org-journal-file-format "%Y-%m.org"
      org-journal-date-format "%A, %d/%m/%Y"
      org-journal-enable-agenda-integration t
      org-journal-file-header "#+title: %B %Y")

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

(load! "abl-mode.el")
(add-to-list 'auto-mode-alist '("\\.typ\\'" . typst-ts-mode))

(setq tab-always-indent 'complete)

(use-package! corfu
  :config
  (setq corfu-border-width 2
        corfu-auto-prefix 1
        corfu-bar-width 1))

(use-package! cape
  :defer 1
  :config
  (add-hook 'completion-at-point-functions #'cape-dabbrev 20) ; words from buffer
  (add-hook 'completion-at-point-functions #'cape-file 20))

;; (use-package rainbow-mode
;;   :hook
;;   ((prog-mode rain)))

(use-package spacious-padding
  :ensure t
  :config
  ;; These are the default values, but I keep them here for visibility.
  ;; Also check `spacious-padding-subtle-frame-lines'.
  (setq spacious-padding-subtle-frame-lines
        '(:mode-line-active link :mode-line-inactive shadow
          :header-line-active link :header-line-inactive shadow)
        spacious-padding-widths
        '( :internal-border-width 20
           :header-line-width 4
           :mode-line-width 8
           :custom-button-width 3
           :tab-width 4
           :right-divider-width 30
           :scroll-bar-width 8
           :fringe-width 0))

  (spacious-padding-mode 1))

(use-package elfeed
  :config
  (setq elfeed-search-feed-face ":foreground #ffffff :weight bold"
        elfeed-feeds (quote
                       (("https://www.reddit.com/r/linux.rss" reddit linux)
                        ("https://www.reddit.com/r/commandline.rss" reddit commandline)
                        ("https://www.reddit.com/r/distrotube.rss" reddit distrotube)
                        ("https://www.reddit.com/r/emacs.rss" reddit emacs)
                        ("https://hackaday.com/blog/feed/" hackaday linux)
                        ("https://opensource.com/feed" opensource linux)
                        ("https://linux.softpedia.com/backend.xml" softpedia linux)
                        ("https://itsfoss.com/feed/" itsfoss linux)
                        ("https://www.zdnet.com/topic/linux/rss.xml" zdnet linux)
                        ("https://www.phoronix.com/rss.php" phoronix linux)
                        ("http://feeds.feedburner.com/d0od" omgubuntu linux)
                        ("https://www.computerworld.com/index.rss" computerworld linux)
                        ("https://www.networkworld.com/category/linux/index.rss" networkworld linux)
                        ("https://www.techrepublic.com/rssfeeds/topic/open-source/" techrepublic linux)
                        ("https://betanews.com/feed" betanews linux)
                        ("http://lxer.com/module/newswire/headlines.rss" lxer linux)
                        ("https://distrowatch.com/news/dwd.xml" distrowatch linux)))))


(use-package elfeed-goodies
  :init
  (elfeed-goodies/setup)
  :config
  (setq elfeed-goodies/entry-pane-size 0.5
        elfeed-goodies/switch-to-entry nil
        elfeed-goodies/powerline-default-separator nil))

(use-package dired-preview
  :ensure t
  :config
  (setq dired-preview-delay 0)
  (setq dired-preview-max-size (expt 2 20))
  (setq dired-preview-ignored-extensions-regexp
        (concat "\\."
                "\\(gz\\|"
                "zst\\|"
                "tar\\|"
                "xz\\|"
                "rar\\|"
                "zip\\|"
                "iso\\|"
                "epub"
                "\\)")))

(map! :leader
      (:prefix ("t" . "toggle")
       :desc "Vterm" "t" #'+vterm/toggle))

(map! :leader
      (:desc "Treemacs" "-" #'+treemacs/toggle))

(map! :map abl-mode-map
      :leader
      (:desc "Previous method" "[" #'abl-backward-proc)
      (:desc "Next method" "]" #'abl-forward-proc)
      :localleader
      (:desc "List all methods" "/" #'abl-occur-procs))
