set -o vi

[ "$PS1" -a -f /etc/bash_completion ] && . /etc/bash_completion

. ~/.prompt
. ~/.alias

export PATH=$HOME/bin:/usr/local/bin:/usr/local/sbin:/usr/local/Cellar/ccache/3.1.7/libexec:/usr/local/share/npm/bin:$PATH
export PATH=$PATH:/Applications/Android_SDK/sdk/platform-tools 
export EDITOR=vi

case "$OSTYPE" in darwin*)
	export PATH=$PATH:/usr/texbin
	if [ -f `brew --prefix`/etc/bash_completion ]; then
		. `brew --prefix`/etc/bash_completion
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

export PERL5LIB=$PERL5LIB:$HOME/data/perl/tk:$HOME/data/perl
export LANG=C
export PYTHONPATH=$HOME/data/python/modules:$PYTHONPATH:/usr/local/lib/python2.7/site-packages

export GREP_OPTIONS='--color=auto'
export GREP_COLOR='33'

export PATH="/Applications/microchip/xc8/v1.20/bin":$PATH
export PATH=$HOME/data/projects/pebble/PebbleSDK-current/bin:$PATH


#Prevent pip errors
export CFLAGS=-Qunused-arguments
export CPPFLAGS=-Qunused-arguments
