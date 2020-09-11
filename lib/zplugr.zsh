function zplugr_usage() {
  echo "zplugr"
  echo "A dirt simple, super fast ZSH plugin manager"
  echo ""
  echo "Usage:"
  echo "  zplugr bundle <dir-or-repo>"
  echo "  zplugr print <dir-or-repo>"
}

function zplugr() {
  # example usage: zplugr bundle "zsh-users/zsh-autosuggestions"
  setopt local_options extended_glob
  local cmd="$1"
  local plugin_loc="$2"

  [[ "$cmd" == "bundle" ]] || [[ "$cmd" == "print" ]] || { zplugr_usage && return 1 }

  if [[ ! -d "$plugin_loc" ]]; then
    # if not a directory, the plugin location must be a repo
    plugin_loc="${ZDOTDIR:-$HOME}/.zplugins/$2"

    # clone the plugin if we haven't already
    if [[ ! -d "$plugin_loc" ]]; then
      mkdir -p "${plugin_loc:h}"
      git clone --recursive --depth 1 "https://github.com/$2" "$plugin_loc"
    fi
  fi

  local plugin_file="$plugin_loc/${plugin_loc:t}.plugin.zsh"
  if [[ ! -f "$plugin_file" ]]; then
    local files=( "$plugin_loc/"*.{zsh-theme,theme.zsh,zshplugin,zsh.plugin,plugin.zsh,zsh,sh}(.-N) )
    [[ ${#files[@]} -gt 0 ]] || { echo "ZSH plugin file not found in: $plugin_loc" >&2 && return 1 }
    ln -s "${files[1]:a}" "$plugin_file"
  fi

  # source the plugin file and add the plugin dir to fpath
  if [[ $cmd == "bundle" ]]; then
    source $plugin_file
    fpath+=( ${plugin_file:h} )
  elif [[ $cmd == "print" ]]; then
    echo "source $plugin_file"
    echo "fpath+=( ${plugin_file:h} )"
  fi
}
