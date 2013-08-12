export EDITOR=/usr/bin/vim
bindkey -v

export PATH="/usr/local/heroku/bin:node_modules/.bin:/usr/local/share/npm/bin:/usr/local/bin:/Users/neil/.rbenv/shims:/Users/neil/.rbenv/bin:$PATH"

# PATH="$HOME/.rbenv/bin:/Applications/Postgres.app/Contents/MacOS/bin:$PATH"
export PGHOST=localhost

# Colors
autoload -U colors
colors
setopt prompt_subst

# Prompt
local smiley="%(?,%{$fg[green]%}$%{$reset_color%},%{$fg[red]%}$%{$reset_color%})"

# %~ %{$fg[yellow]%} $(~/.rbenv/bin/rbenv version-name)$(~/bin/git-cwd-info.rb)%{$reset_color%}
PROMPT='
%~ $(~/bin/git-cwd-info.rb)%{$reset_color%}
${smiley}  %{$reset_color%}'

# RPROMPT='%{$fg[white]%} $(~/.rbenv/bin/rbenv version-name)$(~/bin/git-cwd-info.rb)%{$reset_color%}'
RPROMPT=''

# Show completion on first TAB
setopt menucomplete

# Load completions for Ruby, Git, etc.
autoload compinit
compinit

# Allows me to cd into projects
cdpath=(. ~/code/)
typeset -gU cdpath

eval "$(rbenv init -)"
source "$HOME/.rbenv/completions/rbenv.zsh"

# Aliases
alias ..='cd ..'
alias gs='git status'
alias be='bundle exec'
alias rs='bundle exec rails server'
alias rc='bundle exec rails console'
alias restart='touch tmp/restart.txt'
alias fs='foreman start'
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

source "/Users/neil/Dropbox/dotfiles/.heroku_shortcuts"
source "/Users/neil/Dropbox/dotfiles/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh"
