#
# User configuration sourced by interactive shells
#

# Change default zim location
export ZIM_HOME=${ZDOTDIR:-${HOME}}/.zim

# Start zim
[[ -s ${ZIM_HOME}/init.zsh ]] && source ${ZIM_HOME}/init.zsh

export FZF_DEFAULT_COMMAND='fd --type f'
source /usr/share/fzf/completion.zsh
source /usr/share/fzf/key-bindings.zsh
alias pdfdiff="diffpdf"

# Add RVM to PATH for scripting. Make sure this is the last PATH variable change.
export PATH="$PATH:$HOME/.rvm/bin"
