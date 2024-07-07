alias htop="btop"
alias man="tldr"
alias wget='aria2c -x 20 -s 20 -j 20 --retry-wait=1'
alias ls="exa --icons --group-directories-first"
alias tree="tre -c always"
alias md="mkdir -p"
alias adi="arduino-cli"
alias adib="arduino-cli board"
alias adic="arduino-cli core"
alias adil="arduino-cli lib"

dot=...
dir=../..

for _ in {1..15}; do
  alias $dot="cd $dir"
  dot=$dot.
  dir=$dir/..
done

unset dot dir

tre() { command tre "$@" -e && source "/tmp/tre_aliases_$USER" 2>/dev/null; }

# git aliases
alias gs="git status"
alias ga="git add"
alias gc="git commit"
alias gcm="git commit -m"
alias gca="git commit --amend"
alias gco="git checkout"
alias gcb="git checkout -b"
alias gd="git diff"
