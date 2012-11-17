#Emacs configuration on Linux
##Install Guid
This guide is only for uBuntu 12.04 version, haven't been test on other OS. emacs "ecb" can not be installed using apt-get. 
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
###4. exuberant-ctags configuration
```
sudo update-alternatives --install "/usr/bin/ctags" "ctags" "/usr/bin/ctags-exuberant" 1
sudo update-alternatives --install "/usr/bin/etags" "etags" "/usr/bin/ctags-exuberant" 1 
sudo update-alternatives --config ctags
sudo update-alternatives --config etags
```
###5. Copy all lisp files under lisp folder to /usr/share/emacs/site-lisp/
```
sudo cp -rf lisp /us/share/emacs/site-lisp/
```
###6. Install packages from package management ELPA
For emacs version smaller than 23, you need to copy package.el under list to /usr/share/emacs/sit-lisp, emacs24 already has package.el buildin
```
M-x list-packages
```
Install ace-jump-mode 

#Install and config other useful tools 
###1. zsh (Awesome shell for Linux developer)
```
sudo apt-get install zsh
```
Instatll configuration from https://github.com/robbyrussell/oh-my-zsh
```
chsh -s /bin/zsh
```
Using "chsh" command to change zsh to default shell
Modify ~/.zshrc file(ZSH_THEME parameter), change theme to one you love. I use "pygmalion" to create my theme which is stored in zsh folder.

###2. config git for convenient
```
git config --global user.name "John Doe"
git config --global user.email johndoe@example.com
git config --global core.editor emacs
git config --global alias.lg log --stat --graph --pretty=format:'%Cred%h%Creset by %an -%C(yellow)%d%Creset %s %Cgreen(%cr)%Creset' --abbrev-commit --date=relative
git config --global alias.ci commit
git config --global alias.co checkout
git config --global alias.br branch
```

#Useful packages for developemnt
```
sudo apt-get install tree rpm rar unrar ssh curl freemind subversion
```
#Useful packages for Embedded Linux developemnt
```
sudo apt-get install tftp tftpd nfs-kernel-server xinetd portmap libncurses5-dev openjdk-7-jre minicom linux      
```
##Note
```
2012-10-09 add keybind for switching buffer as C-<pause> and M-<pause> for "previous-buffer" and "next-buffer" respectively". But I think this is easy for my HHKB keyboard.
2012-10-12 add zsh configuration;ediff,emerge config
```
