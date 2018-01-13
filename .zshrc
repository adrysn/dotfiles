export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8
export VISUAL="mvim -v"
export EDITOR="$VISUAL"

alias vi="mvim -v"
alias vim="mvim -v"
alias git=hub
alias rg="rg --max-columns 200"

if [ -f ~/.env_local ]; then
  source ~/.env_local
fi

source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"

[ -s "/Users/adrysn/.scm_breeze/scm_breeze.sh" ] && source "/Users/adrysn/.scm_breeze/scm_breeze.sh"

source ~/.iterm2_shell_integration.zsh

export PATH="$HOME/bin:$PATH"

# Node.js
export PATH="$HOME/.npm-packages/bin:$PATH"
export PATH="$PATH:`yarn global bin`"

# pyenv / pyenv-virtualenv
export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"
eval "$(pyenv virtualenv-init -)"

# go
export PATH=$PATH:/usr/local/go/bin:/Users/adrysn/Develop/go/bin
export GOPATH=$HOME/Develop/go

# fzf & ripgrep
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
export FZF_CTRL_T_COMMAND='rg --files --no-ignore --hidden --follow -g "!{.git,node_modules}/*" 2> /dev/null'
