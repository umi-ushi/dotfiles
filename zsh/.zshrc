# Activate My bin
export PATH=$PATH:$HOME/bin

# Sheldon
export SHELDON_CONFIG_DIR=$XDG_CONFIG_HOME/zsh/sheldon
eval "$(sheldon source)"

# Go Dev
export GOPATH=$HOME/go
export PATH=$GOPATH/bin:$PATH

# open idea which selected from under ghq repository list
function idea_ghq_repo() {
  local repo_path
  repo_path=$(ghq list -p | fzf)

  if [[ -n "$repo_path" ]]; then
    idea "$repo_path" || return 1
  else
    echo "No repository selected."
    return 1
  fi
}
zle -N idea_ghq_repo
bindkey '^O^P' idea_ghq_repo