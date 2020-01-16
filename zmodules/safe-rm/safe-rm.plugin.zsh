0=${(%):-%N}
if [[ ! -d "${0:A:h}/external" ]]; then
  git clone --depth=1 --recursive https://github.com/kaelzhang/shell-safe-rm.git "${0:A:h}/external"
fi

# prefer del
alias del="${0:A:h}/external/bin/rm.sh"

# for if you forget and use rm
alias rm="${0:A:h}/external/bin/rm.sh"

# if you want to be explicit about whether the command is safe/unsafe
alias safe-rm="${0:A:h}/external/bin/rm.sh"
alias unsafe-rm="command rm"
