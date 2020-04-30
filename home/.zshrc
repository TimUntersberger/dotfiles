source ~/.antigen.zsh

antigen use oh-my-zsh

antigen bundle git
antigen bundle yarn
antigen bundle tmux
antigen bundle docker
antigen bundle httpie
antigen bundle mafredri/zsh-async
#antigen bundle sindresorhus/pure
antigen bundle zsh-users/zsh-autosuggestions
antigen bundle subnixr/minimal

antigen apply

alias vim=nvim
alias dc=docker-compose

function sha256() { echo -n $1 | sha256sum | cut -d ' ' -f1 }

export FZF_DEFAULT_COMMAND='ag -g ""'

export XDG_CONFIG_HOME=$HOME/.config

export TERM="xterm-256color"

export PATH="/home/tim/.yarn/bin:$PATH"

export JAVA_HOME="~/.sdkman/candidates/java/current"

export EDITOR=nvim

precmd() { pwd > /tmp/whereami }

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

[ -f $HOME/.cargo/env ] && source $HOME/.cargo/env

function loadEspIdf() {
  export IDF_PATH=~/esp/esp-idf
  . $HOME/esp/esp-idf/export.sh
}

#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR="/home/tim/.sdkman"
[[ -s "/home/tim/.sdkman/bin/sdkman-init.sh" ]] && source "/home/tim/.sdkman/bin/sdkman-init.sh"

export TERM=xterm-256color
