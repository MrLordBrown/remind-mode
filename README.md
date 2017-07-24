# remind-mode
EMACS Major-Mode for Editing Remind Files.
## Commentary   
   This is essentially a port of the Vim Syntax File distributed with the 
   Remind software as authored by Davide Alberani (18 September 2009).
   I also leaned heavily on the guidance provided by Xah Lee in the How to
   Write a[n] Emacs Major Mode tutorials found at 
   http://ergoemacs.org/emacs/elisp_syntax_coloring.html (25 Oct 2016). Both of
   their efforts are greatly appreciated.
 ## Usage
   Currently, this major-mode includes syntax highlighting for most commands and features.
   To use, download into a location on your PATH (such as ~/.emacs.d/elpa or/usr/local/bin).
   If you are not what sure is on your PATH, then type "echo $PATH" at the terminal and pick
   one of the listed locations. You can also add a file to the PATH by typing 
   "export PATH=$PATH:/path/to/file/" where /path/to/file is the absolute file path of your
   choosing. Also, add "(add-to-list 'load-path "/path/to/file/)" and "(require 'remind-mode)"
   to your .emacs file or other intitialization document.
   
   Please email me at mrlordvondoombraun@gmail.com with comments questions or raise an issue
   github.
## TODO
   - Comment Highlighting
   - Date and Other Non-Keyword Highlighting
   - Automagic Indenting
   - Export as org file
