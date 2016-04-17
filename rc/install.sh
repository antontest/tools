#! /bin/bash
# Name : install.sh
# Func : 
# Time : 2016-04-11 20:29:46

test ! -L ~/.zshrc && ln -sf `pwd`/.zshrc ~/.zshrc 
test ! -L ~/.bashrc && ln -sf `pwd`/.bashrc ~/.bashrc 
