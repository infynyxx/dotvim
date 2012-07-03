if [ -f `brew --prefix`/etc/bash_completion.d/git-completion.bash  ]; then
      . `brew --prefix`/etc/bash_completion.d/git-completion.bash 
fi

# http://b.sricola.com/post/16174981053/bash-autocomplete-for-ssh
complete -W "$(echo $(grep '^ssh ' ~/.bash_history | sort -u | sed 's/^ssh //'))" ssh

#alias 6g='~/src/go/bin/6g'
#alias 6l='~/src/go/bin/6l'

function parse_git_branch () {
    git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
}

RED="\[\033[0;31m\]"
YELLOW="\[\033[0;33m\]"
GREEN="\[\033[0;32m\]"
NO_COLOUR="\[\033[0m\]"

PS1="$GREEN\u@\h$NO_COLOUR:\w$YELLOW\$(parse_git_branch)$NO_COLOUR\$ "

alias mongod='~/mongodb/bin/mongod --fork --logpath /data/db/db.log --quiet --dbpath /data/db --rest'
alias mongo='~/mongodb/bin/mongo'
alias clojure-console="cd ~/src/clojure-1.3.0/ && java -cp jline-0.9.94.jar:clojure-1.3.0.jar jline.ConsoleRunner clojure.main"

export NODE_PATH=/Users/praj/node_modules
export HADOOP_INSTALL=/Users/praj/hadoop-1.0.0
export ZOOPER_INSTALL=/Users/praj/zookeeper-3.4.3

export PATH=/usr/local/bin:/usr/local/share/python:/usr/local/sbin:$HADOOP_INSTALL/bin:/Users/praj/src/vert.x-1.0.1.final/bin:/Users/praj/src/loop:$PATH

export LOOP_HOME=/Users/praj/src/loop
export JAVA_HOME=$(/usr/libexec/java_home)
export JENKINS_HOME=/Users/praj/jenkins
export PATH="$HOME/.rbenv/bin:$PATH"
eval "$(rbenv init -)"
