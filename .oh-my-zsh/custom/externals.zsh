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
source /usr/lib/ruby/gems/2.6.0/gems/tmuxinator-1.1.1/completion/tmuxinator.zsh

# Z
[[ -r "/usr/share/z/z.sh" ]] && source /usr/share/z/z.sh 
