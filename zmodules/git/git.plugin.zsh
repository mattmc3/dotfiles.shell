# extend rather than override
zstyle -t ":prezto:module:prezto" loaded 'yes' && prezto-extend-module git

alias get="git"
alias gadd="git add ."
alias gcom="git checkout master"
alias gcob="git checkout -b"
alias sourcetree='open -a SourceTree'
