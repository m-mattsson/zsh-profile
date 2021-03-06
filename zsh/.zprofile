#
# Executes commands at login pre-zshrc.
#
# create symbolic links in $HOME
# ln -s ~/.config/zsh/zprofile ~/.zprofile
# ln -s ~/.config/zsh/zshrc ~/.zshrc

#set laptop hostname
#scutil --set HostName "dasher.batlogic"
#scutil --set LocalHostName "dasher"
#scutil --set ComputertName "Michael's Macbook Pro"


# Browser
if [[ "$OSTYPE" == darwin* ]]; then
  export BROWSER='open'
fi

# Editors
export EDITOR='nano'
export VISUAL='nano'
export PAGER='less'
# Cleanup
export ZDOTDIR="$HOME/.config/shells/zsh"
export PASSWORD_STORE_DIR="$HOME"

# Language
if [[ -z "$LANG" ]]; then
  export LANG='en_US.UTF-8'
fi

#
# Paths
#

# Ensure path arrays do not contain duplicates.
typeset -gU cdpath fpath mailpath path

# Set the list of directories that cd searches.
# cdpath=(
#   $cdpath
# )

# Set the list of directories that Zsh searches for programs.
path=(
  /usr/local/{bin,sbin}
  $path
)

#
# Less
#

# Set the default Less options.
# Mouse-wheel scrolling has been disabled by -X (disable screen clearing).
# Remove -X to enable it.
export LESS='-g -i -M -R -S -w -X -z-4'

# Set the Less input preprocessor.
# Try both `lesspipe` and `lesspipe.sh` as either might exist on a system.
if (( $#commands[(i)lesspipe(|.sh)] )); then
  export LESSOPEN="| /usr/bin/env $commands[(i)lesspipe(|.sh)] %s 2>&-"
fi

[[ -f $HOME/.config/my_hosts ]] && source $HOME/.config/my_hosts
