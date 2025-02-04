# Generated for envman. Do not edit.
test -s ~/.config/envman/load.fish; and source ~/.config/envman/load.fish

#disable fish greeting
set -g fish_greeting

# weird but works
source ~/.aliases.zsh

alias src='source ~/.config/fish/config.fish'

# starship prompt
starship init fish | source
enable_transience
