# load brew
eval "$(/opt/homebrew/bin/brew shellenv)"

if status is-interactive
and not set -q TMUX
    exec tmux
end

function fuck
    set -l last_cmd (history | head -n1 | string trim)

    if test -z "$last_cmd"
        echo "No previous command found."
        return 1
    end

    echo "Running with sudo: $last_cmd"
    eval "sudo $last_cmd"
end
