export TERM="screen-256color"

if [ -z "$SSH_AUTH_SOCK" ] ; then
	RUNNING_AGENT="`ps -ax | grep 'ssh-agent -s' | grep -v grep | wc -l | tr -d '[:space:]'`"
	if [ "$RUNNING_AGENT" = "0" ]; then
		ssh-agent -s &> $HOME/.ssh/ssh-agent
	fi
	eval `cat $HOME/.ssh/ssh-agent`
fi

source ${HOME}/.zsh/catppuccin_mocha-zsh-syntax-highlighting.zsh

if type nvim &> /dev/null; then
    EDITOR=nvim
fi

# The following lines were added by compinstall
zstyle :compinstall filename '/home/chris/.zshrc'

autoload -Uz compinit
compinit
autoload -U +X bashcompinit && bashcompinit

zstyle ':completion:*' menu select
# End of lines added by compinstall

if [[ -d "$HOME/.zplug" ]]; then
    export ZPLUG_HOME="$HOME/.zplug"
fi

if [[ -d "/usr/local/opt/zplug" ]]; then
    export ZPLUG_HOME="/usr/local/opt/zplug"
fi

if [[ -f "$ZPLUG_HOME/init.zsh" ]]; then

    source "$ZPLUG_HOME/init.zsh"

    zplug "agkozak/zsh-z"

    zplug "zsh-users/zsh-syntax-highlighting", defer:2
    zplug "kiurchv/asdf.plugin.zsh", defer:2

    if ! zplug check --verbose; then
        printf "Install? [y/N]: "
        if read -q; then
            echo; zplug install
        fi
    fi
    zplug load
fi

if [[ -f "$HOME/.asdf/plugins/golang/set-env.zsh" ]]; then
    . $HOME/.asdf/plugins/golang/set-env.zsh
fi

if [[ -f "$HOME/.asdf/plugins/dotnet-core/set-dotnet-home.zsh" ]] then
    . $HOME/.asdf/plugins/dotnet-core/set-dotnet-home.zsh
fi

if [[ -f "$HOME/.cargo/env" ]]; then
    . "$HOME/.cargo/env"
fi

# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
bindkey -v
# End of lines configured by zsh-newuser-install

export PATH=$PATH:$HOME/.local/bin:$HOME/homebrew/bin

if type bob &> /dev/null; then
	PATH=$PATH:$HOME/.local/share/bob/nvim-bin
fi

if type eza &> /dev/null; then
	alias ll="eza -l -g --icons"
	alias lla="ll -a"
fi

if type batcat &> /dev/null; then
	alias cat="batcat"
fi

if type bat &> /dev/null; then
    alias cat="bat"
    MANPAGER="sh -c 'col -bx | bat -l man -p'"
fi

if type sccache &> /dev/null; then
    RUSTC_WRAPPER=sccache
fi

#if type rg &> /dev/null; then
#	alias grep="rg"
#fi

if type dkp-pacman &> /dev/null; then
	export DEVKITPRO=/opt/devkitpro
	export DEVKITARM="${DEVKITPRO}/devkitARM"
	export DEVKITPPC="${DEVKITPRO}/devkitPPC"
	export PATH="${DEVKITPRO}/tools/bin:${PATH}"
fi

# Functions
peco_change_directory() {
	cd $(ls -d $HOME/source/repos/* | peco --layout=bottom-up)
    zle accept-line
}
zle -N peco_change_directory

function find_cd() {
  local selected_dir=$(find . -type d 2>/dev/null | peco --layout=bottom-up)
  if [ -n "$selected_dir" ]; then
    BUFFER="cd ${selected_dir}"
    zle accept-line
  fi
}
zle -N find_cd
bindkey '^f' find_cd

function peco-src () {
  local selected_dir=$(ls -ad $HOME/source/repos/* | peco --layout=bottom-up)
  if [ -n "$selected_dir" ]; then
    BUFFER="cd ${selected_dir}"
    zle accept-line
  fi
}
zle -N peco-src
bindkey '^G' peco-src

peco_select_history() {
    local parse_cmd

    if (( $+commands[gtac] )); then
        parse_cmd="gtac"
    elif (( $+commands[tac] )); then
        parse_cmd="tac"
    else
        parse_cmd="tail -r"
    fi

    if [ -n "$ZSH_PECO_HISTORY_DEDUP" ]; then
        if (( $+commands[perl] )); then
            parse_cmd="$parse_cmd | perl -ne 'print unless \$seen{\$_}++'"
        elif (( $+commands[awk] )); then
            parse_cmd="$parse_cmd | awk '!seen[\$0]++'"
        else
            parse_cmd="$parse_cmd | uniq"
        fi
    fi

    BUFFER=$(fc -l -n 1 | eval $parse_cmd | \
        peco ${=ZSH_PECO_HISTORY_OPTS} --query "$LBUFFER" --layout=bottom-up)
    
    CURSER=$#BUFFER
    zle -R -c
}
zle -N peco_select_history

# Set keybindings
bindkey "^l" forward-char
bindkey "^k" backward-char
bindkey "^d" delete-char
bindkey "^r" peco_select_history

export PATH="$HOME/.yarn/bin:$HOME/.config/yarn/global/node_modules/.bin:$PATH"

if type brew --prefix nvm &> /dev/null; then
    export NVM_DIR="$(brew --prefix nvm)"
else
    export NVM_DIR="$HOME/.nvm"
fi

[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion


test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"
eval "$(starship init zsh)"

precmd () {print -Pn "\e]0;%n@%m %~\a"}

# pnpm
export PNPM_HOME="/home/chris/.local/share/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac
# pnpm end

export XDG_CONFIG_HOME="$HOME/.config/"
export XDG_DATA_HOME="$HOME/.local/share"

# Turso
export PATH="/home/chris/.turso:$PATH"

# Work convenience functions
function upload_wicket () {
    rsync -avr -e "ssh -l $1" --exclude=".git*" --exclude=".vscode*" ~/source/work/repos/NetCutter $2:/home/$1/Development/
}
source "${XDG_CONFIG_HOME:-$HOME/.config}/asdf-direnv/zshrc"
