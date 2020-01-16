if [[ -n "$XDG_CONFIG_HOME" ]]; then
  export TODOTXT_CFG_FILE="$XDG_CONFIG_HOME"/todo-txt/config
else
  export TODOTXT_CFG_FILE="$HOME"/.todo/config
fi

alias t="todo.sh"
alias todos="$VISUAL $HOME/Desktop/todo.txt"
