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

export PATH="/home/tim/.yarn/bin:$PATH"

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR="/home/tim/.sdkman"
[[ -s "/home/tim/.sdkman/bin/sdkman-init.sh" ]] && source "/home/tim/.sdkman/bin/sdkman-init.sh"

[ -z "$TMUX" ] && tmux

export TERM=xterm-256color
