. ~/.zsh/config
. ~/.zsh/aliases
. ~/.zsh/completion

mvim() {
 (unset GEM_PATH GEM_HOME; command mvim "$@")
}

hitch() {
  command hitch "$@"
  if [[ -s "$HOME/.hitch_export_authors" ]] ; then source "$HOME/.hitch_export_authors" ; fi
}
alias unhitch='hitch -u'
# Uncomment to persist pair info between terminal instances
# # hitch

export EDITOR='subl'

# use .localrc for settings specific to one system
[[ -f ~/.localrc ]] && .  ~/.localrc
[[ -s $HOME/.tmuxinator/scripts/tmuxinator ]] && source $HOME/.tmuxinator/scripts/tmuxinator