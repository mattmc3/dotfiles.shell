# extend rather than override
# zstyle -t ":prezto:module:prezto" loaded 'yes' && prezto-extend-module python

# python
if [[ -z $WORKON_HOME ]]; then
  if [[ -n "$XDG_DATA_HOME" ]]; then
    export WORKON_HOME="${XDG_DATA_HOME:-$HOME/.local/share}/venvs"
  else
    export WORKON_HOME="$HOME/.virtualenvs"
  fi
fi

alias py2='python2'
alias py3='python3'
alias py='python3'
alias pip2update="pip2 list --outdated | cut -d ' ' -f1 | xargs -n1 pip2 install -U"
alias pip3update="pip3 list --outdated | cut -d ' ' -f1 | xargs -n1 pip3 install -U"
alias pyfind='find . -name "*.py"'
alias pygrep='grep --include="*.py"'
alias pyva="source .venv/bin/activate"

workon() {
  [[ -z "$1" ]] && { echo "Expecting workon project name"; return 1; }
  source "$WORKON_HOME/$1/bin/activate"
}
# python: tab complete for workon dir (virtualenv)
compdef '_files -W "$WORKON_HOME"' workon &> /dev/null

pyclean() {
  find . -type f -name "*.py[co]" -delete
  find . -type d -name "__pycache__" -delete
}

pip_export() {
  __pip_export "pip" "$@"
}

pip2_export() {
  __pip_export "pip2" "$@"
}

pip3_export() {
  __pip_export "pip3" "$@"
}

__pip_export() {
  $1 freeze
}

pip_import() {
  __pip_import "pip" "$@"
}

pip2_import() {
  __pip_import "pip2" "$@"
}

pip3_import() {
  __pip_import "pip3" "$@"
}

__pip_import() {
  [[ -f "$2" ]] || { echo "Usage: Expecting valid requirements.txt path" >&2; return; }
  $1 install -r "$2"
}
