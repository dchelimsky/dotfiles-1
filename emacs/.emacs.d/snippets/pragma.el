# -*- mode: snippet -*-
# name: long comment
# key: ---
# type: command
# --
(yas-expand-snippet
 (format
   ";; ——— $1 ${1:$(make-string (- 72 %d (length yas-text)) ?—)}$0"
     (current-column)))
