# ~/.profile: executed by the command interpreter for login shells.
# This file is not read by bash(1), if ~/.bash_profile or ~/.bash_login
# exists.
# see /usr/share/doc/bash/examples/startup-files for examples.
# the files are located in the bash-doc package.

# the default umask is set in /etc/profile; for setting the umask
# for ssh logins, install and configure the libpam-umask package.
#umask 022

# if running bash
if [ -n "$BASH_VERSION" ]; then
    # include .bashrc if it exists
    if [ -f "$HOME/.bashrc" ]; then
	. "$HOME/.bashrc"
    fi
fi

# set PATH so it includes user's private bin if it exists
if [ -d "$HOME/bin" ] ; then
    PATH="$HOME/bin:$PATH"
fi

# tools path
export TOOLS_PATH=/home/anton/tools
export CMAKE_PATH=$TOOLS_PATH/cmake
export EXEC_PATH=$TOOLS_PATH/exec
export LIB_PATH=$TOOLS_PATH/lib
export INCLUDE_PATH=$TOOLS_PATH/include
export MAKEFILE_PATH=$TOOLS_PATH/makefile
export SHELL_PATH=$TOOLS_PATH/shell/
export C_SRC_TMP_PATH=$TOOLS_PATH/templates/c/src
export C_HEAD_TMP_PATH=$TOOLS_PATH/templates/c/head
export SHELL_TMP_PATH=$TOOLS_PATH/templates/shell
export SHELL_FUNC_PATH=$TOOLS_PATH/templates/shell/func
export CONF_PATH=$TOOLS_PATH/conf
export TAGS_PATH=$TOOLS_PATH/include
export CSCOPE_PATH=$TOOLS_PATH/include
export EXEC_LD_PATH=$SHELL_PATH:$EXEC_PATH
