set -o vi

[ "$PS1" -a -f /etc/bash_completion ] && . /etc/bash_completion

. ~/.prompt
. ~/.alias

export PATH=$HOME/bin:/usr/local/bin:/usr/local/sbin:/usr/local/Cellar/ccache/3.1.7/libexec:/usr/local/share/npm/bin:$PATH
export EDITOR=/usr/local/bin/vim

case "$OSTYPE" in darwin*)
	export PATH=$PATH:/usr/texbin
  if [ -f $(brew --prefix)/share/bash-completion/bash_completion ]; then
    . $(brew --prefix)/share/bash-completion/bash_completion
  fi
	;;
esac

export HISTCONTROL=erasedups
export HISTSIZE=10000
shopt -s histappend
shopt -s cmdhist  #store multi-line commands as single lines
shopt -s cdspell  #correct minor spelling errors in cd commands

shopt -s extglob  #allow negative ls: ls !(*.pyc)
# ?(pattern-list) Matches zero or one occurrence of the given patterns
# *(pattern-list) Matches zero or more occurrences of the given patterns
# +(pattern-list) Matches one or more occurrences of the given patterns
# @(pattern-list) Matches one of the given patterns
# !(pattern-list) Matches anything except one of the given patterns

export PAGER="less -XR"  #prevent screen clear after exit, keep colors

#export LANG=C

#Application-specific exports
export PERL5LIB=$PERL5LIB:$HOME/data/perl/tk:$HOME/data/perl
export PYTHONPATH=$HOME/data/python/modules:$PYTHONPATH
export NODE_PATH=/usr/local/lib/node_modules
export ANDROID_HOME=/Applications/android-sdk-macosx
export ANDROID_NDK_ROOT=/Applications/android-sdk-macosx/android-ndk-r10d

export GREP_OPTIONS='--color=auto'
export GREP_COLOR='33'

export PYOPENCL_CTX=':1'

export NVM_DIR="/Users/dlaics/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm
source /usr/local/etc/bash_completion.d/po
