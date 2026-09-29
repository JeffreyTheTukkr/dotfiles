# hide fish welcome message
set fish_greeting

# set colima config directory
set -gx COLIMA_HOME ~/.config/colima

# init homebrew
eval "$(/opt/homebrew/bin/brew shellenv)"

# init fish
set -x STARSHIP_CONFIG ~/.config/starship/starship.toml
starship init fish | source

# load fnm
fnm env --use-on-cd --shell fish | source

# load pnpm
set -gx PNPM_HOME "/Users/jeffrey/Library/pnpm"
if not string match -q -- $PNPM_HOME $PATH
  set -gx PATH "$PNPM_HOME" $PATH
end

# fix psql issue
fish_add_path /opt/homebrew/opt/postgresql/bin

~/.local/bin/mise activate fish | source # added by https://mise.run/fish

