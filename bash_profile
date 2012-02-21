source ~/.bash/aliases
source ~/.bash/completions
source ~/.bash/paths
source ~/.bash/config

if [ -f ~/.bashrc ]; then
  . ~/.bashrc
fi

if [ -f ~/.localrc ]; then
  . ~/.localrc
fi

# Git Colour Coding

RED="\[\033[0;31m\]"
YELLOW="\[\033[0;33m\]"
GREEN="\[\033[0;32m\]"
BLUE="\[\033[0;34m\]"
LIGHT_RED="\[\033[1;31m\]"
LIGHT_GREEN="\[\033[1;32m\]"
WHITE="\[\033[1;37m\]"
LIGHT_GRAY="\[\033[0;37m\]"
COLOR_NONE="\[\e[0m\]"
 
function parse_git_branch {
  git rev-parse --git-dir &> /dev/null
  git_status="$(git status 2> /dev/null)"
  branch_pattern="^# On branch ([^${IFS}]*)"
  remote_pattern="# Your branch is (.*) of"
  diverge_pattern="# Your branch and (.*) have diverged"
  if [[ ! ${git_status}} =~ "working directory clean" ]]; then
    state=" ${RED}⚡"
  fi
  # add an else if or two here if you want to get more specific
  if [[ ${git_status} =~ ${remote_pattern} ]]; then
    if [[ ${BASH_REMATCH[1]} == "ahead" ]]; then
      remote=" ${YELLOW}↑"
    else
      remote=" ${YELLOW}↓"
    fi
  fi
  if [[ ${git_status} =~ ${diverge_pattern} ]]; then
    remote=" ${YELLOW}↕"
  fi
  if [[ ${git_status} =~ ${branch_pattern} ]]; then
    branch=${BASH_REMATCH[1]}
    echo " (${branch})${remote}${state}"
  fi
}
 
function prompt_func() {
    previous_return_value=$?;
    prompt="${TITLEBAR} \w${GREEN}$(parse_git_branch) ${COLOR_NONE} "
    if test $previous_return_value -eq 0
    then
        PS1="${prompt}➔ "
    else
        PS1="${prompt} ${RED}➔${COLOR_NONE} "
    fi
    
    PS1="\$(~/.rvm/bin/rvm-prompt i v g) $PS1"
}
 
PROMPT_COMMAND=prompt_func
export ARCHFLAGS="-arch x86_64"
#export PATH=/usr/local/git/bin:$PATH
	
export GEM_PRIVATE_KEY='~/.ssh/gem-private_key.pem'
export GEM_CERTIFICATE_CHAIN='~/.ssh/gem-public_cert.pem'
export PATH

[[ -s "$HOME/.rvm/scripts/rvm" ]] && . "$HOME/.rvm/scripts/rvm" # This loads RVM into a shell session.