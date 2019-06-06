#!/bin/sh
emacsclient -ca "" --frame-parameters='(quote (name . "global-org-capture"))' -e '(org-capture nil "t")'
