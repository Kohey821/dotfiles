alias ..='cd ..'


if which exa &> /dev/null; then
  alias ls='exa'
fi
alias l='ls -CF'
alias la='ls -A'
alias ll='ls -alFh'


if which trash-put &> /dev/null; then
  alias rm='trash-put'
fi


alias g='git'


if which nvim &> /dev/null; then
  alias vi='nvim'
  alias vim='nvim'

  export EDITOR=nvim
else
  alias vi='vim'
  alias vim='vim'

  export EDITOR=vim
fi


if which tmux &> /dev/null; then
  alias tmux='tmux -2'
  alias t='tmux'
  alias ta='t attach'
  alias td='t detach'
  alias tl='t ls'
  alias tn='t new -As'
fi


alias d='docker'
alias dc='docker-compose'


if which ruby >/dev/null && which gem >/dev/null; then
  PATH="$(ruby -r rubygems -e 'puts Gem.user_dir')/bin:$PATH"
fi
