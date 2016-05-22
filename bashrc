export CLICOLOR=1

# Allow editing the current command in vi with Esc then v
set -o vi

# Exports
export EDITOR=vim;
export HISTSIZE=32768;
export HISTFILESIZE="${HISTSIZE}";

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

# Print user and git info (only git stuff if in a git directory)
function ge() {
  printf "*** Session Info ***\n\n%8s: %s\n%8s: %s\n%8s: %s\n%8s: %s\n%8s: %s\n%8s: %s\n\n" \
    "Who" "$(whoami)" \
    "Host" "$(hostname)" \
    "OS" "$(uname)" \
    "Old Path" "$OLDPWD" \
    "Cur Path" "$PWD" \
    "DateTime" "$(date)"

  if [[ -e '.git' ]]; then
    printf "*** Git Status ***\n\n%10s: %s \n%10s: %s \n%10s: %s\n%10s: %s\n\n" \
      "Repo" "$(basename `git rev-parse --show-toplevel`)" \
      "Branch" "$(git rev-parse --abbrev-ref HEAD 2>/dev/null)" \
      "Uncommited" \
      "$(git status --porcelain 2>/dev/null | grep "^ M" | wc -l | tr -d '[[:space:]]')" \
      "Untracked" \
      "$(git ls-files --exclude-standard--others 2>/dev/null | wc -l | tr -d '[[:space:]]')"
  fi
}

export PS1=">>> "