# Setup fzf
# ---------
if [[ ! "$PATH" == */home/welly/.fzf/bin* ]]; then
  PATH="${PATH:+${PATH}:}/home/welly/.fzf/bin"
fi

# export FZF_DEFAULT_COMMAND="rg --line-number --with-filename . --color=always --hidden --files | fzf --delimiter : --preview \"bat --color=always {1} --highlight-line {2}\" --preview-window ~8,+{2}-5"

export FZF_DEFAULT_OPTS=$FZF_DEFAULT_OPTS' 
  --color=fg:#c0caf5,bg:#1a1b26,hl:#bb9af7
  --color=fg+:#c0caf5,bg+:#1a1b26,hl+:#7dcfff
  --color=info:#7aa2f7,prompt:#7dcfff,pointer:#7dcfff 
  --color=marker:#9ece6a,spinner:#9ece6a,header:#9ece6a'

source <(fzf --zsh)
