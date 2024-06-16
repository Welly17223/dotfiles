# path
fpath=($HOME/.zsh_completion $fpath)
FZF_BASE="~/Downloads/fzf/bin/"

# environment variables
export QT_QPA_PLATFORMTHEME=kde
export EDITOR="nvim"
export PATH=$PATH:/usr/local/texlive/2024/bin/x86_64-linux/:~/.local/bin/:~/go/bin/

# Check if tmux plugin manager is installed
if [[ ! -d ~/.tmux/plugins/tpm ]]; then
  git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
fi

# some settings
source ~/.zsh/plugin.zsh
source ~/.zsh/alias.zsh
source ~/.zsh/opt.zsh
source ~/.zsh/completion.zsh

# some tools
[ -f ~/.zsh/.fzf.zsh ] && source ~/.zsh/.fzf.zsh
eval $(thefuck --alias)
