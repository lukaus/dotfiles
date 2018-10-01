# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
  export ZSH=/home/lukaus/.oh-my-zsh

# Set name of the theme to load. Optionally, if you set this to "random"
# it'll load a random theme each time that oh-my-zsh is loaded.
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
ZSH_THEME="darkblood"

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
# HIST_STAMPS="mm/dd/yyyy"

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

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
export EDITOR='vim'
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
alias class='cd /home/lukaus/Documents/SCHOOL/spring2017'
alias prog='cd /home/lukaus/Dropbox/PROGRAMMING/'
alias rpg='cd /home/lukaus/Dropbox/RPG/'
alias dnd='cd /home/lukaus/Documents/DnD/'
alias rang='ssh -X ranger1.cs.mtsu.edu'
alias crang='ssh -X c8095442@ranger1.cs.mtsu.edu'
alias MCS='ssh -X -i ~/Documents/us-east-minecraft.pem ec2-user@lukaus.com'
alias ll="ls -l --color=auto"
alias la="ls -a --color=auto"
alias lla="ls -l -a --color=auto"
alias bc="bc -lq"
alias cmatrix="cmatrix -C red -B"
alias REEE="espeak \"Normies get out. REEEEEEEEEEEEEEEEEEEEEEEEEEEE\""
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

alias sl="sl -e"
alias IF="echo -e \"I F I F I F    I F I F I F    I F I F I F    I F I F I F    I F I F I F    I F I F I F    \n
    I F        I F                I F        I F                I F        I F            \n
    I F        I F I F            I F        I F I F            I F        I F I F        \n
    I F        I F                I F        I F                I F        I F            \n
I F I F I F    I F            I F I F I F    I F            I F I F I F    I F            \n OKEY DOKE\""


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

