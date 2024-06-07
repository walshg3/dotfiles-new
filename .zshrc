# zsh
export ZSH="$HOME/.oh-my-zsh"
#FPATH="$(brew --prefix)/share/zsh/site-functions:${FPATH}"


source ~/.zsh/catppuccin_frappe-zsh-syntax-highlighting.zsh
#source /opt/homebrew/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
ZSH_AUTOSUGGEST_STRATEGY=(history completion)
#source /opt/homebrew/share/zsh-autosuggestions/zsh-autosuggestions.zsh
export FZF_BASE=/opt/homebrew/bin/fzf
export BAT_THEME="Catppuccin-frappe"
#Enables history saving
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=$HISTSIZE
setopt appendhistory
setopt share_history #share history between multiple instances of zsh
setopt HIST_IGNORE_ALL_DUPS

# Source environment
if [ -f "$HOME"/.zshenv ]; then
	source "$HOME"/.zshenv
fi


# source grc
[[ -s "/etc/grc.zsh" ]] && source /etc/grc.zsh

# Source aliases
if [ -f "$HOME"/.aliases ]; then
  source ~/.aliases
fi

# Source functions
if [ -f "$HOME"/.functions ]; then
	source "$HOME"/.functions
fi

##
#
# Znap plugin management
#
##
# Source zsh plugi# Download Znap, if it's not there yet.
[[ -f ~/.config/zsnap/zsh-snap/znap.zsh ]] ||
    git clone --depth 1 -- \
        https://github.com/marlonrichert/zsh-snap.git ~/.config/zsnap/zsh-snap

# Start znap
source ~/.config/zsnap/zsh-snap/znap.zsh




# oh my zsh plugins
plugins=(
git sudo web-search history macos zsh-navigation-tools zsh-interactive-cd
web-search wd vscode urltools universalarchive tig themes
rsync ripgrep react-native pip nvm npm node ng gitignore
github git-prompt git-flow fzf dotnet docker command-not-found
colorize colored-man-pages brew ssh zsh-ssh zsh-autosuggestions zsh-syntax-highlighting eza)

fpath+=${ZSH_CUSTOM:-${ZSH:-~/.oh-my-zsh}/custom}/plugins/zsh-completions/src
source $ZSH/oh-my-zsh.sh

if type brew &>/dev/null; then
  FPATH=$(brew --prefix)/share/zsh/site-functions:$FPATH

  autoload -Uz compinit
    rm -f ~/.zcompdump; compinit
fi



if [ "$TMUX" = "" ]; then command -v tmux && tmux; fi

# fastfetch

# plugins=(
#     git
#     colored-man-pages
#     fzf
#     zsh-ssh
#     $plugins
# )

# ZSH_COLORIZE_TOOL="chroma"
# colorize
source ~/.config/grc.zsh
export LS_COLORS="$(vivid generate catppuccin-mocha)"
#export LS_COLORS="$(vivid generate catppuccin-macchiato)"
#export LS_COLORS="$(vivid generate catppuccin-latte)"
# export LS_COLORS="$(vivid generate snazzy)"

#FZF
#export FZF_DEFAULT_COMMAND="fd . $HOME"
export FZF_DEFAULT_COMMAND="fd --type f --strip-cwd-prefix --hidden --follow --exclude '.git' --exclude '/Library/**' "
#export FZF_DEFAULT_COMMAND='rg --files --hidden 2> /dev/null'
export FZF_DEFAULT_OPTS="
--layout=reverse
--info=inline
--height=80%
--multi
--color=fg:#cad3f5,header:#ed8796,info:#c6a0f6,pointer:#f4dbd6 \
--color=marker:#f4dbd6,fg+:#cad3f5,prompt:#c6a0f6,hl+:#ed8796 \
--color=bg+:#363a4f,bg:#24273a,spinner:#f4dbd6,hl:#ed8796 
--preview-window=:hidden
--preview '([[ -f {} ]] && (bat --style=numbers --color=always {} || cat {})) || ([[ -d {} ]] && (tree -C {} | less)) || echo {} 2> /dev/null | head -200'
--prompt='∼ ' --pointer='▶' --marker='✓'
--bind '?:toggle-preview'
--bind 'ctrl-a:select-all'
--bind 'ctrl-y:execute-silent(echo {+} | pbcopy)'
--bind 'ctrl-e:execute(echo {+} | xargs -o vim)'
--bind 'ctrl-v:execute(code {+})'
"


export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
export FZF_ALT_C_COMMAND="fd -t d . $HOME"

#[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
source <(fzf --zsh)




# # Chroma Term
# alias ssh="ct ssh"



#spaceship
# source "/usr/local/opt/spaceship/spaceship.zsh"

#starship
eval "$(starship init zsh)"
#eval "$(oh-my-posh init zsh)"




# The Fuck
eval $(thefuck --alias)

# alias
alias nmap='grc nmap'
# alias cat='ccat'
alias ls='eza -a --color=always --group-directories-first --icons'
#alias ls='eza --icons'
alias ll='eza -l'
# sort by size
alias lls='eza -lS'
# sort by date
alias lld='eza -lD'

alias la='eza -la'
alias l='eza -l'
alias lsd='eza -d */'
alias lla='eza -la'



# Chroma Term
# alias ssh="ct ssh"

alias vi="nvim"

# zstyle ':completion:*' menu yes select
# zstyle ':completion::complete:*' use-cache 1                    #enables completion caching
# zstyle ':completion::complete:*' cache-path ~/.zsh/cache
# autoload -Uz compinit && compinit -i


alias shopt='/Users/gregwalsh/git/Zshopt/shopt'
export PATH="/opt/homebrew/opt/openjdk/bin:$PATH"
export VISUAL=vim
export EDITOR=vim

