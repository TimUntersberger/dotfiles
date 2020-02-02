source ~/.antigen.zsh

antigen use oh-my-zsh

antigen bundle git
antigen bundle yarn
antigen bundle tmux
antigen bundle docker
antigen bundle httpie
antigen bundle mafredri/zsh-async
antigen bundle sindresorhus/pure

antigen apply

alias vim=nvim

function sha256() { echo -n $1 | sha256sum | cut -d ' ' -f1 }

export FZF_DEFAULT_COMMAND='ag -g ""'

export XDG_CONFIG_HOME=$HOME/.config

export DISPLAY=$(cat /etc/resolv.conf | grep nameserver | awk '{print $2}'):0

export PATH="/home/tim/.yarn/bin:$PATH"

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

[ -z "$TMUX" ] && tmux
