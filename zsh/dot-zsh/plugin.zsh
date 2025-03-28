# Check if zplug is installed
if [[ ! -d ~/.zplug ]]; then
  git clone https://github.com/zplug/zplug ~/.zplug
  source ~/.zplug/init.zsh && zplug update --self
fi

source ~/.zplug/init.zsh

zplug "romkatv/powerlevel10k", as:theme, depth:1
zplug 'zplug/zplug', hook-build:'zplug --self-manage'
zplug "zsh-users/zsh-completions"

zplug "zsh-users/zsh-history-substring-search", as:plugin
bindkey '^[OA' history-substring-search-up
bindkey '^[[A' history-substring-search-up
bindkey '^[OB' history-substring-search-down
bindkey '^[[B' history-substring-search-down
bindkey -M emacs '^P' history-substring-search-up
bindkey -M emacs '^N' history-substring-search-down
HISTORY_SUBSTRING_SEARCH_PREFIXED=1
HISTORY_SUBSTRING_SEARCH_ENSURE_UNIQUE=1

zplug "zsh-users/zsh-autosuggestions"
zplug "zdharma/fast-syntax-highlighting"
zplug "zpm-zsh/ls"
zplug "agkozak/zsh-z"
zplug "MichaelAquilina/zsh-you-should-use"
zplug "Aloxaf/fzf-tab"

# zplug "marlonrichert/zsh-autocomplete"

if ! zplug check --verbose; then
    printf "Install? [y/N]: "
    if read -q; then
        echo; zplug install
    fi
fi
zplug load

