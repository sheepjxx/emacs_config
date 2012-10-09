#Emacs configuration on Linux
##Install
###1. Install emacs on uBuntu 12.04
```
sudo apt-get install git git-svn gitk qgit emacs ecb cscope-el auto-complete-el git-el yasnippet exuberant-ctags doxymacs
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
###4. exuberant-ctags configuration
```
sudo update-alternatives --install "/usr/bin/ctags" "ctags" "/usr/bin/ctags-exuberant" 1
sudo update-alternatives --install "/usr/bin/etags" "etags" "/usr/bin/ctags-exuberant" 1 
sudo update-alternatives --config ctags
sudo update-alternatives --config etags
```
Using ctags-exuberant as ctags and etags generation programme
##Note
```
2012-10-09 add keybind for switching buffer as C-<pause> and M-<pause> for "previous-buffer" and "next-buffer" respectively". But I think this is easy for my HHKB keyboard.
```
