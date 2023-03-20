# export PATH=/usr/local/sbin:/usr/local/bin:$PATH
export EDITOR=nvim
export PYTHONIOENCODING='utf-8'
# export TERM=xterm-256color
export CLICOLOR=1
export LSCOLORS=fxfxcxdxbxegedabagacad
export KEYTIMEOUT=1

typeset -U PATH

# history
export HISTFILE=~/.zsh_history
export HISTSIZE=100000
export SAVEHIST=100000
export HISTORY_IGNORE='(exit|history*|clear)'
setopt share_history        # Share history betwen multiple termional sessions
setopt append_history       # Append history, instead of replace, when a terminal exits
setopt inc_append_history   # Add commands as they are typed, don't wait until shell exit
setopt hist_ignore_space    # Ignore commands with a space before
setopt hist_ignore_all_dups # Remove the old entry and append the new one
setopt hist_find_no_dups    # When searching history don't display duplicates
setopt hist_reduce_blanks   # Remove extra blanks from each command line in history
setopt extended_history     # Add timestamps to history
setopt hist_verify

# options
setopt prompt_subst         # Enable parameter expansion, command substitution, and arithmetic expansion in the prompt
setopt complete_in_word     # Allow completion from within a word/phrase
setopt always_to_end        # When completing from the middle of a word, move the cursor to the end of the word
setopt auto_pushd           # Make cd push the old directory onto the directory stack
setopt interactive_comments # Allow comments even in interactive shells
setopt notify               # Report the status of background jobs immediately, rather than waiting until just before printing a prompt
setopt long_list_jobs       # List jobs in the long format
setopt local_options        # Allow functions to have local options
setopt local_traps          # Allow functions to have local traps
setopt complete_aliases     # Required for alias completion: m c<TAB>
setopt no_list_beep
setopt globdots             # Show hidden files

# Vi mode
bindkey -v
# Close completion menu by Esc
zmodload zsh/complist
bindkey -M menuselect '\e' send-break
# Vi command mode by default
# zle-line-init() { zle -K vicmd; }
# zle -N zle-line-init

# Disable execute-named-cmd prompt (execute: _)
bindkey -a -r ':'

# Plugins
fpath+=$HOME/.config/zsh/pure

# Completions
autoload -Uz compinit && compinit
autoload -U promptinit; promptinit
# Shift-Tab reverse menu completion
bindkey '^[[Z' reverse-menu-complete
# Completion style
zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}
zstyle ':completion:*:warnings' format 'No matches found'
zstyle ':completion:*' menu select
zstyle ':completion:*:approximate:*' max-errors 1 numeric

prompt pure

alias ll='ls -lFh'
alias lh='ls -ld .??*'
alias bc='bc -lq ~/.config/bc/config'
alias conf='egrep -v "^#|^$"'
alias vim="nvim"
alias vi="nvim"
alias qrencode="qrencode -t UTF8i"
