# system default
export PATH=/usr/bin:/bin:/usr/sbin:/sbin:/usr/local/bin

# homebrew
export PATH=/opt/homebrew/bin:$PATH

# my stuff
export PATH=/Users/deepwater/.dotfiles/lynx:$PATH
export PATH=/Users/deepwater/.dotfiles/scripts:$PATH
export PATH=/Users/deepwater/build/neovim/build/bin:$PATH

# stuff installed with go install
export PATH=/Users/deepwater/go/bin:$PATH

# rust
export PATH=/Users/deepwater/.cargo/bin:$PATH

export SHELL=/opt/homebrew/bin/bash

export PS1='\[\e[36m\]\u \[\e[32m\]\w\[\e[0m\]\$ '

alias ls='ls --color=auto'
alias path='~/.dotfiles/path.sh'
alias lynx='/Users/deepwater/.config/lynx/lynx'
alias '?'=duck
alias loki=loki.sh
alias icloud="cd ~/Library/Mobile\ Documents/com~apple~CloudDocs/"
alias python="python3"
alias pip="pip3"
