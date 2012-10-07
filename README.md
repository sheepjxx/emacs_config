#Emacs configuration on Linux
##Install
###1. Install emacs on uBuntu 12.04
```
sudo apt-get install git git-svn gitk qgit emacs ecb cscope-el auto-complete-el git-el yasnippet doxymacs
```

select the path of your emacs. Normally I install to /usr/share/emacs/site-lisp/. This is default directory that emacs search.
###2. Download emacs configuration
```
git clone https://github.com/sheepjxx/emacs_config.git
```
###3. Copy as default configuration
```
cp emacs_config ~/.emacs
```
#Useful packages for developemnt
```
sudo apt-get install tree
```

##Note
```
2012-10-09 add keybind for switching buffer as C-<pause> and M-<pause> for "previous-buffer" and "next-buffer" respectively". But I think this is easy for my HHKB keyboard.
```
