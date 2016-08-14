export CLICOLOR=1
export TERM=xterm-256color

# Allow editing the current command in vi with Esc then v
set -o vi
shopt -s histappend
# Exports
export EDITOR=vim;

# Omit duplicates and commands that begin with a space from history.
export HISTCONTROL=ignoredups:erasedups

# Prefer GB English and use UTF-8.
export LANG='en_GB.UTF-8';
export LC_ALL='en_GB.UTF-8';

# Don’t clear the screen after quitting a manual page.
export MANPAGER='less -X';

# Filetree display
alias tree="ls -R | grep ":$" | sed -e 's/:$//' -e 's/[^-][^\/]*\//--/g' -e 's/^/ /' -e 's/-/|/'"

# Add tab completion for SSH hostnames based on ~/.ssh/config, ignoring wildcards
complete -o "default" -o "nospace" -W "$(grep "^Host" ~/.ssh/config | grep -v "[?*]" | cut -d " " -f2- | tr ' ' '\n')" scp sftp ssh;
