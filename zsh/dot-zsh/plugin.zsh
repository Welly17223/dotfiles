ZINIT_HOME="${XDG_DATA_HOME:-${HOME}/.local/share}/zinit/zinit.git"
[ ! -d $ZINIT_HOME ] && mkdir -p "$(dirname $ZINIT_HOME)"
[ ! -d $ZINIT_HOME/.git ] && git clone https://github.com/zdharma-continuum/zinit.git "$ZINIT_HOME"
source "${ZINIT_HOME}/zinit.zsh"

zinit ice depth"1" as"theme"; zinit light romkatv/powerlevel10k
zinit ice wait depth"1" lucid; zinit light zsh-users/zsh-completions

# zplug "romkatv/powerlevel10k", as:theme, depth:1
# zplug 'zplug/zplug', hook-build:'zplug --self-manage'
# zplug "zsh-users/zsh-completions"

# zplug "zsh-users/zsh-history-substring-search", as:plugin
zinit ice wait depth"1" lucid; zinit light zsh-users/zsh-history-substring-search
bindkey '^[OA' history-substring-search-up
bindkey '^[[A' history-substring-search-up
bindkey '^[OB' history-substring-search-down
bindkey '^[[B' history-substring-search-down
bindkey -M emacs '^P' history-substring-search-up
bindkey -M emacs '^N' history-substring-search-down
HISTORY_SUBSTRING_SEARCH_PREFIXED=1
HISTORY_SUBSTRING_SEARCH_ENSURE_UNIQUE=1

zinit ice wait"1" depth"1" lucid; zinit load Aloxaf/fzf-tab
zinit ice wait depth"1" lucid; zinit load zsh-users/zsh-autosuggestions
zinit ice wait depth"1" lucid; zinit load zdharma/fast-syntax-highlighting
zinit ice wait depth"1" lucid; zinit load zpm-zsh/ls
zinit ice wait depth"1" lucid; zinit load agkozak/zsh-z
zinit ice wait depth"1" lucid; zinit load MichaelAquilina/zsh-you-should-use

# zplug "Aloxaf/fzf-tab"
# zplug "zsh-users/zsh-autosuggestions"
# zplug "zdharma/fast-syntax-highlighting"
# zplug "zpm-zsh/ls"
# zplug "agkozak/zsh-z"
# zplug "MichaelAquilina/zsh-you-should-use"
# zplug "marlonrichert/zsh-autocomplete"

