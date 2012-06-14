emacs_config
============
#Emacs configuration on Linux
##Install
###1. Install emacs on uBuntu 12.04
```
sudo apt-get install emacs ecb cscope-el auto-complete-el yasnippet doxymacs
```
###2. Install auto-complete
Download latest version of auto-complete to a temp folder
```
git clone https://github.com/m2ym/auto-complete.git
```
Go the directory you download the auto complete and install
```
cd auto-complete
make install
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
