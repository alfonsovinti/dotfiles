# history filepath
export HISTFILE="$XDG_DATA_HOME/zsh/history"
# maximum events for internal history
export HISTSIZE=1200 #10000
# maximum events in history file
export SAVEHIST=1000 #10000
# write the history file in the ':start:elapsed;command' format.
setopt EXTENDED_HISTORY
# share history between all sessions.
setopt SHARE_HISTORY
# append history from all sessions
setopt APPEND_HISTORY
# expire a duplicate event first when trimming history.
setopt HIST_EXPIRE_DUPS_FIRST
# do not record an event that was just recorded again.
#setopt HIST_IGNORE_DUPS
# delete an old recorded event if a new event is a duplicate.
#setopt HIST_IGNORE_ALL_DUPS
# do not display a previously found event.
#setopt HIST_FIND_NO_DUPS
# do not record an event starting with a space.
#setopt HIST_IGNORE_SPACE
# do not write a duplicate event to the history file.
#setopt HIST_SAVE_NO_DUPS
# do not execute immediately upon history expansion.
#setopt HIST_VERIFY
