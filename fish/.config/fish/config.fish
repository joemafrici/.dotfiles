if status is-interactive
    # Commands to run in interactive sessions can go here
    # System default
    fish_add_path /usr/bin /bin /usr/sbin /sbin /usr/local/bin

    # Homebrew
    fish_add_path /opt/homebrew/bin

    # my stuff
    fish_add_path $HOME/build/neovim/build/bin

    # Rust
    fish_add_path $HOME/.cargo/bin

    # Go binaries
    fish_add_path $HOME/go/bin

    fish_vi_key_bindings

    alias ls "eza"
end
