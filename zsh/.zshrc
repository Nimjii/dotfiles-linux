export ZSH="$HOME/.oh-my-zsh"

ZSH_THEME="robbyrussell"
HYPHEN_INSENSITIVE="true"
ENABLE_CORRECTION="true"

plugins=(copyfile git z zsh-autosuggestions zsh-syntax-highlighting zsh-history-substring-search)

source $ZSH/oh-my-zsh.sh

eval "$(starship init zsh)"

bindkey "$terminfo[kcuu1]" history-substring-search-up
bindkey "$terminfo[kcud1]" history-substring-search-down
