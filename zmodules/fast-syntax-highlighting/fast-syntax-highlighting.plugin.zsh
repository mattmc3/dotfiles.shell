0=${(%):-%N}
if [[ ! -d "${0:A:h}/external" ]]; then
  git clone --depth=1 --recursive https://github.com/zdharma/fast-syntax-highlighting.git "${0:A:h}/external"
fi
source "${0:A:h}/external/fast-syntax-highlighting.plugin.zsh"
