# Colors
autoload -U colors
colors
setopt prompt_subst

# PATH
export GOPATH=~/code/go
export PATH="node_modules/.bin:/usr/local/heroku/bin:/usr/local/share/npm/bin:/usr/local/bin:/Users/neil/.rbenv/shims::/Users/neil/.rbenv/bin:$PATH"
export PATH=${GOPATH//://bin:}/bin:$PATH
# export PATH=$(npm bin):$PATH
export PGHOST=localhost

# Prompt
local smiley="%(?,%{$fg[green]%}$%{$reset_color%},%{$fg[red]%}$%{$reset_color%})"
PROMPT='
%~ $(~/bin/git-cwd-info.rb)%{$reset_color%}
${smiley}  %{$reset_color%}'
RPROMPT=''

# Vim all the things
export EDITOR=/usr/bin/vim
bindkey -v
bindkey -M viins 'jj' vi-cmd-mode
bindkey '^R' history-incremental-search-backward

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
  MODE_INDICATOR="%{$fg[red]%}*%{$reset_color%}"
fi
function vi_mode_prompt_info() {
  echo "${${KEYMAP/vicmd/$MODE_INDICATOR}/(main|viins)/}"
}
if [[ "$RPS1" == "" && "$RPROMPT" == "" ]]; then
  RPS1='$(vi_mode_prompt_info)'
fi

# Show completion on first TAB
setopt menucomplete

# Load completions for Ruby, Git, etc.
autoload -U compinit && compinit

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

# Aliases
alias ..='cd ..'
alias makehash='dd if=/dev/urandom bs=32 count=1 2>/dev/null | openssl base64'
alias gs='git status'
alias be='bundle exec'
alias rs='bundle exec rails server'
alias rc='bundle exec rails console'
alias restart='touch tmp/restart.txt'
alias foreman='forego'
alias fs='forego start'
alias fr='forego run'
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
alias noorig="find . -name '*.orig' -delete"
alias git='gh'
alias gphm='git push heroku master'

# includes
source "/Users/neil/Dropbox/dotfiles/.heroku_shortcuts"
source "/Users/neil/Dropbox/dotfiles/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh"
