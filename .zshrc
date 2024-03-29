# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH=/Users/hcastano/.oh-my-zsh

# Set name of the theme to load. Optionally, if you set this to "random"
# it'll load a random theme each time that oh-my-zsh is loaded.
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
ZSH_THEME="robbyrussell"

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

# I don't want any prompt indications of the mode I'm in (e.g little arrows indicating
# that I'm in `normal` mode) since a) I don't use them and b) they glitch out with
# the Starship prompt
MODE_INDICATOR=""
MODE_CURSOR_VIINS="#00ff00 blinking bar"
VIM_MODE_VICMD_KEY='jk'
KEYTIMEOUT=10

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git zsh-syntax-highlighting zsh-nvm zsh-vim-mode cargo)

source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='vim'
else
  export EDITOR='nvim'
fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/rsa_id"

# Use this for `ssh-agent`
export PATH="/usr/local/opt/gnupg@2.2/bin:$PATH"
export SSH_AUTH_SOCK=$(gpgconf --list-dirs agent-ssh-socket)

# gpg
export GPG_TTY=$(tty)

agent_active=$(ps aux | grep "gpg-agent" | grep -v grep)
if [ -z "$agent_active" ]
then
    echo "Starting GPG Agent"
    eval $( gpg-agent --daemon --enable-ssh-support )
fi

export BAT_THEME="Nord"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"
# source /Users/hcastano/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
alias vim="nvim"
alias vimwiki="nvim ~/.vimwiki/index.wiki"
alias vimconfig="nvim ~/.vimrc"
alias zshconfig="nvim ~/.zshrc"

alias ls="exa"
alias l="exa -l"
alias la="exa -la"
alias lg="exa -l --git"
alias lag="exa -la --git"

# GitHub CLI aliases
alias ghco="gh pr checkout"

# ASCII art weather report!
alias weather="curl wttr.in/toronto"

# Aliases for Cargo Remote
r() {
    cargo remote -r "bob-the-builder" -- $1 -p $2 
}

# Use `fd` instead of `find` if it's available (much faster)
if [ -x "$(command -v fd)" ]; then
    # Note: By default we don't follow hidden files or .gitignores
    export FZF_DEFAULT_COMMAND='fd --type f'

    # To apply the command to CTRL-T as well
    export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
fi

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

fpath+=~/.zfunc

test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"

eval "$(starship init zsh)"
