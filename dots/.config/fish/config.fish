if status is-interactive
else
	#echo "not interactive"
	exit
end

# Commands to run in interactive sessions can go here
# -----------------------------------------------------------------------------------------------------

fish_vi_key_bindings

# -----------------------------------------------------------------------------------------------------

#set -gx PATH /opt/openresty/bin:~/.local/bin:$PATH
fish_add_path ~/.local/bin /opt/openresty/bin ~/.cargo/bin ~/.ghcup/bin

# https://github.com/Absolpega/simple-terminal-sudo-askpass
set -gx SUDO_ASKPASS /usr/local/bin/sudo-askpass

#set -gx GTK_THEME 'Yaru-Aqua-dark'

# -----------------------------------------------------------------------------------------------------

# i wasn't able to find any good shortcut and this doesn't work
#bind \em 'history merge'

# -----------------------------------------------------------------------------------------------------

alias ls='dirs; exa -L 1 -T --icons'
alias l='ls'
alias la='ls -hal'
alias lt='exa -T --icons'

alias cat='bat'

alias reload='source ~/.config/fish/config.fish'
alias rm='trash-put'
# SUDO_ASKPASS
alias sudo='sudo -A'

# saves last directory from ranger and cd into it
alias nav='ranger --choosedir=$HOME/.rangerdir; pushd $(cat $HOME/.rangerdir)'

# -----------------------------------------------------------------------------------------------------

starship init fish | source

# this just renames starship's prompt so i can have my own fish_prompt
# needs to be erased before being copied
functions --erase starship_prompt
functions --copy fish_prompt starship_prompt


source /home/absolpega/.config/fish/autojump.fish

# -----------------------------------------------------------------------------------------------------
# function definitions need to be last

# merges history
function fish_prompt --description "show starship prompt and run some commands"
	starship_prompt

	# it's not actually as useful as it looks
	#history merge
end

function fish_greeting
	set temp_status status

	# https://github.com/Absolpega/fetch
	command -v fetch > /dev/null && fetch

	sh -c "exit $temp_status"
end
