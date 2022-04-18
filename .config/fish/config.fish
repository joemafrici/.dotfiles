if status is-interactive
    # Commands to run in interactive sessions can go here
end

# Remove need for . in front of executables
set PATH .:$PATH
export PATH

export CFLAGS="-g -Wall -O0"
export CXXFLAGS="-g -Wall -O0"
alias config='/usr/bin/git --git-dir=/home/joe/.cfg/ --work-tree=/home/joe'
