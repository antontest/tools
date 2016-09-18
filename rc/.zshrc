# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
# ZSH_THEME="robbyrussell"
# ZSH_THEME="myzsh"
ZSH_THEME="candy-kingdom"

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
plugins=(git vi svn zsh-syntax-highlighting zsh-completions autojump)
plugins+=(man vim colored-man-pages tmux)
# plugins+=(incr)

# User configuration

export PATH="$HOME/.autojump/bin:$HOME/.autojump/bin:$HOME/bin:/usr/local/bin:$HOME/bin:/usr/local/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/usr/local/games"
# export MANPATH="/usr/local/man:$MANPATH"

source $ZSH/oh-my-zsh.sh

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

# ssh
# export SSH_KEY_PATH="~/.ssh/dsa_id"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

# tools path
export TOOLS_PATH=$HOME/tools
export USR_TOOLS_PATH=$HOME/usr
export CMAKE_PATH=$TOOLS_PATH/cmake
export EXEC_PATH=$TOOLS_PATH/exec
export LIB_PATH=$TOOLS_PATH/lib
export INCLUDE_PATH=$USR_TOOLS_PATH/include
export MAKEFILE_PATH=$TOOLS_PATH/makefile
export SHELL_PATH=$TOOLS_PATH/shell/
export C_SRC_TMP_PATH=$TOOLS_PATH/templates/c/src
export C_HEAD_TMP_PATH=$TOOLS_PATH/templates/c/head
export SHELL_TMP_PATH=$TOOLS_PATH/templates/shell
export SHELL_FUNC_PATH=$TOOLS_PATH/templates/shell/func
export CONF_PATH=$TOOLS_PATH/conf
export TAGS_PATH=$USR_TOOLS_PATH/include
export CSCOPE_PATH=$USR_TOOLS_PATH/include
export EXEC_LD_PATH=$SHELL_PATH:$EXEC_PATH

export CLASS_PATH=$HOME/program/c/class
export UTILS_INCLUDE=$CLASS_PATH/utils/src/include
export THREAD_INCLUDE=$CLASS_PATH/thread/src/include

export USR_LIB_PATH=$HOME/usr/lib
export USR_INC_PATH=$HOME/usr/include
export USR_BIN_PATH=$HOME/usr/bin

export PATH=$HOME/tools/shell:$PATH
export PATH=$HOME/tools/shell/git:$PATH
export PATH=$HOME/tools/exec:$PATH
export PATH=~/etc/clang/bin:$PATH
export PATH=~/usr/bin:$PATH
export PATH=$HOME/etc/jdk1.7.0_79/bin:$PATH
export CLASSPATH=$HOME/etc/jdk1.7.0_79/lib:.:$CLASSPATH
export JAVA_HOME=$HOME/etc/jdk1.7.0_79
export TERM=screen-256color
# export TERM=xterm-256color

# add default search path
# 增加.a搜索路径
export LIBRARY_PATH=$LIBRARY_PATH:~/usr/lib
export LIBRARY_PATH=$LIBRARY_PATH:~/etc/clang/lib
#增加.so搜索路径
export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:~/usr/lib/
export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:~/etc/clang/lib
#增加GCC的include文件搜索路径
export C_INCLUDE_PATH=$C_INCLUDE_PATH:~/usr/include:$UTILS_INCLUDE:$THREAD_INCLUDE
export C_INCLUDE_PATH=$C_INCLUDE_PATH:~/etc/clang/include
export C_INCLUDE_PATH=$C_INCLUDE_PATH:/usr/include/ 
export C_INCLUDE_PATH=$C_INCLUDE_PATH:~/usr/incs 
export SSLKEYLOGFILE=/home/anton/.sslkeylog.txt

#[[ -s ~/.autojump/etc/profile.d/autojump.zsh ]] && . ~/.autojump/etc/profile.d/autojump.zsh
[[ -s ~/.autojump/share/autojump/autojump.zsh ]] && . ~/.autojump/share/autojump/autojump.zsh
autoload -U compinit && compinit

# go
export GOROOT=$HOME/.go
export GOBIN=$GOROOT/bin
export GOARCH=386
export GOOS=linux
export PATH=$GOROOT/bin:$PATH
export GOPATH=$GOBIN
export PATH=$PATH:$GOPATH/bin

# some more ls aliases
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'
alias sz='source $HOME/.zshrc'
alias install='sudo apt-get install'
alias ..='cd ..'
alias ...='cd ../..'
alias cp='cp -r'
alias pdfviewer='evince -f '
alias filebrower='ranger'
alias tmux="tmux -2"
