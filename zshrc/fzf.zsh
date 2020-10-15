# Setup fzf
# ---------
if [[ ! "$PATH" == */home/xmichalx/.fzf/bin* ]]; then
  export PATH="${PATH:+${PATH}:}/home/xmichalx/.fzf/bin"
fi

# Auto-completion
# ---------------
[[ $- == *i* ]] && source "/home/xmichalx/.fzf/shell/completion.zsh" 2> /dev/null

# Key bindings
# ------------
source "/home/xmichalx/.fzf/shell/key-bindings.zsh"
