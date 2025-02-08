# Generated for envman. Do not edit.
test -s ~/.config/envman/load.fish; and source ~/.config/envman/load.fish

#disable fish greeting
set -g fish_greeting

# weird but works
source ~/.aliases.zsh

alias src='source ~/.config/fish/config.fish'

# vi mode
fish_vi_key_bindings

# starship prompt
starship init fish | source
enable_transience

# zoxide
zoxide init --cmd cd fish | source

# yazi
function y
	set tmp (mktemp -t "yazi-cwd.XXXXXX")
	yazi $argv --cwd-file="$tmp"
	if set cwd (command cat -- "$tmp"); and [ -n "$cwd" ]; and [ "$cwd" != "$PWD" ]
		builtin cd -- "$cwd"
	end
	rm -f -- "$tmp"
end
