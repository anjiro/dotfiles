set -o vi

. ~/.prompt
. ~/.alias

export PATH=$HOME/bin:/usr/local/bin:/usr/local/sbin:$HOME/Library/Python/2.7/bin:$PATH
export EDITOR=/usr/local/bin/vim

case "$OSTYPE" in darwin*)
	export PATH=$PATH:/usr/texbin
	[[ -r "/usr/local/etc/profile.d/bash_completion.sh" ]] && . "/usr/local/etc/profile.d/bash_completion.sh"
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

#Only update Homebrew along with brew commands once a day
export HOMEBREW_AUTO_UPDATE_SECS=86400

# tabtab source for serverless package
# uninstall by removing these lines or running `tabtab uninstall serverless`
[ -f /usr/local/lib/node_modules/serverless/node_modules/tabtab/.completions/serverless.bash ] && . /usr/local/lib/node_modules/serverless/node_modules/tabtab/.completions/serverless.bash
# tabtab source for sls package
# uninstall by removing these lines or running `tabtab uninstall sls`
[ -f /usr/local/lib/node_modules/serverless/node_modules/tabtab/.completions/sls.bash ] && . /usr/local/lib/node_modules/serverless/node_modules/tabtab/.completions/sls.bash
# tabtab source for slss package
# uninstall by removing these lines or running `tabtab uninstall slss`
[ -f /usr/local/lib/node_modules/serverless/node_modules/tabtab/.completions/slss.bash ] && . /usr/local/lib/node_modules/serverless/node_modules/tabtab/.completions/slss.bash