alias vi="nvim"
#   󱔎 󰴺 󱪁       󱢺   󱡂 󰣘 󰣙 󰬯󰿈   󰊠 %
PROMPT="%F{cyan}%n %f%F{magenta}󰬯%f :%~$ "
# Created by `pipx` on 2024-04-23 02:49:00
export PATH="$PATH:/Users/deepwater/.local/bin"
export CLICOLOR=1
export LSCOLORS=HxfxcxdxCxegedabagacad
#export LSCOLORS=exfxcxdxbxegedabagacad

# Enable Vim mode
bindkey -v
# Bind 'jk' to return to normal mode in Vim keybindings
bindkey -M viins 'jk' vi-cmd-mode
