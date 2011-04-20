# Aliases
alias g='git'
compdef g=git
alias gs='git status'
compdef _git gs=git-status
alias gl='git pull'
compdef _git gl=git-pull
alias gup='git fetch && git rebase'
compdef _git gup=git-fetch
alias gp='git push'
compdef _git gp=git-push
gdv() { git-diff -w "$@" | view - }
compdef _git gdv=git-diff
alias gc='git commit -v'
compdef _git gc=git-commit
alias gca='git commit -v -a'
compdef _git gca=git-commit
alias gch='git checkout'
compdef _git gch=git-checkout
alias gb='git branch'
compdef _git gb=git-branch
alias gba='git branch -a'
compdef _git gba=git-branch
alias gcount='git shortlog -sn'
compdef gcount=git
alias gcp='git cherry-pick'
compdef _git gcp=git-cherry-pick
alias glg='git log --stat --max-count=5'
compdef _git glg=git-log
alias ga='git add'
compdef _git ga=git-add
alias ga='git add -A'
compdef _git ga=git-add


function current_feature() {
  ref=$(git symbolic-ref HEAD 2> /dev/null) || return
  echo ${ref#refs/heads/feature/}
}

function current_release() {
  ref=$(git symbolic-ref HEAD 2> /dev/null) || return
  echo ${ref#refs/heads/release/}
}

# git flow aliases
alias gf='git flow'
compdef _git gf=git-flow
alias gfi='git flow init'
compdef _git gfi=git-flow

alias gffs='git flow feature start'
compdef _git gffs=git-flow
alias gfff='git flow feature finish $(current_feature)'
compdef _git gfff=git-flow
alias gffr='git flow feature rebase'
compdef _git gffr=git-flow

alias gfrs='git flow release start'
compdef _git gfrs=git-flow
alias gfrf='git flow release finish $(current_release)'
compdef _git gfrf=git-flow

alias gfhs='git flow hotfix start'
compdef _git gfhs=git-flow
alias gfhf='git flow hotfix finish'
compdef _git gfhf=git-flow

# Git and svn mix
alias git-svn-dcommit-push='git svn dcommit && git push github master:svntrunk'
compdef git-svn-dcommit-push=git

#
# Will return the current branch name
# Usage example: git pull origin $(current_branch)
#
function current_branch() {
  ref=$(git symbolic-ref HEAD 2> /dev/null) || return
  echo ${ref#refs/heads/}
}

# these aliases take advantage of the previous function
alias gpo='git pull origin $(current_branch)'
compdef gpo=git
alias gpso='git push origin $(current_branch)'
compdef gpso=git
alias gpnp='git pull origin $(current_branch) && git push origin $(current_branch)'
compdef gpnp=git
