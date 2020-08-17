# Set Colors
autoload -U colors
colors

# Set Command Prompts
autoload -Uz vcs_info
precmd() { vcs_info }
zstyle ':vcs_info:git:*' formats '[%b]'
setopt PROMPT_SUBST
PROMPT='%n ${PWD/#$HOME/~} %{$fg[green]%}${vcs_info_msg_0_}%{$fg[white]%} 🦄 > '

# Set Env Vars
export VAR="..."

# Set Alias
alias zedit="vim ~/.zshrc"

# Set Alias: Git
alias ga="git add"
alias gcm="git commit -m"
alias gco="git checkout"
alias gp="git push"
alias gs="git status"

# Set Alias: Docker
alias dimage="docker images"
alias dimage_rm="docker images | awk '{if(NR>1) print $3}' | xargs docker rmi -f"
alias dproc="docker_ps"
alias dpall="docker_ps -a"
alias dstart="docker start"
alias dstop="docker stop"

# Set Alias: Go
alias goland="/usr/local/bin/goland"

# Set Docker Functions

function dexec {
  docker exec -it $1 /bin/bash
}

function docker_ps {
  while :
  do
    clear
    docker ps $1
    sleep 5
  done
}

# Set Node Version Manager
# export NVM_DIR="$HOME/.nvm"
# [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
