export ZSH="$HOME/.oh-my-zsh"

ZSH_THEME="robbyrussell"
HYPHEN_INSENSITIVE="true"
ENABLE_CORRECTION="true"

plugins=(copyfile git z zsh-autosuggestions zsh-nvm zsh-syntax-highlighting zsh-history-substring-search)

source $ZSH/oh-my-zsh.sh

eval "$(starship init zsh)"

path=("/home/lspreitzer/.local/share/bob/nvim-bin" $path)
path=("/home/lspreitzer/.cargo/bin" $path)
path=("/usr/lib/jvm/default/bin" $path)

export PATH

bindkey "$terminfo[kcuu1]" history-substring-search-up
bindkey "$terminfo[kcud1]" history-substring-search-down

nvm use 22 > /dev/null
