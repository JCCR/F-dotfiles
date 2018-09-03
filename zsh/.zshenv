# zsh setup profiling
PROFILE_STARTUP=false

# .zshenv is always sourced, define here exported variables that should
# be available to other programs.

# export VISUAL=subl
export EDITOR=micro
# export PAGER=more
export PATH="$HOME/.local/bin:/usr/local/bin:$PATH"

# load zsh config files

env_config_files=(~/.zsh/**/*.zshenv(N))
if test ! -z "$env_config_files" ;
    then
    for file in ${env_config_files}
    do
      source $file
    done
fi

export TERM="xterm-256color"
