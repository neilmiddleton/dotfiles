# Colors
autoload -U colors
colors
setopt prompt_subst

# Prompt
local smiley="%(?,%{$fg[green]%}$%{$reset_color%},%{$fg[red]%}$%{$reset_color%})"
PROMPT='
%~ $(~/bin/git-cwd-info.rb)%{$reset_color%}
${smiley}  %{$reset_color%}'
RPROMPT=''

# Vim all the things
export EDITOR=/usr/bin/vim
bindkey -v

function zle-keymap-select zle-line-init zle-line-finish {
  if (( ${+terminfo[smkx]} )); then
    printf '%s' ${terminfo[smkx]}
  fi
  if (( ${+terminfo[rmkx]} )); then
    printf '%s' ${terminfo[rmkx]}
  fi
  zle reset-prompt
  zle -R
}

zle -N zle-line-init
zle -N zle-line-finish
zle -N zle-keymap-select
if [[ "$MODE_INDICATOR" == "" ]]; then
  MODE_INDICATOR="%{$fg[red]%}[ VIM ]%{$reset_color%}"
fi
function vi_mode_prompt_info() {
  echo "${${KEYMAP/vicmd/$MODE_INDICATOR}/(main|viins)/}"
}
if [[ "$RPS1" == "" && "$RPROMPT" == "" ]]; then
  RPS1='$(vi_mode_prompt_info)'
fi

# PATH
export GOROOT=/usr/local/go
export PATH="/usr/local/heroku/bin:node_modules/.bin:/usr/local/share/npm/bin:/usr/local/bin:/Users/neil/.rbenv/shims:/usr/local/share/python:/Users/neil/.rbenv/bin:$PATH"
export PATH=$PATH:$GOROOT/bin
export GOPATH="/usr/local"
export PGHOST=localhost

# Show completion on first TAB
setopt menucomplete

# Load completions for Ruby, Git, etc.
autoload compinit
compinit

# Allows me to cd into projects
cdpath=(. ~/code/)
typeset -gU cdpath

# rbenv
eval "$(rbenv init -)"
source "$HOME/.rbenv/completions/rbenv.zsh"

# history
HISTSIZE=1000
SAVEHIST=1000
HISTFILE=~/.history

setopt inc_append_history
# setopt share_history

# Aliases
alias ..='cd ..'
alias gs='git status'
alias be='bundle exec'
alias rs='bundle exec rails server'
alias rc='bundle exec rails console'
alias restart='touch tmp/restart.txt'
alias fs='forego start'
alias %=' '
alias flushdns='dscacheutil -flushcache'
alias h='heroku'
alias hs='heroku sudo'
alias git='hub'
alias gitd='git daemon --reuseaddr --base-path=/Users/neil/code'
alias new_password='heroku sudo user:send_reset_password_email -u'
alias gppm='git push production master'
alias nr='hs addons:open newrelic:standard -a'
alias nrp='hs addons:open newrelic:professional -a'
alias vim='/usr/local/Cellar/vim/7.4/bin/vim'

# includes
source "/Users/neil/Dropbox/dotfiles/.heroku_shortcuts"
source "/Users/neil/Dropbox/dotfiles/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh"

# added by travis gem
source /Users/neil/.travis/travis.sh