alias wew="echo -e \"⢀⢀⢀⢀⢀⣤⠖⠚⠉⠉⠳⣦⢀⢀⢀⢀⢀⢀⢀⢀⣼⢀⢀⢀⢀⢀⢀⢀⢀⢀⢀⢀⢀⢀⢀⢀⢀⢀⢀⢀⢀⢀⢀⢀⢀⢀⢀⢀⣀⣀⡀⢀⢀⢀⣀⣀\n⢀⢀⢀⡴⢋⣀⡀⢀⢀⢀⢀⢻⣷⢀⢀⢀⢀⢀⢀⣼⠇⢀⢀⢀⢀⢀⢀⢀⢀⢀⢀⢀⢀⢀⢀⢀⢀⢀⢀⢀⢀⢀⢀⢀⢀⣠⣾⠿⠛⠉⠁⢀⣴⡟⠁⢀⡇⢀⢀⢀⢀⢀⢀⢀⢀⢀⢀⢀⣠⣤\n⢀⢀⠎⣰⣿⠿⣿⡄⢀⢀⢀⢸⣿⡆⢀⢀⢀⢀⣾⡿⢀⢀⢀⢀⡀⢀⢀⢀⢀⢀⢀⢀⢀⢀⢀⢀⢀⢀⢀⢀⢀⢀⢀⢀⣰⡟⠁⢀⢀⢀⢀⣾⡟⢀⢀⢀⡟⢀⢀⢀⢀⢀⢀⢀⢀⢀⢀⢠⣿⡿\n⢀⠏⢰⣿⡟⢀⣿⡇⢀⢀⢀⣿⣿⡇⢀⢀⢀⢮⣿⠇⢀⢀⢠⠞⢀⢀⢀⢀⢀⢀⢀⢀⢀⢀⢀⢀⢀⢀⢀⢀⢀⢀⢀⢰⠏⢀⢀⢀⢀⢀⣿⣿⠁⢀⢀⢸⠇⢀⢀⢀⢀⢀⢀⢀⢀⢀⢀⣼⣿⠃\n⡜⢀⣾⡿⠃⢠⣿⠁⢀⢀⢸⣿⣿⠁⢀⢀⢊⣿⡟⢀⢀⡰⠃⢀⢀⢀⢀⢀⢀⢀⢀⢀⢀⢀⢀⢀⢀⢀⢀⢀⢀⢀⢀⡿⢀⢀⢀⢀⢀⣾⣿⠇⢀⢀⢠⠏⢀⢀⢀⢀⢀⢀⢀⢀⢀⢀⢠⣿⡟\n⡇⢀⠋⢀⢀⣾⡏⢀⢀⢀⣿⣿⡏⢀⠠⠃⣾⣿⠇⢀⡴⠁⢀⢀⢀⢀⢀⢀⢀⢀⢀⢀⢀⢀⢀⢀⢀⢀⢀⢀⢀⢀⢀⡇⢀⢀⢀⢀⣼⣿⡟⢀⢀⣰⠋⢀⢀⢀⢀⢀⢀⢀⢀⢀⢀⢀⣼⣿⠁\n⠹⣄⣀⣤⣿⠟⢀⢀⢀⣾⣿⡟⢀⡐⠁⣼⣿⡟⢀⡰⣡⣶⡶⣆⢀⢀⣀⣀⢀⢀⣀⣀⢀⢀⣀⣀⢀⢀⢀⢀⢀⢀⢀⢷⢀⢀⢀⢸⣿⣿⠃⣠⠞⢁⣴⣶⣠⣶⡆⢀⢀⢀⣠⣶⣶⣰⣿⡏\n⢀⠈⠉⠉⢀⢀⢀⢀⣼⣿⡟⠁⠄⢀⢰⣿⣿⠃⣰⣿⣿⠏⢀⣿⢀⣸⣿⠏⢀⢸⣿⠃⢀⣼⣿⠇⢀⢀⢀⢀⢀⢀⢀⢀⠑⢀⢠⣿⣿⣿⠋⠁⣰⣿⡟⠁⣿⣿⢀⢀⢀⣴⣿⠟⢀⣿⡿\n⢀⢀⢀⢀⢀⢀⢀⣼⣿⠟⡀⢀⢀⢀⣿⣿⡟⢠⣿⣿⡟⢀⣰⠇⢀⣿⡿⢀⢀⣿⡏⢀⢰⣿⡏⢀⢀⢀⢀⢀⢀⢀⢀⢀⢀⢀⢰⣿⣿⠃⢀⣼⣿⡟⢀⣸⣿⠃⢀⢀⣼⣿⡏⢀⣼⣿⠃\n⢀⢀⢀⢀⢀⢀⣼⡿⠋⢀⢀⢀⢀⢸⣿⣿⠃⣿⣿⣿⠁⣰⠏⢀⣼⣿⠃⢀⣾⡿⢀⢠⣿⡟⢀⢀⢀⢀⢀⢀⢀⢀⢀⢀⢀⢀⣿⣿⡏⢀⣰⣿⣿⠁⢠⣿⡏⢀⢀⣸⣿⡿⢀⢰⣿⠇\n⢀⢀⢀⢀⢀⣾⣟⠕⠁⢀⢀⢀⢀⢸⣿⣿⣼⣿⣿⡿⠊⠁⣰⢣⣿⡟⢀⣰⣿⠃⢀⣾⣿⠁⡼⢀⢀⢀⣰⡾⠿⠿⣿⣶⣦⣾⣿⡟⢀⢀⣿⣿⡇⢀⣾⡿⢀⡞⢰⣿⣿⠇⢠⣿⡟⢠⡏\n⢀⢀⢀⢠⣾⡿⠁⢀⢀⢀⢀⢀⢀⢸⣿⣿⠃⣿⣿⢀⢀⡴⠃⣾⣿⣧⣰⣿⣿⣄⣾⣿⣧⡼⠁⢀⢀⢀⣿⢀⢀⢀⢀⢹⣿⣿⣟⢀⢀⢸⣿⣿⣧⣾⣿⣷⡾⠁⣼⣿⣿⣤⣿⣿⣷⡟\n⢀⢀⢀⠟⠉⢀⢀⢀⢀⢀⢀⢀⢀⢀⠻⠋⢀⢿⣿⣶⠟⠁⢀⠻⣿⡿⠛⣿⣿⠏⢿⣿⠟⠁⢀⢀⢀⢀⠘⠦⣤⣤⡶⠟⢻⣿⣿⢀⢀⠘⣿⣿⠋⢿⣿⠟⢀⢀⠸⣿⡿⠋⣿⣿⠏\n⢀⢀⢀⢀⢀⢀⢀⢀⢀⢀⢀⢀⢀⢀⢀⢀⢀⢀⢀⢀⢀⢀⢀⢀⢀⢀⢀⢀⢀⢀⢀⢀⢀⢀⢀⢀⢀⢀⢀⢀⢀⢀⢀⢀⢀⢿⣿⣇⢀⢀⢀⢀⢀⢀⢀⢀⢀⢀⢀⣀⣠⣤⣤⣤⣤⣀⡀\n⢀⢀⢀⢀⢀⢀⢀⢀⢀⢀⢀⢀⢀⢀⢀⢀⢀⢀⢀⢀⢀⢀⢀⢀⢀⢀⢀⢀⢀⢀⢀⢀⢀⢀⢀⢀⢀⢀⢀⢀⢀⢀⢀⢀⢀⠈⢿⣿⣆⢀⢀⢀⢀⢀⢀⣠⡤⠶⠛⠛⠛⠻⢿⣿⣿⣿⣿⣶⣄\n⢀⢀⢀⢀⢀⢀⢀⢀⢀⢀⢀⢀⢀⢀⢀⢀⢀⢀⢀⢀⢀⢀⢀⢀⢀⢀⢀⢀⢀⢀⢀⢀⢀⢀⢀⢀⢀⢀⢀⢀⢀⢀⢀⢀⢀⢀⢀⠙⠿⣷⣤⣤⠶⠞⠋⠁⢀⢀⢀⢀⢀⢀⠈⠻⠛⠉⠉⠉⠙⠂\n\""


