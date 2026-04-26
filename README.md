# dotfiles

Repository for my personal configuration, otherwise known as dotfiles.

**Requirements**

```
curl
rsync
net-tools
vim (see documentation regarding neovim underneath)
bat
git
delta
htop
ghostty
fish
tmux
starship
php
composer
wp-cli
fnm
pnpm
docker
docker-compose
aerospace
```

**Post Installation**

```
fisher update
vim +PluginInstall +qall
```

**NeoVIM**

Due to clipboard issues the current `vimrc` file doesn't automatically put the selected text
into the clipboard history. Therefore, a symlink has been created and neovim is the default
text editor. However, due to backwards compatability and for the option to easily migrate
back to `vim`, this isn't included in the dotfiles.

**MacOS Specific**

```
# decrease dock animation duration
defaults write com.apple.dock autohide-time-modifier -float 0.25; killall Dock

# remove capslock delay
hidutil property --set '{"CapsLockDelayOverride":0}'

# disable sudo password
sudo visudo
- CHANGE LINE
%admin ALL=(ALL) ALL
- TO 
%admin ALL=(ALL) NOPASSWD: ALL

# disable .DS_Store on network and usb
defaults write com.apple.desktopservices DSDontWriteNetworkStores -bool true
defaults write com.apple.desktopservices DSDontWriteUSBStores -bool true
```

