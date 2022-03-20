# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
bindkey -v
# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle :compinstall filename '/home/chris/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall

export DOT_REPO="https://github.com/leggettc18/dotfiles.git"
export DOT_DIR="$HOME/.dotfiles"
fpath=($HOME/.zsh/dot $fpath)  # <- for completion
source $HOME/.zsh/dot/dot.sh
source ~/.zsh/powerlevel10k/powerlevel10k.zsh-theme

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

if type exa &> /dev/null; then
	alias ll="exa -l -g --icons"
	alias lla="ll -a"
fi

# Functions
peco_change_directory() {
	cd $(ls -d $HOME/Projects/* | peco --layout=bottom-up)
    zle accept-line
}
zle -N peco_change_directory

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
        peco ${=ZSH_PECO_HISTORY_OPTS} --query "$LBUFFER")
    
    CURSER=$#BUFFER
    zle -R -c
}
zle -N peco_select_history

# Set keybindings
bindkey "^l" forward-char
bindkey "^k" backward-char
bindkey "^d" delete-char
bindkey "^f" peco_change_directory
bindkey "^r" peco_select_history
