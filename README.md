# dotfiles

Repository for my personal configuration, otherwise known as dotfiles.

**Requirements**

```
curl
rsync
vim
neovim
bat
fzf
git
delta
gh
jq
ripgrep
fd
htop
ghostty
fish
herdr
tmux
starship
mise (node, pnpm, go)
php (homebrew, shivammathur/php tap)
composer, wp-cli (phars in ~/.local/bin)
rustup (homebrew)
colima
docker
docker-compose
ddev
mkcert
aerospace
```

**Post Installation**

```
mkdir -p ~/.claude ~/.config/{git,fish/conf.d,ghostty,mise,herdr,starship,aerospace,bat,colima/_templates,htop,vim,nvim}
rm -rf ~/.claude/commands

ln -sfn ~/code/personal/dotfiles/.gitconfig ~/.gitconfig
ln -sfn ~/code/personal/dotfiles/git/ignore ~/.config/git/ignore
ln -sfn ~/code/personal/dotfiles/git/allowed_signers ~/.config/git/allowed_signers
ln -sfn ~/code/personal/dotfiles/.editorconfig ~/.editorconfig
ln -sfn ~/code/personal/dotfiles/.claude/CLAUDE.md ~/.claude/CLAUDE.md
ln -sfn ~/code/personal/dotfiles/.claude/settings.json ~/.claude/settings.json
ln -sfn ~/code/personal/dotfiles/.claude/commands ~/.claude/commands
ln -sfn ~/code/personal/dotfiles/fish/config.fish ~/.config/fish/config.fish
ln -sfn ~/code/personal/dotfiles/fish/conf.d/abbr.fish ~/.config/fish/conf.d/abbr.fish
ln -sfn ~/code/personal/dotfiles/fish/fish_plugins ~/.config/fish/fish_plugins
ln -sfn ~/code/personal/dotfiles/ghostty/config ~/.config/ghostty/config
ln -sfn ~/code/personal/dotfiles/mise/config.toml ~/.config/mise/config.toml
ln -sfn ~/code/personal/dotfiles/herdr/config.toml ~/.config/herdr/config.toml
ln -sfn ~/code/personal/dotfiles/starship/starship.toml ~/.config/starship/starship.toml
ln -sfn ~/code/personal/dotfiles/aerospace/aerospace.toml ~/.config/aerospace/aerospace.toml
ln -sfn ~/code/personal/dotfiles/bat/config ~/.config/bat/config
ln -sfn ~/code/personal/dotfiles/colima/default.yaml ~/.config/colima/_templates/default.yaml
ln -sfn ~/code/personal/dotfiles/htop/htoprc ~/.config/htop/htoprc
ln -sfn ~/code/personal/dotfiles/tmux/.tmux.conf ~/.tmux.conf
ln -sfn ~/code/personal/dotfiles/vim/vimrc ~/.config/vim/vimrc
ln -sfn ~/.config/vim/vimrc ~/.config/nvim/init.vim

curl https://mise.run | sh
curl -sL https://raw.githubusercontent.com/jorgebucaran/fisher/main/functions/fisher.fish | source && fisher update
curl -fLo ~/.config/vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
vim +PlugInstall +qall
```

**NeoVIM**

Due to clipboard issues the current `vimrc` file doesn't automatically put the selected text
into the clipboard history. Therefore neovim is the default editor and loads the same `vimrc`
through the `~/.config/nvim/init.vim` symlink, so migrating back to `vim` needs no changes.

**Colima**

The colima config is linked as the template for new profiles. An existing profile keeps its own
`~/.config/colima/default/colima.yaml`; change `cpu` and `memory` there, or recreate the profile
with `colima delete` before the next `colima start`.

**MacOS Specific**

```
# decrease dock animation duration
defaults write com.apple.dock autohide-time-modifier -float 0.25; killall Dock

# remove capslock delay
hidutil property --set '{"CapsLockDelayOverride":0}'

# touch id for sudo
sudo cp /etc/pam.d/sudo_local.template /etc/pam.d/sudo_local
- UNCOMMENT
auth       sufficient     pam_tid.so

# ask for sudo once an hour, shared across terminals
sudo visudo -f /etc/sudoers.d/timeout
- ADD
Defaults timestamp_timeout=60
Defaults timestamp_type=global

# disable .DS_Store on network and usb
defaults write com.apple.desktopservices DSDontWriteNetworkStores -bool true
defaults write com.apple.desktopservices DSDontWriteUSBStores -bool true
```

