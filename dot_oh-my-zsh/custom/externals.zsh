#FZF
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

source /usr/share/fzf/key-bindings.zsh

#Powerline
#powerline-daemon -q
#source /usr/lib/python3.6/site-packages/powerline/bindings/zsh/powerline.zsh

eval `keychain --eval -q --agents "ssh,gpg"`
#eval `keychain -q` 


# added by travis gem
#[ -f /home/romain/.travis/travis.sh ] && source /home/romain/.travis/travis.sh


# Pew autocompletion
source $(pew shell_config)

# Tmuxinator
# source /home/romain/.gem/ruby/2.6.0/gems/tmuxinator-1.1.3/completion/tmuxinator.zsh

# Goto
#source "$HOME/.oh-my-zsh/custom/externals/goto/goto.sh"

# Z
[[ -r "/usr/share/z/z.sh" ]] && source /usr/share/z/z.sh 


# PipX
autoload -U bashcompinit
bashcompinit
eval "$(register-python-argcomplete pipx)"

# asdf
source /opt/asdf-vm/asdf.sh

function ssh_jump() {
  ssh -A -J $1 -o "UserKnownHostsFile=/dev/null" -o "StrictHostKeyChecking=no" $2
}

# Nix
source /home/romain/.nix-profile/etc/profile.d/nix.sh
