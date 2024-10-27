# System default
export PATH=/usr/bin:/bin:/usr/sbin:/sbin:/usr/local/bin

# Homebrew
export PATH=/opt/homebrew/bin:$PATH

# my stuff
export PATH=$HOME/.dotfiles/lynx:$PATH
export PATH=$HOME/.dotfiles/scripts:$PATH
export PATH=$HOME/build/neovim/build/bin:$PATH

# Go binaries
export PATH=$HOME/go/bin:$PATH

# Rust
export PATH=$HOME/.cargo/bin:$PATH

# Ruby
export PATH=/opt/homebrew/Cellar/ruby/3.3.5/bin:$PATH
export PATH=/usr/local/opt/ruby/bin:$PATH
# By default, binaries installed by gem will be placed into:
export PATH=/opt/homebrew/lib/ruby/gems/3.3.0/bin:$PATH

# For compilers to find ruby you may need to set:
export LDFLAGS="-L/opt/homebrew/opt/ruby/lib"
export CPPFLAGS="-I/opt/homebrew/opt/ruby/include"

# For pkg-config to find ruby you may need to set:
export PKG_CONFIG_PATH="/opt/homebrew/opt/ruby/lib/pkgconfig"

export PATH=$HOME/.local/bin:$PATH

export SHELL=/opt/homebrew/bin/bash

export PS1='\[\e[36m\]\u \[\e[32m\]\w\[\e[0m\]\$ '


eval "$(fzf --bash)"

alias ls='ls --color=auto'
alias path='~/.dotfiles/path.sh'
alias lynx='/Users/deepwater/.config/lynx/lynx'
alias '?'=duck
alias loki=loki.sh
alias icloud="cd ~/Library/Mobile\ Documents/com~apple~CloudDocs/"
alias python="python3"
alias pip="pip3"
