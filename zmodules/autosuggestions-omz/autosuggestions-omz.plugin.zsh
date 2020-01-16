0=${(%):-%N}
if [[ ! -d "${0:A:h}/external" ]]; then
  git clone --depth=1 --recursive https://github.com/zsh-users/zsh-autosuggestions.git "${0:A:h}/external"
fi
source "${0:A:h}/external/zsh-autosuggestions.plugin.zsh"

# plugin values
ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=60'
