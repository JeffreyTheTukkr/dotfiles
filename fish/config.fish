# init starship
starship init fish | source

# init fnm
set PATH "/home/jeff/.local/share/fnm" $PATH
fnm env | source

# init tmux
# commands to run in interactive sessions
if status is-interactive
	and not set -q TMUX
	exec tmux
end

# setup pnpm
set -gx PNPM_HOME "/home/jeff/.local/share/pnpm"
if not string match -q -- $PNPM_HOME $PATH
  set -gx PATH "$PNPM_HOME" $PATH
end

# fix unknown locale issue
set -Ux LC_ALL C.UTF-8
