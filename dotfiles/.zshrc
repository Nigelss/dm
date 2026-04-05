#
# ~/.bashrc
#
# If not running interactively, don't do anything


[[ $- != *i* ]] && return

ZINIT_HOME="${XDG_DATA_HOME:-${HOME}/.local/share}/zinit/zinit.git"
[ ! -d $ZINIT_HOME ] && mkdir -p "$(dirname $ZINIT_HOME)"
[ ! -d $ZINIT_HOME/.git ] && git clone https://github.com/zdharma-continuum/zinit.git "$ZINIT_HOME"

PATH=$(printf %s "$PATH" | awk -vRS=: '!a[$0]++' | paste -s -d:)

source "${ZINIT_HOME}/zinit.zsh"

zinit light zsh-users/zsh-syntax-highlighting

ZSH_HIGHLIGHT_STYLES[command]='fg=cyan,bold'
ZSH_HIGHLIGHT_STYLES[alias]='fg=cyan,bold'
ZSH_HIGHLIGHT_STYLES[builtin]='fg=cyan,bold'
ZSH_HIGHLIGHT_STYLES[function]='fg=cyan,bold'
ZSH_HIGHLIGHT_STYLES[reserved-word]='fg=blue,bold'
ZSH_HIGHLIGHT_STYLES[path]='fg=white'
ZSH_HIGHLIGHT_STYLES[unknown-token]='fg=red,bold'

zinit light zsh-users/zsh-completions

bindkey -e
bindkey '^p' history-search-backward
bindkey '^n' history-search-forward


autoload -Uz compinit
compinit

zinit cdreplay -q

HISTSIZE=5000
HISTFILE=~/.zsh_history
SAVEHIST=$HISTSIZE
HISTDUP=erase

setopt appendhistory 
setopt sharehistory 
setopt hist_ignore_space
setopt hist_ignore_all_dups
setopt hist_save_no_dups
setopt hist_ignore_dups
setopt hist_ignore_dups
setopt hist_find_no_dups

eval "$(dircolors -b)"
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'
zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"

alias ls='eza -G --icons --color auto'
alias grep='grep --color=auto'
alias s@='source /home/nigel/.zshrc'
alias yeet='yay -Rc'
alias hl='rg --passthru'
#git aliases
alias clone='git clone'
alias push='git push'
alias pull='git pull'
alias merge='git merge'
alias status='git status'
alias diff='git diff'
alias mit='git commit'
alias add='git add'
alias gaa='git add -A'
alias empty='git commit --allow-empty-message -m "" '
alias switch='git switch'
alias branch='git branch'
alias worktree='git worktree' 
alias rebase='git rebase'
alias repo-gen='gh repo create --source=. --private --remote origin'
alias ff='yazi'
alias c='clear'
alias py='python'
# alias vi="TERM=tmux-direct emacsclient -t -a ''"
alias vi="nvim"
alias log='git log --oneline --graph --decorate'
alias gdb='gdb -q'

alias battery='cat /sys/class/power_supply/BAT0/capacity'
# PS1='[\u@\h \W]\$ '

export MANPAGER="nvim +Man!"
export PATH=/usr/local/texlive/2025/bin/x86_64-linux:$PATH
export EDITOR="nvim"
export FZF_DEFAULT_OPTS="--bind=alt-n:down,alt-p:up"
# export VISUAL="emacsclient -c -a emacs"

eval "$(starship init zsh)"
eval "$(fzf --zsh)"
eval "$(zoxide init zsh --cmd cd)"

[[ -f "/home/nigel/.modules" ]] && source "/home/nigel/.modules"

eval "$(ssh-agent -s)" > /dev/null

# test -z "$TMUX" && (tmux attach || tmux new-session)

fzf-and-run-widget() {
  fzf-history-widget
  zle accept-line
}

zle     -N   fzf-and-run-widget
bindkey '^[r' fzf-and-run-widget

# complete -cf sudo
# complete -cf man
rfkill unblock all
