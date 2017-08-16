;;; remind-mode.el --- major mode for editing Remind files. -*- coding: utf-8; lexical-binding: t; mode: default-generic -*-
;; Copyright Â© 2017, by Christopher R. Brown

;; Author: Christopher R. Brown ( mrlordvondoombraun@gmail.com )
;; Version: 0.0.2
;; Created: 16 AUG 2017
;; Keywords: major-mode, remind, reminder, calendar, cli, command-line 
;; Homepage: teamawesome3.dlinkddns.com

;;; License:

;;  This file is not part of GNU Emacs. This program is free software- 
;;  you can redistribute it and/or modify
;;  it under the terms of the GNU General Public License as published by
;;  the Free Software Foundation, either version 3 of the License, or
;;  (at your option) any later version.

;;    This program is distributed in the hope that it will be useful,
;;    but WITHOUT ANY WARRANTY; without even the implied warranty of
;;    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
;;    GNU General Public License for more details.

;;    You should have received a copy of the GNU General Public License
;;    along with this program.  If not, see <http://www.gnu.org/licenses/>.
    
;;; Commentary:

;; This is essentially a port of the Vim Syntax File distributed with the 
;;   Remind software as authored by Davide Alberani (18 September 2009).
;;   I also leaned heavily on the guidance provided by Xah Lee in the How to
;;   Write a[n] Emacs Major Mode tutorials found at 
;;   http://ergoemacs.org/emacs/elisp_syntax_coloring.html (25 Oct 2016). Both of
;;   their efforts are greatly appreciated.

;;   This version is built using generic-mode.

;;   Currently, this major-mode includes syntax highlighting for most commands and features.
;;   To use, download into a location on your PATH (such as ~/.emacs.d/elpa or/usr/local/bin).
;;   If you are not what sure is on your PATH, then type "echo $PATH" at the terminal and pick
;;   one of the listed locations. You can also add a file to the PATH by typing 
;;   "export PATH=$PATH:/path/to/file/" where /path/to/file is the absolute file path of your
;;   choosing. Also, add "(add-to-list 'load-path "/path/to/file/)" and "(require 'remind-mode)"
;;   to your .emacs file or other intitialization document.

;;   Please note that reind-mode only supports syntax highlighting for three letter, capitalized
;;   abbreviations of months and days.

;;   Please email me at mrlordvondoombraun@gmail.com with comments questions or raise an issue
;;   github.
   
;; TODO
;;   - Numerical Date and Other Non-Keyword Highlighting
;;   - Support Highlighting for Scripts
;;   - Export/Import as org file
;;   - Include Highlighting for Use of Non-Abbreviated Month and Day
;;   - Differentiate Use of Keywords in MSG so They do Not Highlight.

;;; Code:

;; Use generic-mode as a basis
(require 'generic-x)
(require 'highlight-numbers)

(highlight-numbers-mode t)

(define-generic-mode
    'remind-mode
  '("#")
  '("REM" "OMIT" "SET" "FSET" "UNSET")
  '(
    ("SATISFY" . 'font-lock-type-face)
    ("[m|M][o|O][n|N]" . 'font-lock-string-face)
    ("TUE" . 'font-lock-string-face)
    ("WED" . 'font-lock-string-face)
    ("THU" . 'font-lock-string-face)
    ("FRI" . 'font-lock-string-face)
    ("SAT" . 'font-lock-string-face)
    ("SUN" . 'font-lock-string-face)
    ("AUG" . 'font-lock-string-face)
    ("JAN" . 'font-lock-string-face)
    ("FEB" . 'font-lock-string-face)
    ("MAR" . 'font-lock-string-face)
    ("APR" . 'font-lock-string-face)
    ("MAY" . 'font-lock-string-face)
    ("JUN" . 'font-lock-string-face)
    ("JUL" . 'font-lock-string-face)
    ("SEP" . 'font-lock-string-face)
    ("OCT" . 'font-lock-string-face)
    ("NOV" . 'font-lock-string-face)
    ("DEC" . 'font-lock-string-face)
    ("UNTIL" . 'font-lock-keyword-face)
    ("FROM" . 'font-lock-keyword-face)
    ("SCANFROM" . 'font-lock-keyword-face)
    ("SCAN" . 'font-lock-keyword-face)
    ("WARN" . 'font-lock-warning-face)
    ("SCHED" . 'font-lock-keyword-face)
    ("THROUGH" . 'font-lock-function-name-face)
    ("SET" . 'font-lock-keyword-face)
    ("FSET" . 'font-lock-keyword-face)
    ("UNSET" . 'font-lock-keyword-face)
    ("PRIORITY" . 'font-lock-type-face)
    ("TAG" . 'font-lock-type-face)
    ("AT" . 'font-lock-doc-face)
    ("DURATION" . 'font-lock-doc-face)
    ("--" . 'font-lock-doc-face)
    ("*" . 'font-lock-doc-face)
    ("+" . 'font-lock-doc-face)
    ("-" . 'font-lock-doc-face)
    ("SKIP" . 'font-lock-function-name-face)
    ("BEFORE" . 'font-lock-function-name-face)
    ("AFTER" . 'font-lock-function-name-face)
    ("%b[.|\\n| ]" . 'font-lock-warning-face)
    ("ONCE" . 'font-lock-variable-name-face)
    ("INCLUDE" . 'font-lock-variable-name-face)
    ("INC" . 'font-lock-variable-name-face)
    ("BANNER" . 'font-lock-variable-name-face)
    ("PUSH" . 'font-lock-variable-string-face)
    ("CONTEXT" . 'font-lock-keyword-face)
    ("CLEAR" . 'font-lock-warning-face)
    ("POP" . 'font-lock-doc-face)
    ("COLOR" . 'font-lock-function-name-face)
    ("COLOUR" . 'font-lock-function-name-face)
    ("MSG" . 'font-lock-keyword-face)
    ("MSF" . 'font-lock-variable-name-face)
    ("RUN" . 'font-lock-warning-face)
    ("CAL" . 'font-lock-type-face)
    ("SPECIAL" . 'font-lock-variable-name-face)
    ("PS" . 'font-lock-function-name-face)
    ("PSFILE" . 'font-lock-function-name-face)
    ("SHADE" . 'font-lock-variable-name-face)
    ("MOON" . 'font-lock-doc-face)
    ("IF" . 'font-lock-variable-name-face)
    ("ELSE" . 'font-lock-variable-name-face)
    ("ENDIF" . 'font-lock-variable-name-face)
    ("IFTRIG" . 'font-lock-variable-name-face)
    ("#.*$" . 'font-lock-warning-face)
    ("[0-9]" . 'font-lock-warning-face)
    )
  '("\\.rem$")
  nil
  "A mode for editing Remind files"
  )
