#================================================
#
#  .bashrc - collection of bash configurations
#
#  Deep Aggarwal (deep.uiuc@gmail.com)
#  Last modified  Oct 4, 2015
#
#================================================

# System-wide .bashrc file for interactive bash(1) shells.
if [ -z "$PS1" ]; then
   return
fi

#export TERM=xterm-color
export TERM=screen-256color

#Get color in "ls" command
#export CLICOLOR=1
#alias ls='ls -color'
PATH=$PATH:/Applications/gedit.app/Contents/MacOS/
   
#PS1='\h:\W \u\$ '
PS1='[deep]:\[\e[1;36m\]\W\[\e[m\]$ '

# Make bash check its window size after a process completes
shopt -s checkwinsize
# Tell the terminal about the working directory at each prompt.
if [ "$TERM_PROGRAM" == "Apple_Terminal" ] && [ -z "$INSIDE_EMACS" ]; then
    update_terminal_cwd() {
        # Identify the directory using a "file:" scheme URL,
        # including the host name to disambiguate local vs.
        # remote connections. Percent-escape spaces.
	local SEARCH=' '
	local REPLACE='%20'
	local PWD_URL="file://$HOSTNAME${PWD//$SEARCH/$REPLACE}"
	printf '\e]7;%s\a' "$PWD_URL"
    }
    PROMPT_COMMAND="update_terminal_cwd; $PROMPT_COMMAND"
fi

#Avoid duplicates..
export HISTCONTROL=ignoredups:erasedups
export HISTSIZE=100000                   # big big history
export HISTFILESIZE=$HISTSIZE            # big big history

#Append history entries..
shopt -s histappend

#After each command, save and reload history
export PROMPT_COMMAND="history -a; history -c; history -r; $PROMPT_COMMAND"

#Some of my aliases
alias ll="ls -lth"
alias lla="ll -a"
alias tn="tmux new -s"          #tmux new -s session_name           # make new named session
alias ta="tmux attach -t"       #tmux attach -t session_name        # attach to exist session (allowing shared sessions)
alias tk="tmux kill-session -t" #tmux kill-session -t session_name  # kill named session
alias tl="tmux ls"              #tmux ls                            # list running tmux sessions

#Add Golang related paths
export GOPATH=/Users/deep/Documents/wrProjects/go
export GOROOT=/usr/local/go
PATH=$PATH:$GOROOT/bin:$GOPATH:$GOROOT

### Added by the Heroku Toolbelt
export PATH="/usr/local/heroku/bin:$PATH"

#Add path to go_appengine
export PATH=/Users/deep/go_appengine:$PATH

### Execute the git autocomplete script if it exists
if [ -f ~/.git-completion.bash ]; then
    . ~/.git-completion.bash
fi
