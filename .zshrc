# Path to your Oh My Zsh installation.
export ZSH="$HOME/.oh-my-zsh"

source $ZSH/oh-my-zsh.sh

# ==== PLUGINS ====
plugins=(git zsh-autosuggestions)

# ==== ALIASES ====
alias website="cd ~/dev/lovelystay/website"
alias lovelystay="cd ~/dev/lovelystay/react"
alias lovelystay1="cd ~/dev/lovelystay/dev1"
alias cms-website="cd ~/dev/lovelystay/cms-website"
alias drop-db-1="psql -c 'DROP DATABASE optylon;'"
alias drop-db-2="psql -c 'DROP DATABASE optylon_dev1;'"
alias create-db-1="psql -c 'CREATE DATABASE optylon WITH TEMPLATE base STRATEGY FILE_COPY;'"
alias create-db-2="psql -c 'CREATE DATABASE optylon_dev1 WITH TEMPLATE base STRATEGY FILE_COPY;'"

# ==== EVERYTHING ELSE ====
source /opt/homebrew/opt/spaceship/spaceship.zsh
source /opt/homebrew/share/zsh-autosuggestions/zsh-autosuggestions.zsh

SPACESHIP_NODE_SHOW=false
SPACESHIP_PACKAGE_SHOW=false

# Source - https://stackoverflow.com/a
# Posted by nullify0844, modified by community. See post 'Timeline' for change history
# Retrieved 2026-01-05, License - CC BY-SA 4.0

export PATH="$PATH:/Applications/Visual Studio Code.app/Contents/Resources/app/bin"

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# place this after nvm initialization!
autoload -U add-zsh-hook

load-nvmrc() {
  local nvmrc_path
  nvmrc_path="$(nvm_find_nvmrc)"

  if [ -n "$nvmrc_path" ]; then
    local nvmrc_node_version
    nvmrc_node_version=$(nvm version "$(cat "${nvmrc_path}")")

    if [ "$nvmrc_node_version" = "N/A" ]; then
      nvm install
    elif [ "$nvmrc_node_version" != "$(nvm version)" ]; then
      nvm use
    fi
  elif [ -n "$(PWD=$OLDPWD nvm_find_nvmrc)" ] && [ "$(nvm version)" != "$(nvm version default)" ]; then
    echo "Reverting to nvm default version"
    nvm use default
  fi
}

add-zsh-hook chpwd load-nvmrc
load-nvmrc
export PATH="/opt/homebrew/opt/postgresql@15/bin:$PATH"
source /opt/homebrew/opt/spaceship/spaceship.zsh
export PATH="/opt/homebrew/opt/redis@6.2/bin:$PATH"

# Added by Antigravity
export PATH="/Users/luanpanno/.antigravity/antigravity/bin:$PATH"
