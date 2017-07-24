;;; remind-mode.el --- major mode for editing Remind files. -*- coding: utf-8; lexical-binding: t; -*-

;; Copyright © 2017, by Christopher R. Brown

;; Author: Christopher R. Brown ( mrlordvondoombraun@gmail.com )
;; Version: 0.0.1
;; Created: 17 JUN 2017
;; Keywords: major-mode, remind, reminder, calendar, cli, command-line 
;; Homepage: teamawesome3.dlinkddns.com

;;; License:

;;  This file is not part of GNU Emacs. This program is free software: 
    you can redistribute it and/or modify
    it under the terms of the GNU General Public License as published by
    the Free Software Foundation, either version 3 of the License, or
    (at your option) any later version.

    This program is distributed in the hope that it will be useful,
    but WITHOUT ANY WARRANTY; without even the implied warranty of
    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
    GNU General Public License for more details.

    You should have received a copy of the GNU General Public License
    along with this program.  If not, see <http://www.gnu.org/licenses/>.
    
;;; Commentary:

;; This is essentially a port of the Vim Syntax File distributed with the 
   Remind software as authored by Davide Alberani (18 September 2009).
   I also leaned heavily on the guidance provided by Xah Lee in the How to
   Write a[n] Emacs Major Mode tutorials found at 
   http://ergoemacs.org/emacs/elisp_syntax_coloring.html (25 Oct 2016). Both of
   their efforts are greatly appreciated.
   
   Currently, this major-mode includes syntax highlighting for most commands and features.
   To use, download into a location on your PATH (such as ~/.emacs.d/elpa or/usr/local/bin).
   If you are not what sure is on your PATH, then type "echo $PATH" at the terminal and pick
   one of the listed locations. You can also add a file to the PATH by typing 
   "export PATH=$PATH:/path/to/file/" where /path/to/file is the absolute file path of your
   choosing. Also, add "(add-to-list 'load-path "/path/to/file/)" and "(require 'remind-mode)"
   to your .emacs file or other intitialization document.
   
   Please email me at mrlordvondoombraun@gmail.com with comments questions or raise an issue
   github.
   
;; TODO
   - Comment Highlighting
   - Date and Other Non-Keyword Highlighting
   - Automagic Indenting
   - Export as org file

;;; Code:

(require 'highlight-numbers)
(require 'highlight-escape-sequences)

;;; Syntax Highlighing:
(font-lock-mode t)

;; Define Variables
(defvar rem-font-lock-keywords nil "first element for 'font-lock-defaults'")

;; Update Syntax Table to recognize comment delimiters
(defvar rem-syntax-table
  (let ((synTable (make-syntax-table text-mode-syntax-table)))
	(modify-syntax-entry ?\# "<" synTable)
	(modify-syntax-entry ?\n ">" synTable)
	synTable)
  "Syntax table in use in 'remind-mode' buffers.")

;; Keyword Categories
(setq rem-cmd '("REM" "OMIT" "SET" "FSET" "UNSET"))
(setq rem-exp '("UNTIL" "FROM" "SCANFROM" "SCAN" "WARN" "SCHED" "THROUGH"))
(setq rem-tag '("PRIORITY" "TAG"))
(setq rem-tim '("AT" "DURATION" "--" "*" "+" "-"))
(setq rem-mov '("ONCE" "SKIP" "BEFORE" "AFTER"))
(setq rem-spe '("INCLUDE" "INC" "BANNER" "PUSH-OMIT-CONTEXT" "PUSH" "CLEAR-OMIT-CONTEXT" "CLEAR" "POP-OMIT-CONTEXT" "POP" "COLOR" "COLOUR"))
(setq rem-run '("MSG" "MSF" "RUN" "CAL" "SATISFY" "SPECIAL" "PS" "PSFILE" "SHADE" "MOON"))
(setq rem-con '("IF" "ELSE" "ENDIF" "IFTRIG"))
(setq rem-day '("Mon" "MON" "Monday" "Tue" "TUE" "Tuesday" "Wed" "WED" "Wednesday" "Thu" "THU" "Thursday" "Fri" "FRI" "Friday" "Sat" "SAT" "Saturday" "Sun" "SUN" "Sunday"))
(setq rem-var '("\$[_a-zA-Z][_a-zA-Z0-9]*"))
(setq rem-sub '("%[^ ]"))
(setq rem-adv '("\(\*\|+\|-\|++\|--\)[0-9]\+"))
(setq rem-dat '("[/:@\.-]" "[0-9]\{1,2}[:\.][0-9]\{1,2}" "'[0-9]\{4}[/-][0-9]\{1,2}[/-][0-9]\{1,2}\(@[0-9]\{1,2}[:\.][0-9]\{1,2}\)\?'"))	    
(setq rem-com '("#.*$"))

;; Generate REGEX Strings
(setq rem-day-regexp (regexp-opt rem-day 'words))
(setq rem-var-regexp (regexp-opt rem-var 'words))
(setq rem-sub-regexp (regexp-opt rem-sub 'words))
(setq rem-adv-regexp (regexp-opt rem-adv 'words))
(setq rem-dat-regexp (regexp-opt rem-dat 'words))
(setq rem-cmd-regexp (regexp-opt rem-cmd 'words))
(setq rem-exp-regexp (regexp-opt rem-exp 'words))
(setq rem-tag-regexp (regexp-opt rem-tag 'words))
(setq rem-tim-regexp (regexp-opt rem-tag 'words))
(setq rem-mov-regexp (regexp-opt rem-mov 'words))
(setq rem-spe-regexp (regexp-opt rem-spe 'words))
(setq rem-run-regexp (regexp-opt rem-run 'words))
(setq rem-con-regexp (regexp-opt rem-con 'words))
(setq rem-com-regexp (regexp-opt rem-com 'words))

;; Font Locking
;; each category of keyword is given a particular face
(setq rem-font-lock-keywords
 `(
	(,rem-day-regexp . font-lock-string-face)
	(,rem-var-regexp . font-lock-variable-name-face)
	(,rem-sub-regexp . font-lock-type-face)
	(,rem-adv-regexp . font-lock-string-face)
	(,rem-dat-regexp . font-lock-string-face)
	(,rem-exp-regexp . font-lock-warning-face)
        (,rem-tag-regexp . font-lock-type-face)
        (,rem-tim-regexp . font-lock-constant-face)
        (,rem-mov-regexp . font-lock-builtin-face)
        (,rem-cmd-regexp . font-lock-keyword-face)
        (,rem-spe-regexp . font-lock-doc-face)
        (,rem-run-regexp . font-lock-function-name-face)
        (,rem-con-regexp . font-lock-variable-name-face)
	(,rem-com-regexp . font-lock-comment-face)
        ;; note: order above matters, because once colored, that part won't change.
        ;; in general, longer words first
        ))

;;;###autoload
(define-derived-mode remind-mode text-mode "Remind Mode"
  "A major mode for editing Remind files"
  (setq font-lock-defaults '(rem-font-lock-keywords t t nil nil))
  (setq-local comment-start "#")

;; add the mode to the `features' list
(provide 'remind-mode))

;;; remind-mode.el ends here
