if status is-interactive
    # Homebrew
    fish_add_path /opt/homebrew/bin
    fish_add_path /opt/homebrew/sbin

    # Add Homebrew's Ruby to PATH (specific version may vary)
    fish_add_path /opt/homebrew/Cellar/ruby/3.4.2/bin/ruby
    fish_add_path /opt/homebrew/lib/ruby/gems/3.4.0/bin

    # Set GEM_HOME and GEM_PATH to user directory
    # set -gx GEM_HOME $HOME/.gem/ruby/3.1.0
    # set -gx GEM_PATH $HOME/.gem/ruby/3.1.0

    # Add user gem binaries to PATH
    # fish_add_path $HOME/.gem/ruby/3.1.0/bin

    # Commands to run in interactive sessions can go here
    # System default
    fish_add_path /usr/bin /bin /usr/sbin /sbin /usr/local/bin


    # my stuff
    fish_add_path $HOME/build/neovim/build/bin

    # Rust
    fish_add_path $HOME/.cargo/bin

    # Go binaries
    fish_add_path $HOME/go/bin



    fish_vi_key_bindings

    alias ls "eza"
end
