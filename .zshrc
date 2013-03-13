export EDITOR=/usr/bin/vim
bindkey -v

export PATH="$HOME/.rbenv/bin:$PATH"

# Colors
autoload -U colors
colors
setopt prompt_subst

# Prompt
local smiley="%(?,%{$fg[green]%}$%{$reset_color%},%{$fg[red]%}$%{$reset_color%})"

PROMPT='
%~
${smiley}  %{$reset_color%}'

RPROMPT='%{$fg[white]%} $(~/.rbenv/bin/rbenv version-name)$(~/bin/git-cwd-info.rb)%{$reset_color%}'

# Show completion on first TAB
setopt menucomplete

# Load completions for Ruby, Git, etc.
autoload compinit
compinit

eval "$(rbenv init -)"

# Aliases
alias ..='cd ..'
alias gs='git status'
alias be='bundle exec'
alias rs='bundle exec rails server'
alias rc='bundle exec rails console'
alias restart='touch tmp/restart.txt'
alias fs='bundle exec foreman start'
alias %=' '
alias flushdns='dscacheutil -flushcache'
alias h='heroku'
