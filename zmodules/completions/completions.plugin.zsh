0=${(%):-%N}
if [[ ! -d "${0:A:h}/external" ]]; then
  git clone --depth=1 --recursive https://github.com/zsh-users/zsh-completions.git "${0:A:h}/external"
fi
source "${0:A:h}/external/zsh-completions.plugin.zsh"
