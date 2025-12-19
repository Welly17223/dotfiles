ZINIT_HOME="${XDG_DATA_HOME:-${HOME}/.local/share}/zinit/zinit.git"
[ ! -d $ZINIT_HOME ] && mkdir -p "$(dirname $ZINIT_HOME)"
[ ! -d $ZINIT_HOME/.git ] && git clone https://github.com/zdharma-continuum/zinit.git "$ZINIT_HOME"
source "${ZINIT_HOME}/zinit.zsh"

zinit ice depth"1" as"theme" lucid; zinit light romkatv/powerlevel10k
# zinit ice wait depth"1" lucid; zinit light zsh-users/zsh-completions

zinit wait lucid for \
  OMZ::plugins/ssh/ssh.plugin.zsh \
  OMZ::plugins/kitty/kitty.plugin.zsh \
  OMZ::plugins/sudo/sudo.plugin.zsh \
  OMZ::plugins/colored-man-pages/colored-man-pages.plugin.zsh \
    light-mode \
  zsh-users/zsh-history-substring-search \
   atinit"ZINIT[COMPINIT_OPTS]=-C; zicompinit; zicdreplay" \
  zdharma-continuum/fast-syntax-highlighting \
  zsh-users/zsh-completions \
   atload"!_zsh_autosuggest_start" \
  zsh-users/zsh-autosuggestions \
    light-mode \
  Aloxaf/fzf-tab \
  zpm-zsh/ls \
  agkozak/zsh-z \
  Freed-Wu/fzf-tab-source \
  MichaelAquilina/zsh-you-should-use 2> /dev/null

# fzf-tab config
# disable sort when completing `git checkout`
zstyle ':completion:*:git-checkout:*' sort false
zstyle ':completion:*:zshz:*' sort false
# set descriptions format to enable group support
# NOTE: don't use escape sequences (like '%F{red}%d%f') here, fzf-tab will ignore them
zstyle ':completion:*:descriptions' format '[%d]'
# set list-colors to enable filename colorizing
zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}
# force zsh not to show completion menu, which allows fzf-tab to capture the unambiguous prefix
zstyle ':completion:*' menu no
export LESSOPEN="|${HOME}/.zsh/preview.zsh %s"
# preview directory's content with eza when completing cd
zstyle ':fzf-tab:complete:cd:*' fzf-preview 'eza -a -1 --color=always --icons=always $realpath'
# zstyle ':fzf-tab:complete:nvim:*' fzf-preview '[ -d $realpath ] && eza -a -1 --color=always $realpath || head --lines=50 $realpath'
zstyle ':fzf-tab:complete:nvim:*' fzf-preview "${HOME}/.zsh/preview.zsh \$realpath"
# custom fzf flags
# NOTE: fzf-tab does not follow FZF_DEFAULT_OPTS by default
# zstyle ':fzf-tab:*' fzf-flags --color=fg:1,fg+:2 --bind=tab:accept
# To make fzf-tab follow FZF_DEFAULT_OPTS.
# NOTE: This may lead to unexpected behavior since some flags break this plugin. See Aloxaf/fzf-tab#455.
zstyle ':fzf-tab:*' use-fzf-default-opts yes
# switch group using `<` and `>`
zstyle ':fzf-tab:*' switch-group '<' '>'

# fzf-tab keybinds
zstyle ':fzf-tab:*' fzf-bindings 'ctrl-j:accept' 'ctrl-a:toggle-all' 'alt-space:toggle'

# zsh-history-substring-search config
bindkey '^[OA' history-substring-search-up
bindkey '^[[A' history-substring-search-up
bindkey '^[OB' history-substring-search-down
bindkey '^[[B' history-substring-search-down
bindkey -M emacs '^P' history-substring-search-up
bindkey -M emacs '^N' history-substring-search-down
HISTORY_SUBSTRING_SEARCH_PREFIXED=1
HISTORY_SUBSTRING_SEARCH_ENSURE_UNIQUE=1

# zplug "Aloxaf/fzf-tab"
# zplug "zsh-users/zsh-autosuggestions"
# zplug "zdharma/fast-syntax-highlighting"
# zplug "zpm-zsh/ls"
# zplug "agkozak/zsh-z"
# zplug "MichaelAquilina/zsh-you-should-use"
# zplug "marlonrichert/zsh-autocomplete"
# zplug "romkatv/powerlevel10k", as:theme, depth:1
# zplug 'zplug/zplug', hook-build:'zplug --self-manage'
# zplug "zsh-users/zsh-completions"
# zplug "zsh-users/zsh-history-substring-search", as:plugin
