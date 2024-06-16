alias htop="btop"
alias man="tldr"
alias wget='aria2c -x 20 -s 20 -j 20 --retry-wait=1'
alias ls="exa --icons --group-directories-first"
alias tree="tre -c always"
alias md="mkdir -p"
alias adi="arduino-cli"
alias ...="../.."
alias ....="../../.."
alias .....="../../../.."
alias ......="../../../../.."
alias .......="../../../../../.."
tre() { command tre "$@" -e && source "/tmp/tre_aliases_$USER" 2>/dev/null; }
