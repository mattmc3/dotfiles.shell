# zdotdir

My ~/.zsh directory, which contains my zsh configuration.

This branch uses [oh-my-zsh][omz] and a `$ZSH_CUSTOM` to accomplish my zsh
nirvana.

## Installation

```zsh
# it's a good idea to backup existing files first
find ~ -type f -maxdepth 1 -name '.zsh*' -exec cp {} {}.bak \;

# set the amazing ZDOTDIR variable
export ZDOTDIR=~/.zsh

# set a root .zshenv
echo ". $ZDOTDIR/.zshenv" > ~/.zshenv

# clone this repo
git clone -b ohmyzsh git@github.com:mattmc3/zdotdir.git $ZDOTDIR

# load zsh
zsh
```

## Performance

A snappy shell is very important. My config includes a `zbench` alias
that runs zsh 10 times and presents the timings.

The latest benchmark run shows that we load a new shell pretty fast.

```zsh
% # 2.4 GHz i5 MacBook Pro
% for i in $(seq 1 10); do; /usr/bin/time zsh -i -c exit; done
        0.10 real         0.05 user         0.04 sys
        0.10 real         0.05 user         0.04 sys
        0.10 real         0.05 user         0.04 sys
        0.09 real         0.04 user         0.04 sys
        0.09 real         0.04 user         0.03 sys
        0.09 real         0.04 user         0.03 sys
        0.09 real         0.04 user         0.03 sys
        0.09 real         0.04 user         0.03 sys
        0.11 real         0.05 user         0.04 sys
        0.11 real         0.05 user         0.05 sys
```

## Resources

- [Terminal Font][terminal-font]: Meslo LG M for Powerline
- [oh-my-zsh][omz]
- [supercharge your terminal with zsh][supercharge-zsh]

[terminal-font]:   https://github.com/powerline/fonts
[omz]:             https://github.com/robbyrussell/oh-my-zsh/tree/master/lib
[supercharge-zsh]: https://blog.callstack.io/supercharge-your-terminal-with-zsh-8b369d689770
