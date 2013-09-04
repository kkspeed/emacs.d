emacs.d
-------
Bruce Li's Emacs configuration backup. 

Tweak the configuration file as you need :)
-------------------------------------------
The init.el includes features from other files. By commenting them out, you can
enable/disable features that are not used.

Variables to be configured(Scheduled to be split from package configurations)
----------------------------------------------------------------------------
1. Inside init-eclim.el:
    (setq eclim-executable "~/.eclipse/99815505_linux_gtk_x86/eclim")
   set elim to your proper executables
2. Inside init-latex.el:
    (setq TeX-engine "xetex")
    (setq LaTeX-command "xelatex")

   Choose the proper latex command on your system.

Other remarks
-------------
* Efficiency
   Remember to byte-compile elisp files(Probably I should write a Makefile?) 
   whenever there is a Makefile inside a directory or the file is a single file. It
   would speed up Emacs initialization
