# hide fish welcome message
set fish_greeting

# set colima config directory
set -gx COLIMA_HOME ~/.config/colima

# init homebrew
eval "$(/opt/homebrew/bin/brew shellenv)"

# init fish
if status is-interactive
    set -x STARSHIP_CONFIG ~/.config/starship/starship.toml
    starship init fish | source
end

# fix psql issue
fish_add_path /opt/homebrew/opt/postgresql/bin
fish_add_path /opt/homebrew/opt/rustup/bin ~/.cargo/bin

~/.local/bin/mise activate fish | source # added by https://mise.run/fish
