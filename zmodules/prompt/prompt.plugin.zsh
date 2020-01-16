0=${(%):-%N}

# extend rather than override
zstyle -t ":prezto:module:prezto" loaded 'yes' && prezto-extend-module prompt
if [[ ! -d "${0:A:h}/external/spaceship" ]]; then
  git clone --depth 1 --recursive https://github.com/denysdovhan/spaceship-prompt.git "${0:A:h}/external/spaceship"
  mkdir -p "${0:A:h}/functions"
  ln -sf "${0:A:h}/external/spaceship/spaceship.zsh" "${0:A:h}/functions/prompt_spaceship_setup"
fi
