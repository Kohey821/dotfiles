# vim keybind

function fish_user_key_bindings
  fish_default_key_bindings -M insert
  fish_vi_key_bindings insert
end

# exa

alias ls='exa --icons'
alias la='ls -alh'
alias lt='ls -T'

# trash-cli

alias rm='trash-put'

# git

alias g='git'

# nvim

alias vi='nvim'
alias vim='nvim'

set -xg EDITOR nvim

# tmux

alias tmux='tmux -2'
alias t='tmux'
alias ta='t attach'
alias td='t detach'
alias tk='t kill-session'

# docker

alias d='docker'
alias dc='docker compose'

# ranger

alias r='ranger'

# less

set -x LESS '-g -i -M -R -W'
set -x PAGER less

set -x LESS_TERMCAP_mb (printf (tput bold; tput setaf 2)) # green
set -x LESS_TERMCAP_md (printf (tput bold; tput setaf 6)) # cyan
set -x LESS_TERMCAP_me (printf (tput sgr0))
set -x LESS_TERMCAP_so (printf (tput bold; tput setaf 3; tput setab 4)) # yellow on blue
set -x LESS_TERMCAP_se (printf (tput rmso; tput sgr0))
set -x LESS_TERMCAP_us (printf (tput smul; tput bold; tput setaf 7)) # white
set -x LESS_TERMCAP_ue (printf (tput rmul; tput sgr0))
set -x LESS_TERMCAP_mr (printf (tput rev))
set -x LESS_TERMCAP_mh (printf (tput dim))
set -x LESS_TERMCAP_ZN (printf (tput ssubm))
set -x LESS_TERMCAP_ZV (printf (tput rsubm))
set -x LESS_TERMCAP_ZO (printf (tput ssupm))
set -x LESS_TERMCAP_ZW (printf (tput rsupm))

# pbcopy & pbpaste

if ! command -v pbcopy &>/dev/null;
  alias pbcopy='xclip -selection clipboard'
end

if ! command -v pbpaste &>/dev/null;
  alias pbpaste='xclip -selection clipboard -o'
end

# brew

eval (/opt/homebrew/bin/brew shellenv)

# asdf

source (brew --prefix asdf)/libexec/asdf.fish

# update & clean

alias brew-update='brew update && brew upgrade'
alias brew-cleanup='brew autoremove && brew cleanup'
alias docker-cleanup='yes | docker system prune'
alias trash-cleanup='yes | trash-empty'
alias uc='brew-update && brew-cleanup && docker-cleanup && trash-cleanup'

