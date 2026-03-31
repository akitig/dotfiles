# Editor
export EDITOR=vim

# Java
export PATH="/opt/homebrew/opt/openjdk/bin:$PATH"

# Git prompt
source ~/.zsh/git-prompt.sh

# Git completion
fpath=(~/.zsh $fpath)
zstyle ':completion:*:*:git:*' script ~/.zsh/git-completion.bash
autoload -Uz compinit && compinit

# Git prompt options
GIT_PS1_SHOWDIRTYSTATE=true
GIT_PS1_SHOWUNTRACKEDFILES=true
GIT_PS1_SHOWSTASHSTATE=true
GIT_PS1_SHOWUPSTREAM=auto

# Prompt
PROMPT="🔹 %2~%{$reset_color%} %(?:%{$fg[green]%}> %{$reset_color%}:%{$fg[red]%}> %{$reset_color%})"
RPROMPT="$(git config user.name) $(__git_ps1 '(%s)')"

ZSH_THEME_GIT_PROMPT_PREFIX="%{$fg[blue]%}git:(%{$fg[red]%}"
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%} "
ZSH_THEME_GIT_PROMPT_DIRTY="%{$fg[blue]%}) %{$fg[yellow]%}✗"
ZSH_THEME_GIT_PROMPT_CLEAN="%{$fg[blue]%})"

# Aliases
alias ll='ls -lah'
alias la='ls -A'
# alias ..='cd ..'
# alias ...='cd ../..'

# alias gs='git status'
# alias ga='git add'
# alias gc='git commit'
# alias gp='git push'
# alias gl='git log --oneline --graph --decorate'

# History
HISTSIZE=100000
SAVEHIST=100000
setopt hist_ignore_dups
setopt share_history
