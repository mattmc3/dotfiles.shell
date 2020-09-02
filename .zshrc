# execute 'ZPROF_ENABLE=1 zsh' and run 'zprof' to get profiler details
alias zperf='ZPROF_ENABLE=1 zsh'
alias zbench='for i in $(seq 1 10); do; /usr/bin/time zsh -i -c exit; done'
if [[ $ZPROF_ENABLE -gt 0 ]] ; then
  zmodload zsh/zprof
  echo 'run `zprof` to profile...'
fi

# put /usr/local/bin in path
path=(
  /usr/local/{bin,sbin}
  $path
)

# everything we do from here on is loaded from antibody plugins
export ANTIBODY_HOME=$ZDOTDIR/.antibody
source <(antibody init)
antibody bundle < $ZDOTDIR/.zsh_plugins
