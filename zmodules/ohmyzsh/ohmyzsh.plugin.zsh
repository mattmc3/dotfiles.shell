if [[ ! -d "$ZSH" ]]; then
  echo "ohmyzsh not installed or misconfigured: $ZSH" >&2
  return 1
fi
