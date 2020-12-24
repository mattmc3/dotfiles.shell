# just execute 'ZSH_PROFILE_RC=1 zsh' and run 'zprof' to get the details
if [[ $ZSH_PROFILE_RC -gt 0 ]] ; then
    zmodload zsh/zprof
    echo "run zprof to profile"
fi

# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZDOTDIR=${ZDOTDIR:-$HOME}
export ZSH="$ZDOTDIR/.oh-my-zsh"
[[ -d "$ZSH" ]] || git clone --depth 1 https://github.com/ohmyzsh/ohmyzsh.git "$ZSH"

# Would you like to use another custom folder than $ZSH/custom?
ZSH_CUSTOM="$ZDOTDIR/.zsh_custom"
[[ -d "$ZSH_CUSTOM" ]] || git clone --depth 1 --recursive git@github.com:mattmc3/zsh_custom.git "$ZSH_CUSTOM"

# Other omz variables
ZSH_DISABLE_COMPFIX=true
ZSH_COMPDUMP="$ZDOTDIR/.zcompdump"
HIST_STAMPS="yyyy-mm-dd"
ZFUNCDIR="$ZDOTDIR/zfunctions"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="refined"

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in ~/.oh-my-zsh/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to automatically update without prompting.
# DISABLE_UPDATE_PROMPT="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS=true

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"

# Which plugins would you like to load?
# Standard plugins can be found in ~/.oh-my-zsh/plugins/*
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(
	# first
  _init
  async

	# omz
  colored-man-pages
  history
  extract
  copyfile
  copydir
  sublime
  z

  # custom
  aliases
  autosuggestions
  brew
  cdls
  colemak
  aliases
  completions
  dotfiles
  git
  golang
  groovy
  history-substring-search
  java
  jupyter
  lpass
  macos
  python
  ruby
  safe-rm
  tmux
  todo-txt
  up
  vscode
  zfunctions

  # last
  fast-syntax-highlighting
)

source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

# set general stuff
export TZ="America/New_York"

# path
path=(
  $HOME/bin
  /usr/local/{sbin,bin}
  /usr/{sbin,bin}
  /{sbin,bin}
  /usr/local/share/npm/bin
  .
  $path
)
typeset -gxU path

# dotfiles
[[ -d "$HOME/.config/dotfiles" ]] && export DOTFILES="$HOME/.config/dotfiles"

return true