echo 'Access granted.'
echo "                 .\"-,.__
                 \`.     \`.  ,
              .--'  .._,'\"-' \`.
             .    .'         \`'
             \`.   /          ,'
               \`  '--.   ,-\"'
                \`\"\`   |  \\
                   -. \\, |
                    \`--Y.'      ___.
                         \\     L._, \\
               _.,        \`.   <  <\\                _
             ,' '           \`, \`.   | \\            ( \`
          ../, \`.            \`  |    .\\\`.           \\ \\_
         ,' ,..  .           _.,'    ||\\l            )  '\".
        , ,'   \\           ,'.-.\`-._,'  |           .  _._\`.
      ,' /      \\ \\        \`' ' \`--/   | \\          / /   ..\\
    .'  /        \\ .         |\\__ - _ ,'\` \`        / /     \`.\`.
    |  '          ..         \`-...-\"  |  \`-'      / /        . \`.
    | /           |L__           |    |          / /          \`. \`.
   , /            .   .          |    |         / /             \` \`
  / /          ,. ,\`._ \`-_       |    |  _   ,-' /               \` \\
 / .           \\\"\`_/. \`-_ \\_,.  ,'    +-' \`-'  _,        ..,-.    \\\`.
  '         .-f    ,'   \`    '.       \\__.---'     _   .'   '     \\ \\
' /          \`.'    l     .' /          \\..      ,_|/   \`.  ,'\`     L\`
|'      _.-\"\"\` \`.    \\ _,'  \`            \\ \`.___\`.'\"\`-.  , |   |    | \\
||    ,'      \`. \`.   '       _,...._        \`  |    \`/ '  |   '     .|
||  ,'          \`. ;.,.---' ,'       \`.   \`.. \`-'  .-' /_ .'    ;_   ||
|| '              V      / /           \`   | \`   ,'   ,' '.    !  \`. ||
||/            _,-------7 '              . |  \`-'    l         /    \`||
 |          ,' .-   ,' ||               | .-.        \`.      .'     ||
 \`'        ,'    \`\".'    |               |    \`.        '. -.'       \`'
          /      ,'      |               |,'    \\-.._,.'/'
          .     /        .               .       \\    .''
        .\`.    |         \`.             /         :_,'.'
          \\ \`...\\   _     ,'-.        .'         /_.-'
           \`-.__ \`,  \`'   .  _.>----''.  _  __  /
                .'        /\"'          |  \"'   '_
               /_|.-'\\ ,\".             '.'\`__'-( \\
                 / ,\"'\"\\,'               \`/  \`-.|\" mh"

