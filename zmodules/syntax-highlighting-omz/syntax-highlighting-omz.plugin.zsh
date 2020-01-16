0=${(%):-%N}
if [[ ! -d "${0:A:h}/external" ]]; then
  git clone https://github.com/zsh-users/zsh-syntax-highlighting.git "${0:A:h}/external"
fi
source "${0:A:h}/external/zsh-syntax-highlighting.plugin.zsh"
