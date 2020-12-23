# zprof if we ever need to profile
alias runzprof="RUNZPROF=1 zsh"
alias zbench='for i in $(seq 1 10); do; /usr/bin/time zsh -i -c exit; done'
[[ $RUNZPROF -ne 1 ]] || zmodload zsh/zprof

# Set pre-plugin load variables
PURE_PROMPT_SYMBOL="%%"
ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=60'
XDG_APPS=(
  'docker'
  'gnupg'
  'jupyter'
  'less'
  'nodejs'
  'npm'
  'readline'
  'screen'
  'tmux'
  'todo-txt'
  'wget'
  'z'
)
zstyle ':xdg-basedirs:*' apps $XDG_APPS

# the whole config is a plugin chain
zstyle ':znap:*' plugins-dir $ZDOTDIR/plugins
source $ZDOTDIR/plugins/zsh-snap/znap.zsh

znap source zsh-async
znap prompt pure

# setup ZSH nicely
znap source zsh-xdg-basedirs
znap source zsh-setopts
znap source zsh-history
znap source zfunctions
# external plugin goodies
znap source ohmyzsh lib/{clipboard,termsupport,key-bindings} plugins/{colored-man-pages,copyfile,copydir,extract,history-substring-search,osx,sublime,z}
znap source zsh-autosuggestions
znap source zsh-completions
# final plugins
znap source zshrc.d
znap source fast-syntax-highlighting

# done profiling
[[ $RUNZPROF -ne 1 ]] || { unset RUNZPROF && zprof }
