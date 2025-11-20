# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="/Users/connor/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="af-magic"

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in $ZSH/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to automatically update without prompting.
# DISABLE_UPDATE_PROMPT="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS="true"

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# Caution: this setting can cause issues with multiline prompts (zsh 5.7.1 and newer seem to work)
# See https://github.com/ohmyzsh/ohmyzsh/issues/5765
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git jsontools macos z encode64 node zsh-syntax-highlighting zsh-autosuggestions ohmyzsh-full-autoupdate vscode hacker-quotes pnpm)

source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

alias ls="ls -l"
alias src="source ~/.zshrc"
alias work="cd ~/documents/github"
alias ip="ifconfig en0 | grep inet | grep -v inet6 | cut -d ' ' -f2"
alias gitignore="curl -o .gitignore http://gitignore.io/api/node,macos,jetbrains"
alias cat="bat"
alias pn="pnpm"
alias r="rails"
alias tf="terraform"

lazygit () {
  git add .
  git commit -m "$1"
  git push --set-upstream origin $(git branch | grep \* | cut -d ' ' -f2)
}

lazyreset() {
  git add .
  git reset --hard
}

weather () {
  curl -S wttr.in/$1
}

cls () {
  clear
}

killport() {
  pid=$(lsof -i tcp:"$1" | grep 'node' | grep 'LISTEN' | awk '{print $2}')

  if [ -z "$pid" ]
    then return 0
  fi

  kill -9 "$pid"
  print "Killed $pid running on $1"
}

fixzsh() {
  sed -i '' '/^[^:]/d' ~/.zsh_history
  awk '!seen[$0]++' ~/.zsh_history > ~/.zsh_history.tmp && mv ~/.zsh_history.tmp ~/.zsh_history
  fc -R ~/.zsh_history
  src
}

tc () {
  pnpm tsc --noEmit
}

# Exports
export GIT_MERGE_AUTOEDIT=no
export PATH=$PATH:~/.local/bin
export RPROMPT=""

# Brew
export PATH=/opt/homebrew/bin:$PATH
export PATH="/opt/homebrew/opt/llvm/bin:$PATH"

# pnpm
export PNPM_HOME="/Users/connorstevens/Library/pnpm"
export PATH="$PNPM_HOME:$PATH"
# pnpm end

export ZSH_HIGHLIGHT_HIGHLIGHTERS_DIR=/opt/homebrew/share/zsh-syntax-highlighting/highlighters
source /Users/connor/documents/github/me/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# Go
export PATH=$PATH:/usr/local/go/bin
export PATH=$PATH:~/go/bin

# mySQL
export PATH=$PATH:/usr/local/mysql/bin

export NVM_DIR="$HOME/.nvm"

export PATH="/opt/homebrew/opt/pnpm@9/bin:$PATH"

eval "$(mise activate zsh)"

export LDFLAGS="-L/opt/homebrew/opt/libpq/lib"
export CPPFLAGS="-I/opt/homebrew/opt/libpq/include"
export PATH="/opt/homebrew/opt/libpq/bin:$PATH"
export OBJC_DISABLE_INITIALIZE_FORK_SAFETY=YES

export PATH=$PATH:/Users/connor/.spicetify
export PATH="/opt/homebrew/opt/libpq/bin:$PATH"
export PGGSSENCMODE=disable

export AWS_CA_BUNDLE=/etc/ssl/cert.pem

