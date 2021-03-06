# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

# If not running interactively, don't do anything
[ -z "$PS1" ] && return

# don't put duplicate lines in the history. See bash(1) for more options
# ... or force ignoredups and ignorespace
HISTCONTROL=ignoredups:ignorespace

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=1000
HISTFILESIZE=2000

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "$debian_chroot" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

# set a fancy prompt (non-color, unless we know we "want" color)
case "$TERM" in
    xterm-color) color_prompt=yes;;
esac

# uncomment for a colored prompt, if the terminal has the capability; turned
# off by default to not distract the user: the focus in a terminal window
# should be on the output of commands, not on the prompt
#force_color_prompt=yes

if [ -n "$force_color_prompt" ]; then
    if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then
	# We have color support; assume it's compliant with Ecma-48
	# (ISO/IEC-6429). (Lack of such support is extremely rare, and such
	# a case would tend to support setf rather than setaf.)
	color_prompt=yes
    else
	color_prompt=
    fi
fi

if [ "$color_prompt" = yes ]; then
    PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '
else
    PS1='${debian_chroot:+($debian_chroot)}\u@:\W\$ '
fi
unset color_prompt force_color_prompt

# If this is an xterm set the title to user@host:dir
case "$TERM" in
xterm*|rxvt*)
    PS1="\[\e]0;${debian_chroot:+($debian_chroot)}\u@\h: \w\a\]$PS1"
    ;;
*)
    ;;
esac

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    #alias dir='dir --color=auto'
    #alias vdir='vdir --color=auto'

    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

# some more ls aliases
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'

# Alias definitions.
# You may want to put all your additions into a separate file like
# ~/.bash_aliases, instead of adding them here directly.
# See /usr/share/doc/bash-doc/examples in the bash-doc package.

if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if [ -f /etc/bash_completion ] && ! shopt -oq posix; then
    . /etc/bash_completion
fi


export GTK_IM_MODULE=ibus
export XMODIFIERS=@im=ibus
export QT_IM_MODULE=ibus

export LARCH_PATH=/usr/local/splint/share/splint/lib
export LCLIMPORTDIR=/usr/local/splint/share/splint/import
export PATH=/usr/local/splint/bin/splint:$PATH

# more alias
alias install='echo `getvalue root` | sudo apt-get install'
alias ..='cd ..'
alias ...='cd ../..'
alias ls='ls -CF --color=auto'
alias cp='cp -rf'


# tools path
export TOOLS_PATH=/home/anton/tools
export USR_TOOLS_PATH=/home/anton/usr
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

export PATH=/home/anton/tools/shell:$PATH
export PATH=/home/anton/tools/shell/git:$PATH
export PATH=/home/anton/tools/exec:$PATH
export PATH=~/etc/clang/bin:$PATH

# add default search path
# 增加.a搜索路径
export LIBRARY_PATH=$LIBRARY_PATH:~/usr/lib
export LIBRARY_PATH=$LIBRARY_PATH:~/etc/clang/lib
#增加.so搜索路径
export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:~/usr/lib
export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:~/etc/clang/lib
#增加GCC的include文件搜索路径
export C_INCLUDE_PATH=$C_INCLUDE_PATH:~/usr/include
export C_INCLUDE_PATH=$C_INCLUDE_PATH:~/etc/clang/include
export C_INCLUDE_PATH=$C_INCLUDE_PATH:/usr/include/ 

