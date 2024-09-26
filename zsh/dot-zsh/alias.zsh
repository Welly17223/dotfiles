if command -v htop &> /dev/null; then
  alias htop="htop"
  alias top="htop"
fi
if command -v aria2c &> /dev/null; then
  alias wget="aria2c -x 16 -s 16 -j 16 --retry-wait=1"
fi
if command -v exa &> /dev/null; then
  alias ls="exa --icons --group-directories-first --group"
fi
if command -v bat &> /dev/null; then
  alias cat="bat"
fi
if command -v tre &> /dev/null; then
  alias tree="tre -c always"
fi
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
alias gsw="git switch"
alias gmt="git mergetool --tool=nvimdiff"
