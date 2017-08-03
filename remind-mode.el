;;; remind-mode.el --- major mode for editing Remind files. -*- coding: utf-8; lexical-binding: t; mode: default-generic -*-
;; Copyright Â© 2017, by Christopher R. Brown

;; Author: Christopher R. Brown ( mrlordvondoombraun@gmail.com )
;; Version: 0.0.2
;; Created: 2 AUG 2017
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
   
;;   Please email me at mrlordvondoombraun@gmail.com with comments questions or raise an issue
;;   github.
   
;; TODO
;;   - Comment Highlighting
;;   - Date and Other Non-Keyword Highlighting
;;   - Automagic Indenting
;;   - Export as org file

;;; Code:

;; Use generic-mode as a basis
(require 'generic-x)

(define-generic-mode
    'remind-mode
  '("#")
  '("REM" "UNTIL" "MSG" "WARN" "ONCE")
  '(
    ("MON" . 'font-lock-string-face)
    ("TUE" . 'font-lock-string-face)
    ("WED" . 'font-lock-string-face)
    ("THU" . 'font-lock-string-face)
    ("FRI" . 'font-lock-string-face)
    ("SAT" . 'font-lock-string-face)
    ("SUN" . 'font-lock-string-face)
    ("OMIT" . font-lock-keyword-face)
    ("SET" . font-lock-keyword-face)
    ("FSET" . font-lock-keyword-face)
    ("UNSET" . font-lock-keyword-face)
    ("PRIORITY" . font-lock-type-face)
    ("TAG" . font-lock-type-face)
    ("AT" . font-lock-doc-face)
    ("DURATION" . font-lock-doc-face)
    ("--" . font-lock-doc-face)
    ("*" . font-lock-doc-face)
    ("+" . font-lock-doc-face)
    ("-" . font-lock-doc-face)
    ("SKIP" . font-lock-function-name-face)
    ("BEFORE" . font-lock-function-name-face)
    ("AFTER" . font-lock-function-name-face)
    ("[^ b]" . font-lock-warn-face)
    )
  '("\\.rem$")
  nil
  "A mode for editing REmind files"
  )
  
(require 'remind-mode)

;;; remind-mode ends here.
