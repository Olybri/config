#
# ~/.bash_aliases
#

alias cls=clear
alias md=mkdir
alias cd..="cd .."
alias rm="rm -i"
alias del="trash-put"
alias tls="trash-list"
alias tdu="echo \$(du -sh $HOME/.local/share/Trash | cut -f1) \(\$(tls | wc -l) files\)"

alias g="git"
alias gl="git log --oneline --all --graph --decorate"
alias gs="git status -s"
alias gf="git fetch"
alias gm="git merge"
alias gfm="git pull"
alias gp="git push"
alias gamend="git commit --amend --no-edit"
alias gtrack="git update-index --no-assume-unchanged"
alias guntrack="git update-index --assume-unchanged"

gd () { git diff -- "*$@*"; }
ga () { git add "*$@*"; }
gr () { git reset -- "*$@*"; }
gc () { git commit -m "$@"; }
gca () { git commit -am "$@"; }

alias ls="ls --show-control-chars -F --color=auto"
alias ll="ls --group-directories-first -lhv"
alias la="ll -A"

alias dir="dir --color=auto"
alias vdir="dir --color=auto"

alias grep="grep --color=auto"
alias fgrep="fgrep --color=auto"
alias egrep="egrep --color=auto"

alias less="less -R"

# make dir & change dir
mc () {
  case "$1" in
    */..|*/../) cd -- "$1";; # that doesn't make any sense unless the directory already exists
    /*/../*) (cd "${1%/../*}/.." && mkdir -p "./${1##*/../}") && cd -- "$1";;
    /*) mkdir -p "$1" && cd "$1";;
    */../*) (cd "./${1%/../*}/.." && mkdir -p "./${1##*/../}") && cd "./$1";;
    ../*) (cd .. && mkdir -p "${1#.}") && cd "$1";;
    *) mkdir -p "./$1" && cd "./$1";;
  esac
}
