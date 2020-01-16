# extend rather than override
zstyle -t ":prezto:module:prezto" loaded 'yes' && prezto-extend-module prompt
if [[ -d $ZSH_CUSTOM ]] && [[ ! -d $ZSH_CUSTOM/plugins/prompt/external/spaceship ]]; then
  git clone --depth 1 --recursive https://github.com/denysdovhan/spaceship-prompt.git $ZSH_CUSTOM/plugins/prompt/external/spaceship
  mkdir -p "$ZSH_CUSTOM/plugins/prompt/functions"
  ln -sf "$ZSH_CUSTOM/plugins/prompt/external/spaceship/spaceship.zsh" "$ZSH_CUSTOM/plugins/prompt/functions/prompt_spaceship_setup"
fi
