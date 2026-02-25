alias ls='ls --color=auto'

# History substring completions with arrow up and down keys
bindkey '^[[A' history-substring-search-up
bindkey '^[[B' history-substring-search-down

# Brew autoloadable functions (including completions)
FPATH="/opt/homebrew/share/zsh/site-functions:${FPATH}"

# Load compinit autocompletions
autoload -U compinit; compinit
_comp_options+=(globdots) # With hidden files

zstyle ':completion:*' menu select
zstyle ':completion:*' group-name ''
zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}
zstyle ':completion:*:descriptions' format '%U%F{magenta}%B→ %d%b%f%u'
zstyle ':completion:*:messages' format '%F{yellow}%d%f'
zstyle ':completion:*:corrections' format '%F{yellow}!- %d (errors: %e) -!%f'
zstyle ':completion:*:warnings' format '%F{red}✗ No matches%f'
zstyle ':completion:*:*:-command-:*:*' group-order aliases builtins functions commands
# Case-insensitive matching + partial matching
zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}' 'r:|[._-]=* r:|=*'

HISTSIZE=10000
SAVEHIST=10000
setopt SHARE_HISTORY
setopt HIST_IGNORE_ALL_DUPS

source "/opt/homebrew/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh"
source "/opt/homebrew/share/zsh-history-substring-search/zsh-history-substring-search.zsh"
source "/opt/homebrew/share/zsh-autosuggestions/zsh-autosuggestions.zsh"

eval "$(/opt/homebrew/bin/brew shellenv)"
eval "$(starship init zsh)"
