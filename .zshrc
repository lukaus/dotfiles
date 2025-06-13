#voice.channel you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH
export PATH=$PATH:/usr/local/go/bin
path+=('/home/lukaus/.cargo/bin')


# Command timer for prompt
setopt PROMPT_SUBST
autoload -Uz add-zsh-hook

# record start time
timer_preexec() {
  TIMER_START=$(date +%s%N)
}
add-zsh-hook preexec timer_preexec

timer_precmd() {
  if [[ -n $TIMER_START ]]; then
    local now=$(date +%s%N)
    local delta_ns=$(( now - TIMER_START ))
    unset TIMER_START

    # convert to integer milliseconds
    local delta_ms=$(( delta_ns / 1000000 ))

    if (( delta_ms < 5000 )); then
      # under 5 s → only ms
      LAST_CMD_DUR="${delta_ms}ms"

    elif (( delta_ms < 60000 )); then
      # 5 s–1 min → seconds + ms
      local sec=$(( delta_ms / 1000 ))
      local rem_ms=$(( delta_ms % 1000 ))
      LAST_CMD_DUR="${sec}s${rem_ms}ms"

    else
      # 1 min or more → minutes + seconds + ms
      local total_s=$(( delta_ms / 1000 ))
      local mins=$(( total_s / 60 ))
      local secs=$(( total_s % 60 ))
      local rem_ms=$(( delta_ms % 1000 ))
      LAST_CMD_DUR="${mins}m${secs}s${rem_ms}ms"
    fi
  fi

}
add-zsh-hook precmd timer_precmd
  

# Path to your oh-my-zsh installation.
export ZSH=/home/lukaus/.oh-my-zsh

# Set name of the theme to load. Optionally, if you set this to "random"
# it'll load a random theme each time that oh-my-zsh is loaded.
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
ZSH_THEME="darkblood-datetimer"

# Set list of themes to load
# Setting this variable when ZSH_THEME=random
# cause zsh load theme from this variable instead of
# looking in ~/.oh-my-zsh/themes/
# An empty array have no effect
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion. Case
# sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
#HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(
  git
)

source $ZSH/oh-my-zsh.sh

# User configuration 

setopt EXTENDED_HISTORY

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
export EDITOR='nvim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/rsa_id"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

TERM="xterm-256color"
today=$(/usr/bin/date +'%Y-%m-%d')

alias dev='tmux a -t dev'
alias ll="ls -l --color=auto"
alias la="ls -a --color=auto"
alias lla="ls -l -a --color=auto"
alias odiff="/usr/bin/diff"
alias diff="icdiff -N"
alias vim="nvim"
alias ovim="/usr/bin/vim"
alias bc="bc -lq"
alias mycli="mycli --no-warn"
alias rip="echo -e \"              _|_
               |
            ___|___
           /       \\\ 
          |         |
          |  R.I.P. |
          |         |
          |         |
          |         |
          |         |
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~\""


alias ayy="echo -e \"\n\e[32m░░░░█▒▒▄▀▀▀▀▀▄▄▒▒▒▒▒▒▒▒▒▄▄▀▀▀▀▀▀▄
░░▄▀▒▒▒▄█████▄▒█▒▒▒▒▒▒▒█▒▄█████▄▒█
░█▒▒▒▒▐██▄████▌▒█▒▒▒▒▒█▒▐██▄████▌▒█
▀▒▒▒▒▒▒▀█████▀▒▒█▒░▄▒▄█▒▒▀█████▀▒▒▒█
▒▒▐▒▒▒░░░░▒▒▒▒▒█▒░▒▒▀▒▒█▒▒▒▒▒▒▒▒▒▒▒▒█
▒▌▒▒▒░░░▒▒▒▒▒▄▀▒░▒▄█▄█▄▒▀▄▒▒▒▒▒▒▒▒▒▒▒▌
▒▌▒▒▒▒░▒▒▒▒▒▒▀▄▒▒█▌▌▌▌▌█▄▀▒▒▒▒▒▒▒▒▒▒▒▐
▒▐▒▒▒▒▒▒▒▒▒▒▒▒▒▌▒▒▀███▀▒▌▒▒▒▒▒▒▒▒▒▒▒▒▌
▀▀▄▒▒▒▒▒▒▒▒▒▒▒▌▒▒▒▒▒▒▒▒▒▐▒▒▒▒▒▒▒▒▒▒▒█
▀▄▒▀▄▒▒▒▒▒▒▒▒▐▒▒▒▒▒▒▒▒▒▄▄▄▄▒▒▒▒▒▒▄▄▀
▒▒▀▄▒▀▄▀▀▀▄▀▀▀▀▄▄▄▄▄▄▄▀░░░░▀▀▀▀▀▀
▒▒▒▒▀▄▐▒▒▒▒▒▒▒▒▒▒▒▒▒▐
░▄▄▄░░▄░░▄░▄░░▄░░▄░░░░▄▄░▄▄░░░▄▄▄░░░▄▄▄
█▄▄▄█░█▄▄█░█▄▄█░░█░░░█░░█░░█░█▄▄▄█░█░░░█
█░░░█░░█░░░░█░░░░█░░░█░░█░░█░█░░░█░█░░░█
▀░░░▀░░▀░░░░▀░░░░▀▀▀░░░░░░░░░▀░░░▀░▀▄▄▄▀﻿\n\""

shiny=$((1 + $RANDOM % 10))
if [[ "$shiny" == "1" ]]; then
    echo -n "Shiny "
    pokeget random -s
else
    pokeget random
fi


echo 'Access granted.\n\nWelcome to $(hostname)\n'
