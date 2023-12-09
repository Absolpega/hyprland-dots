# compatibility
starship init fish | source

if status is-interactive
else
    exit
end

# Commands to run in interactive sessions can go here
# -----------------------------------------------------------------------------------------------------

fish_vi_key_bindings

# -----------------------------------------------------------------------------------------------------

fish_add_path ~/.local/bin /opt/openresty/bin ~/.cargo/bin ~/.ghcup/bin

# https://github.com/Absolpega/sudo-askpass
set -gx SUDO_ASKPASS /usr/local/bin/sudo-askpass

# -----------------------------------------------------------------------------------------------------

alias ls='dirs; exa -L 1 -T --icons'
alias l='ls'
alias la='ls -hal'
alias lt='exa -T --icons'

#alias cat='bat'

alias j="echo 'you should be using z not j'; z"

alias reload='source ~/.config/fish/config.fish'
alias rm='trash-put'
# SUDO_ASKPASS
alias sudo='sudo -A'

# -----------------------------------------------------------------------------------------------------


# this just renames starship's prompt so i can have my own fish_prompt
#  needs to be erased before being copied
functions --erase starship_prompt
functions --copy fish_prompt starship_prompt

functions --erase starship_right_prompt
functions --copy fish_right_prompt starship_right_prompt


zoxide init fish | source

source /usr/share/nnn/quitcd/quitcd.fish

# -----------------------------------------------------------------------------------------------------
# function definitions need to be last

# merges history
function fish_prompt --description "show starship prompt and run some commands"
    starship_prompt

    # it's not actually as useful as it looks
    #history merge
end

function fish_right_prompt
    starship_right_prompt
end

function fish_greeting
    # https://github.com/Absolpega/fetch
    command -v fetch >/dev/null && fetch
    true
end

# opam configuration
source /home/absolpega/.opam/opam-init/init.fish >/dev/null 2>/dev/null; or true
