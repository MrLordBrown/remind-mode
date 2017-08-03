# remind-mode
EMACS Major-Mode for Editing Remind Files.
## Commentary   
   This is essentially a port of the _Vim Syntax File_ distributed with the 
   Remind software as authored by Davide Alberani (18 September 2009).
   I also leaned on the guidance provided by Xah Lee in the _How to
   Write a[n] Emacs Major Mode_ tutorials found at 
   http://ergoemacs.org/emacs/elisp_syntax_coloring.html (25 Oct 2016), the 
   EmacsWiki _Mode Tutorial_ prepared by Scott Andrew Borton (14 MAY 2013), 
   and the EmacsWiki _Generic Mode_ discussion prepared by gonbei (26 FEB 2015).
   Their efforts are greatly appreciated. This mode is derived from `generic-mode`
   considering the simplicity of the syntax matches well with such a solution.
 ## Usage
   Currently, this major-mode includes syntax highlighting for the more common commands 
   and features and nwo includes comment highlighting. To use, download into a location 
   on your PATH (such as ~/.emacs.d/elpa or/usr/local/bin).
   If you are not what sure is on your PATH, then type `echo $PATH` at the terminal and pick
   one of the listed locations. You can also add a file to the PATH by typing 
   `export PATH=$PATH:/path/to/file/` where `/path/to/file` is the absolute file path of your
   choosing. Also, add `(add-to-list 'load-path "/path/to/file/)` and `(require 'remind-mode)`
   to your .emacs file or other intitialization document. For the latest, simpler iteration 
   `generic-x` is also required. 
   
   Please email me at mrlordvondoombraun@gmail.com with comments questions or raise an issue
   on github, they are very much welcome.
## TODO
   - ~~Comment Highlighting~~
   - Date and Other Non-Keyword Highlighting
   - Automagic Indenting
   - Export as org file
