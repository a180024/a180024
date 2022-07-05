# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

export PATH="/usr/local/bin:$PATH"
export PATH="/usr/bin/:$PATH"

# Aliases
alias vim="nvim"
alias dev="sh ~/dev-tmux.sh"

# Shortcuts
function gd() {
    preview="git diff $@ --color=always -- {-1}"
    git diff $@ --name-only | fzf -m --ansi --preview $preview
}

# VIM
set -o vi

# Python
export PATH="/Users/davin/Library/Python/3.8/bin:$PATH"

# Node
export PATH="/Users/davin/.nvm/version/v17.3.0/bin/node:$PATH"

# Nvm
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && . "$NVM_DIR/bash_completion"  # This loads nvm bash_completion 

# Homebrew
eval $(/opt/homebrew/bin/brew shellenv)

# Go
export GO111MODULE=auto
export GOPATH=$HOME/go
export PATH=$PATH:$GOROOT/bin:$GOPATH/bin

# GIT Auto-Completion
zstyle ':completion:*:*:git:*' script ~/.git-completion.bash
# `compinit` scans $fpath, so do this before calling it.
fpath=(~/.zsh $fpath)
autoload -Uz compinit && compinit

# Z
if command -v brew >/dev/null 2>&1; then
	#Load rupa's z if installed
 	[ -f $(brew --prefix)/etc/profile.d/z.sh ] && source $(brew --prefix)/etc/profile.d/z.sh
fi
# Path to your oh-my-zsh installation.
export ZSH="/Users/davin/.oh-my-zsh"
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
plugins=(
git
fzf
z
fd
zsh-autosuggestions
)

# Powerlevel10k
ZSH_THEME="powerlevel10k/powerlevel10k"
# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# Syntax-Highlighting
source /opt/homebrew/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

