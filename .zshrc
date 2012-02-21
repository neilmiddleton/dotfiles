. ~/.zsh/config
. ~/.zsh/aliases
. ~/.zsh/completion

mvim() {
 (unset GEM_PATH GEM_HOME; command mvim "$@")
}

# use .localrc for settings specific to one system
[[ -f ~/.localrc ]] && .  ~/.localrc
