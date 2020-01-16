if [[ -n "$XDG_DATA_HOME" ]]; then
  [[ -d "$XDG_DATA_HOME"/z ]] || mkdir -p "$XDG_DATA_HOME"/z
  export _Z_DATA="$XDG_DATA_HOME"/z/data
else
  export _Z_DATA="$HOME"/.z
fi

if [[ ! -d "${0:A:h}/external" ]]; then
  git clone --depth=1 --recursive https://github.com/rupa/z.git "${0:A:h}/external"
fi
source "${0:A:h}/external/z.sh"
