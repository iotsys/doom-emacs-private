;;; app/calendar/config.el -*- lexical-binding: t; -*-

;; Google Calendar
    (def-package! org-gcal
      :config
      (setq org-gcal-client-id (+pass-get-user "org/google"),
            org-gcal-client-secret (+pass-get-secret "org/google"),
            org-gcal-file-alist '(("edmund.a.miller@gmail.com" .  "~/Dropbox/orgfiles/gcal.org") ;; Edmund Miller
                                  ("buvuk4b1vjghore8gsq6ifbcnk@group.calendar.google.com" .  "~/Dropbox/orgfiles/Lab_schedule.org") ;; Functional Genomics
                                  ("sgv1ng3qi5erm89f227h4hm02s@group.calendar.google.com" .  "~/Dropbox/orgfiles/schedule.org"))) ;; Org

      (add-hook 'org-agenda-mode-hook (lambda () (org-gcal-sync) ))
      (add-hook 'org-capture-after-finalize-hook (lambda () (org-gcal-sync) ))
    )
