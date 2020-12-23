# zprof if we ever need to profile
alias runzprof="RUNZPROF=1 zsh"
alias zbench='for i in $(seq 1 10); do; /usr/bin/time zsh -i -c exit; done'
[[ $RUNZPROF -ne 1 ]] || zmodload zsh/zprof

# Set pre-plugin load variables
PURE_PROMPT_SYMBOL="%%"

# the whole config is a plugin chain
zstyle ':znap:*' plugins-dir $ZDOTDIR/plugins
source $ZDOTDIR/plugins/zsh-snap/znap.zsh

znap source zsh-async
znap prompt pure

znap source zsh-setopts
znap source zsh-history
znap source fast-syntax-highlighting
znap source zsh-autosuggestions
znap source zsh-completions
znap source zsh-history-substring-search
znap source zsh-colored-man-pages
znap source zfunctions
znap source z

# source zshrc.d
for _f in "$ZDOTDIR"/zshrc.d/*.{sh,zsh}(.N); do
  # ignore files that begin with a tilde
  case $_f:t in ~*) continue;; esac
  source "$_f"
done
unset _f

# done profiling
[[ $RUNZPROF -ne 1 ]] || { unset RUNZPROF && zprof }
