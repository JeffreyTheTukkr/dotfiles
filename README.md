# dotfiles

Repository for my personal configuration, otherwise known as dotfiles.

**Requirements**

```
curl
rsync
net-tools
vim
git
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

**MacOS Specific**

```
# decrease dock animation duration
defaults write com.apple.dock autohide-time-modifier -float 0.25; killall Dock

# remove capslock delay
hidutil property --set '{"CapsLockDelayOverride":0}'
```

