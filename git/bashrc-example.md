notepad ~/.bashrc opens bash rc file from CLI

## Aliases
### status
`alias gst='git status'`

### pull
`alias gp='git pull'`

### revert current changes locally
`alias grev='git checkout -- .'`

### add
`alias gaa='git add .'`

### commit with message
* `gcmt My Message` will behave like git commit -m "My Message"
`alias gcmt='f() { git commit -m "$*"; }; f'`

### push
`alias gpu='git push'`

### diffs
`alias gd='git diff'`

### checkouts
`alias gco='git checkout'`
`alias gcm='git checkout master'`

#### revert current changes locally
`alias grev='git checkout -- .'`

### remotes
`alias gr='git remote'`
`alias grv='git remote -v'`
`alias grset='git remote set-url'`

### misc
`alias gcp='git cherry-pick'`
`alias gwc='git whatchanged -p --abbrev-commit --pretty=medium'`
`alias gpoat='git push origin --all && git push origin --tags'`
`alias gsta='git stash'`
`alias gstp='git stash pop'`
`alias gstd='git stash drop'`
`alias gm='git merge'`

### logs
`alias glg='git log --stat --max-count=10'`
`alias glgg='git log --graph --max-count=10'`
`alias glgga='git log --graph --decorate --all'`
`alias glo='git log --oneline --decorate --color'`
`alias glog='git log --oneline --decorate --color --graph'`

### resets
`alias grh='git reset HEAD'`
`alias grhh='git reset HEAD --hard'`
`alias gclean='git reset --hard && git clean -dfx'`

## Will cd into the top of the current repository or submodule.
alias grt='cd $(git rev-parse --show-toplevel || echo ".")'

## these alias commit and uncommit wip branches
alias gwip='git add -A; git ls-files --deleted -z | xargs -r0 git rm; git commit -m "--wip--"'
alias gunwip='git log -n 1 | grep -q -c "\-\-wip\-\-" && git reset HEAD~1'

## functions
Will return the current branch name
Usage example: git pull origin $(current_branch)

function current_branch() {
  ref=$(git symbolic-ref HEAD 2> /dev/null) || \
  ref=$(git rev-parse --short HEAD 2> /dev/null) || return
  echo ${ref#refs/heads/}
}

function current_repository() {
  ref=$(git symbolic-ref HEAD 2> /dev/null) || \
  ref=$(git rev-parse --short HEAD 2> /dev/null) || return
  echo $(git remote -v | cut -d':' -f 2)
}

## these aliases take advantage of the previous function
alias ggpull='git pull origin $(current_branch)'
alias ggpur='git pull --rebase origin $(current_branch)'
alias ggpush='git push origin $(current_branch)'
alias ggpnp='git pull origin $(current_branch) && git push origin $(current_branch)'

## Pretty log messages
function _git_log_prettily(){
  if ! [ -z $1 ]; then
    git log --pretty=$1
  fi
}
alias glp="_git_log_prettily"

## Work In Progress (wip)
These features allow to pause a branch development and switch to another one (wip)
When you want to go back to work, just unwip it
This function return a warning if the current branch is a wip
function work_in_progress() {
  if $(git log -n 1 2>/dev/null | grep -q -c "\-\-wip\-\-"); then
    echo "WIP!!"
  fi
}
