# dotfiles

Repository for my personal configuration, otherwise known as dotfiles.

**Requirements**

```
curl
rsync
net-tools
vim (see documentation regarding neovim underneath)
bat
fzf
git
delta
htop
ghostty
fish
herdr
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
ln -sfn ~/code/personal/dotfiles/.gitconfig ~/.gitconfig
ln -sfn ~/code/personal/dotfiles/git/ignore ~/.config/git/ignore
ln -sfn ~/code/personal/dotfiles/.editorconfig ~/.editorconfig
ln -sfn ~/code/personal/dotfiles/.claude/CLAUDE.md ~/.claude/CLAUDE.md
ln -sfn ~/code/personal/dotfiles/.claude/settings.json ~/.claude/settings.json
ln -sfn ~/code/personal/dotfiles/.claude/commands ~/.claude/commands
ln -sfn ~/code/personal/dotfiles/fish/config.fish ~/.config/fish/config.fish
ln -sfn ~/code/personal/dotfiles/fish/conf.d/abbr.fish ~/.config/fish/conf.d/abbr.fish
ln -sfn ~/code/personal/dotfiles/fish/fish_plugins ~/.config/fish/fish_plugins
ln -sfn ~/code/personal/dotfiles/ghostty/config ~/.config/ghostty/config
ln -sfn ~/code/personal/dotfiles/herdr/config.toml ~/.config/herdr/config.toml
ln -sfn ~/code/personal/dotfiles/starship/starship.toml ~/.config/starship/starship.toml
ln -sfn ~/code/personal/dotfiles/aerospace/aerospace.toml ~/.config/aerospace/aerospace.toml
ln -sfn ~/code/personal/dotfiles/bat/config ~/.config/bat/config
ln -sfn ~/code/personal/dotfiles/colima/default.yaml ~/.config/colima/default.yaml
ln -sfn ~/code/personal/dotfiles/htop/htoprc ~/.config/htop/htoprc
ln -sfn ~/code/personal/dotfiles/vim/vimrc ~/.config/vim/vimrc
ln -sfn ~/.config/vim/vimrc ~/.config/nvim/init.vim

fisher update
curl -fLo ~/.config/vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
vim +PlugInstall +qall
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

