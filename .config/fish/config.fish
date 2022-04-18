if status is-interactive
    # Commands to run in interactive sessions can go here
end

# Remove need for . in front of executables
set PATH .:$PATH
export PATH

# Compiler flags
export CFLAGS="-g -Wall -O0"
export CXXFLAGS="-g -Wall -O0"

# config alias for dotfile management
alias config='/usr/bin/git --git-dir=/home/joe/.cfg/ --work-tree=/home/joe'

fish_vi_key_bindings
