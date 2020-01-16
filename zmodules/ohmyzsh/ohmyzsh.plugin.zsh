if [[ ! -d "$ZSH" ]]; then
  echo "ohmyzsh not installed or misconfigured: $ZSH" >&2
  return 1
fi

# omz admin
function omzup {
  if [[ -z $ZSH ]] || [[ -z $ZSH_CUSTOM ]]; then
    echo "OMZ not configured correctly or not enabled" >&2
    return 1
  fi
  env ZSH=$ZSH ZSH_CACHE_DIR=$ZSH_CACHE_DIR DISABLE_UPDATE_PROMPT=true zsh -f $ZSH/tools/check_for_upgrade.sh
  find $ZSH_CUSTOM -type d -name .git -prune -print -execdir git pull \;
}
