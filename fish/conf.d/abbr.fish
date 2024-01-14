# basic
abbr -a c clear
abbr -a h history
abbr -a e exit

# dnf
abbr -a sdu sudo dnf update --refresh
abbr -a sdr sudo dnf autoremove

# various
abbr -a npp pnpm
abbr -a nv nvim

# git
abbr -a gs git status
abbr -a gd git diff
abbr -a gr git restore
abbr -a ga git add
abbr -a gcm git commit -m
abbr -a gp git push
abbr -a grh git reset HEAD~1

# docker
abbr -a d docker
abbr -a dl docker logs
abbr -a dp docker ps
abbr -a dpa docker ps --all
abbr -a dc docker compose
abbr -a dcu docker compose up
abbr -a dcd docker compose up -d

# podman
abbr -a p podman
abbr -a pl podman logs
abbr -a pp podman ps
abbr -a ppa podman ps --all
abbr -a pc podman-compose
abbr -a pcu podman-compose up
abbr -a pcp podman-compose up -d
