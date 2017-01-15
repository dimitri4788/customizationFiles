#================================================
#
#  .bashrc - collection of bash configurations
#
#  Deep Aggarwal (deep.uiuc@gmail.com)
#  Last modified  March 27th, 2016
#
#================================================

# System-wide .bashrc file for interactive bash(1) shells.
if [ -z "$PS1" ]; then
   return
fi

#export TERM=xterm-color
export TERM=screen-256color

#export CLICOLOR=1
PATH=$PATH:/Applications/gedit.app/Contents/MacOS/

#Show git information in status
function parse_git_dirty
{
    [[ $(git status 2> /dev/null | tail -n1) != "nothing to commit (working directory clean)" ]] && echo ""
}
function parse_git_branch
{
    git branch --no-color 2> /dev/null | sed -e '/^[^*]/d' -e "s/* \(.*\)/[\1$(parse_git_dirty)]/"
}
#PS1='\h:\W \u\$ '
#PS1='[deep]:\[\e[1;36m\]\W\[\e[m\]$ '
#PS1='[deep]:\[\e[1;36m\]\W\[\e[m\]$(parse_git_branch)$ '
PS1='[deep]:\[\e[1;36m\]\W\[\e[m\]:\[\e[34m\]$(parse_git_branch)\[\e[m\]$ '

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

# Handy Extract Program.
function extract()
{
	if [ -f $1 ] ; then
		case $1 in
			*.tar.bz2)   tar xvjf $1     ;;
			*.tar.gz)    tar xvzf $1     ;;
			*.bz2)       bunzip2 $1      ;;
			*.rar)       unrar x $1      ;;
			*.gz)        gunzip $1       ;;
			*.tar)       tar xvf $1      ;;
			*.tbz2)      tar xvjf $1     ;;
			*.tgz)       tar xvzf $1     ;;
			*.zip)       unzip $1        ;;
			*.Z)         uncompress $1   ;;
			*.7z)        7z x $1         ;;
			*)           echo "'$1' cannot be extracted via >extract<" ;;
		esac
	else
		echo "'$1' is not a valid file"
	fi
}

#Avoid duplicates..
export HISTCONTROL=ignoredups:erasedups
export HISTSIZE=100000                   # big big history
export HISTFILESIZE=$HISTSIZE            # big big history

#Append history entries..
shopt -s histappend

#After each command, save and reload history
export PROMPT_COMMAND="history -a; history -c; history -r; $PROMPT_COMMAND"

# LS AND DIRCOLORS
LS_COMMON="-hBG"

#Some of my aliases
alias ls="ls $LS_COMMON"
alias ll="ls -lthT $LS_COMMON"
alias lla="ll -a $LS_COMMON"
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

### Add boost path
export PATH="/usr/local/Cellar/boost/1.58.0/lib:$PATH"
export PATH="/usr/local/Cellar/boost/1.58.0/include:$PATH"

### gtk related
#export PKG_CONFIG_PATH="/usr/local/Cellar/cairo/1.14.2/lib/pkgconfig:$PKG_CONFIG_PATH"
export PKG_CONFIG_PATH="/opt/X11/lib/pkgconfig/:$PKG_CONFIG_PATH"
export PKG_CONFIG_PATH="/usr/local/lib/pkgconfig:/opt/X11/lib/pkgconfig/:$PKG_CONFIG_PATH"

### Execute the git autocomplete script if it exists
if [ -f ~/.git-completion.bash ]; then
    . ~/.git-completion.bash
fi

#Alias for Wolfram working directory
alias wr="cd /Users/deep/Documents/wrProjects/licensing-server"

#Add Postgres path
PATH="/Applications/Postgres.app/Contents/Versions/9.4/bin:$PATH"

#Aliases to open and remove the database file for Licensing Server project XXX
alias oo="open /Users/deep/Documents/wrProjects/licensing-server/lib/LSDB.db"
alias rr="rm /Users/deep/Documents/wrProjects/licensing-server/lib/LSDB.db"

#pushd and popd aliases
alias pu="pushd ."
alias po="popd"

#GTK+ stuff
export PATH="/Users/deep/.local/bin:$PATH"

#Add PYTHONPATH
#It augments the default search path for module files. The format is the same as the shell’s PATH.
export PYTHONPATH="$PYTHONPATH:/usr/local/google_appengine"

export PATH="$PATH:$HOME/.rvm/bin" # Add RVM to PATH for scripting
