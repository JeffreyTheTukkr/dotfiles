# hide fish welcome message
set fish_greeting

# init homebrew
eval "$(/opt/homebrew/bin/brew shellenv)"

# init tmux
if status is-interactive
and not set -q TMUX
    exec tmux
end

# init fish
starship init fish | source

# load fnm
fnm env --use-on-cd --shell fish | source

# load pnpm
set -gx PNPM_HOME "/Users/jeffrey/Library/pnpm"
if not string match -q -- $PNPM_HOME $PATH
  set -gx PATH "$PNPM_HOME" $PATH
end

# run last command with sudo
function fuck
    set -l last_cmd (history | head -n1 | string trim)

    if test -z "$last_cmd"
        echo "No previous command found."
        return 1
    end

    echo "> sudo $last_cmd"
    sudo $last_cmd
end
