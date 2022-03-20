alias sudo='sudo '


function fish_user_key_bindings
  fish_default_key_bindings -M insert
  fish_vi_key_bindings insert
end


if which exa &> /dev/null
  alias ls='exa'
end
alias l='ls -CF'
alias la='ls -a'
alias ll='ls -alFh'


alias rm='trash-put'


alias g='git'


if which nvim &> /dev/null
  alias vi='nvim'
  alias vim='nvim'

  set -xg EDITOR nvim
else
  alias vi='vim'
  alias vim='vim'

  set -xg EDITOR vim
end


alias tmux='tmux -2'
alias t='tmux'
alias ta='t attach'
alias td='t detach'
alias tl='t ls'
alias tn='t new -As'
alias tk='t kill-session'


alias d='docker'
alias dc='docker-compose'


if which ranger &> /dev/null
  alias r='ranger'
end


if which ruby &> /dev/null && which gem &> /dev/null
  fish_add_path -g (ruby -r rubygems -e 'puts Gem.user_dir')/bin
end
