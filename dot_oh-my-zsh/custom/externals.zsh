#FZF
eval "$(fzf --zsh)" 

eval `keychain --eval -q --agents "ssh,gpg"`

# mise
eval "$(mise activate zsh)"

# Starship
eval "$(starship init zsh)"
